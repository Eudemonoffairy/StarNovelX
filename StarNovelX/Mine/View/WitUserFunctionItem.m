//
//  WitUserFunctionItem.m
//  StarNovelX
//
//  Created by Martin Liu on 2023/1/31.
//

#import "WitUserFunctionItem.h"

@implementation WitUserFunctionItem
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self addSubview:self.itemIcon];
    [self addSubview:self.opName];

    
   
    [self.itemIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(12);
        make.top.mas_equalTo(self.mas_top).mas_offset(8);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-8);
        make.width.mas_equalTo(self.mas_height).mas_offset(-16);
    }];
    
    self.itemIcon.layer.cornerRadius = 8;
    self.itemIcon.layer.masksToBounds = YES;
    
    [self.opName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.itemIcon.mas_right).mas_offset(12);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
}

- (UIImageView *)itemIcon{
    if(!_itemIcon){
        _itemIcon = [[UIImageView alloc]init];
    }
    return _itemIcon;
}

- (UILabel *)opName{
    if(!_opName){
        _opName = [[UILabel alloc]init];
    }
    return _opName;
}

@end
