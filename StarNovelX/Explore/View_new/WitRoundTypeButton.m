//
//  WitRoundTypeButton.m
//  StarNovelX
//
//  Created by Martin Liu on 2023/2/2.
//

#import "WitRoundTypeButton.h"

@implementation WitRoundTypeButton

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self addSubview:self.cellBlock];
    [self.cellBlock addSubview:self.itemIcon];
    [self.cellBlock addSubview:self.itemTitle];
    
    [self.cellBlock mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.top.mas_equalTo(self);
        make.bottom.mas_equalTo(self);
    }];
    self.cellBlock.layer.cornerRadius = self.frame.size.width / 2;
    self.cellBlock.layer.masksToBounds = YES;
    self.cellBlock.backgroundColor = [UIColor systemGray4Color];
    
    CGFloat padding = self.frame.size.width * 0.15;
    [self.itemIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(padding);
        make.right.mas_equalTo(self).mas_offset(-padding);
        make.top.mas_equalTo(self).mas_offset(padding);
        make.height.mas_equalTo(self.mas_width).multipliedBy(0.7);
    }];
    
    self.itemIcon.backgroundColor = [UIColor whiteColor];
    self.itemIcon.layer.cornerRadius = padding / 0.15 * 0.35;
    self.itemIcon.layer.masksToBounds = YES;
    
    [self.itemTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.itemIcon.mas_bottom).mas_offset(padding - 4);
        make.centerX.mas_equalTo(self);
        make.width.mas_offset(18);
    }];
    [self.itemTitle setNumberOfLines:0];
    [self.itemTitle setTextAlignment:NSTextAlignmentCenter];
    
    
    
    
}

#pragma mark - 懒加载
- (UIView *)cellBlock{
    if(!_cellBlock){
        _cellBlock = UIView.new;
    }
    return _cellBlock;
}

- (UIImageView *)itemIcon{
    if(!_itemIcon){
        _itemIcon = [[UIImageView alloc]init];
    }
    return _itemIcon;
}

- (UILabel *)itemTitle{
    if(!_itemTitle){
        _itemTitle = [[UILabel alloc]init];
    }
    return _itemTitle;
}

@end
