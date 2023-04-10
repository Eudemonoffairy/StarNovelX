//
//  WitBottomMenu.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/9.
//

#import "WitBottomMenu.h"

@implementation WitBottomMenu
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self addSubview:self.showCatalogButton];
    [self addSubview:self.switchDisplayButton];
    [self addSubview:self.moreSettingButton];
    
    NSUInteger buttonWidth = (SCREEN_WIDTH - 80) / 8;
    [self.showCatalogButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(12);
        make.width.mas_offset(buttonWidth * 2);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-32);
        make.left.mas_equalTo(self.mas_left).mas_offset(24);
    }];
    self.showCatalogButton.layer.cornerRadius = 16;
    self.showCatalogButton.layer.masksToBounds = YES;
    
    [self.switchDisplayButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.showCatalogButton.mas_top);
        make.left.mas_equalTo(self.showCatalogButton.mas_right).mas_offset(16);
        make.width.mas_equalTo(buttonWidth * 3);
        make.bottom.mas_equalTo(self.showCatalogButton.mas_bottom);
    }];
    self.switchDisplayButton.layer.cornerRadius = 16;
    self.switchDisplayButton.layer.masksToBounds = YES;
    
    
    [self.moreSettingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.showCatalogButton.mas_top);
        make.left.mas_equalTo(self.switchDisplayButton.mas_right).mas_offset(16);
        make.width.mas_equalTo(buttonWidth * 3);
        make.bottom.mas_equalTo(self.showCatalogButton.mas_bottom);
    }];
    self.moreSettingButton.layer.cornerRadius = 16;
    self.moreSettingButton.layer.masksToBounds = YES;
}

#pragma mark - 懒加载
- (UIButton *)showCatalogButton{
    if(!_showCatalogButton){
        _showCatalogButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_showCatalogButton setTitle:@"目录" forState:UIControlStateNormal];
        [_showCatalogButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _showCatalogButton.backgroundColor = [UIColor systemBlueColor];
        _showCatalogButton.titleLabel.font = [UIFont font_15];
    }
    return _showCatalogButton;
}

- (UIButton *)switchDisplayButton{
    if(!_switchDisplayButton){
        _switchDisplayButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_switchDisplayButton setTitle:@"日间模式" forState:UIControlStateNormal];
        [_switchDisplayButton setTitle:@"夜间模式" forState:UIControlStateSelected];
        [_switchDisplayButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_switchDisplayButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        _switchDisplayButton.backgroundColor = [UIColor systemBlueColor];
    }
    return _switchDisplayButton;
}

- (UIButton *)moreSettingButton{
    if(!_moreSettingButton){
        _moreSettingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreSettingButton setTitle:@"更多设置" forState:UIControlStateNormal];
        [_moreSettingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _moreSettingButton.backgroundColor = [UIColor systemBlueColor];
        
        [_moreSettingButton addTarget:self action:@selector(showMoreMenu) forControlEvents:UIControlEventTouchUpInside];
    }
    return  _moreSettingButton;
}

#pragma 菜单方法
-(void)showMoreMenu{
    NSLog(@"显示更多菜单");
    NSNotification *notice = [NSNotification notificationWithName:@"TOGGLEMENU" object:nil];
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}



@end
