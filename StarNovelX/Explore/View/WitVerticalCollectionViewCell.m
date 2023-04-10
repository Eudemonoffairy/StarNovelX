//
//  WitClassifyCell.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/8/28.
//

#import "WitVerticalCollectionViewCell.h"

@implementation WitVerticalCollectionViewCell

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self addSubview:self.cellImg];
    [self addSubview:self.cellTitle];
    
    [self.cellImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(2);
        make.right.mas_equalTo(self.mas_right).mas_offset(-2);
        make.top.mas_equalTo(self.mas_top).mas_offset(2);
        if(self.type == CLASSIFY_CELL){
            make.height.mas_equalTo(self.mas_width).mas_offset(-8);
        }
        else{
            make.height.mas_equalTo(self.mas_width).mas_offset(-8).multipliedBy(1.25);
        }
//        make.height.mas_equalTo(self.cellImg.mas_width).multipliedBy(1.25);
    }];
    self.cellImg.layer.cornerRadius = 8;
    self.cellImg.layer.masksToBounds = YES;
    
    [self.cellTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.cellImg.mas_left);
        make.top.mas_equalTo(self.cellImg.mas_bottom).mas_offset(4);
        make.right.mas_equalTo(self.cellImg.mas_right);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-4);
    }];
//    self.cellImg.backgroundColor = [UIColor greenColor];
//    self.cellTitle.backgroundColor = [UIColor yellowColor];
}
-(void)setImage:(UIImageView *)cellImg AndTitle:(NSString *)cellTitle{
    self.cellImg = cellImg;
    self.cellTitle.text = cellTitle;
}




#pragma mark -懒加载
- (UIImageView *)cellImg{
    if(!_cellImg){
        _cellImg = [[UIImageView alloc]init];
        _cellImg.contentMode = UIViewContentModeScaleToFill;
    }
    return _cellImg;
}
- (UILabel *)cellTitle{
    if(!_cellTitle){
        _cellTitle = [[UILabel alloc]init];
        _cellTitle.textAlignment = NSTextAlignmentCenter;
    }
    return _cellTitle;
}
@end
