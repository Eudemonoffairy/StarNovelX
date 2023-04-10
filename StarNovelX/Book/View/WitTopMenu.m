//
//  WitTopMenu.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/9.
//

#import "WitTopMenu.h"

@implementation WitTopMenu
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self addSubview:self.backButton];
    [self addSubview:self.addBookShelfButton];
    
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(8);
        make.top.mas_equalTo(self.mas_top).mas_offset(30);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-10);
        make.width.mas_offset(72);
    }];
    self.backButton.layer.cornerRadius = 12;
    self.backButton.layer.masksToBounds = YES;
    
    [self.addBookShelfButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).mas_offset(-8);
        make.top.mas_equalTo(self.backButton.mas_top);
        make.bottom.mas_equalTo(self.backButton.mas_bottom);
        make.width.mas_equalTo(96);
    }];
    self.addBookShelfButton.layer.cornerRadius = 12;
    self.addBookShelfButton.layer.masksToBounds = YES;
}

#pragma mark - 懒加载
- (UIButton *)backButton{
    if(!_backButton){
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setTitle:@"<  返回" forState:UIControlStateNormal];
        [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _backButton.titleLabel.font = [UIFont font_15];
        _backButton.backgroundColor = [UIColor systemBlueColor];
    }
    return  _backButton;
}

- (UIButton *)addBookShelfButton{
    if(!_addBookShelfButton){
        _addBookShelfButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addBookShelfButton setTitle:@"加入书架" forState:UIControlStateNormal];
        [_addBookShelfButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_addBookShelfButton setTitle:@"已加入书架" forState:UIControlStateSelected];
        _addBookShelfButton.titleLabel.font = [UIFont font_15];
        _addBookShelfButton.backgroundColor = [UIColor systemBlueColor];
    }
    return _addBookShelfButton;
}


@end
