//
//  WitTextFieldWithLabel.m
//  StarNovelX
//
//  Created by Martin Liu on 2023/2/1.
//

#import "WitTextFieldWithLabel.h"

@interface WitTextFieldWithLabel ()<UITextFieldDelegate>

@end

@implementation WitTextFieldWithLabel
- (void)drawRect:(CGRect)rect{
    [self addSubview:self.itemTitle];
    [self addSubview:self.itemContent];
    [self.itemTitle mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self);
        make.top.mas_equalTo(self);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.36);
        make.height.mas_equalTo(self.mas_height);
    }];
    
    
    [self.itemContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.itemTitle.mas_right);
        make.right.mas_equalTo(self.mas_right);
        make.top.mas_equalTo(self);
        make.bottom.mas_equalTo(self);
    }];
    
    self.itemContent.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.itemContent.delegate = self;
    
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.backgroundColor = [[UIColor systemGray3Color] CGColor];
    bottomBorder.frame = CGRectMake(0, self.itemContent.frame.size.height - 1, self.itemContent.frame.size.width, 1);
    [self.itemContent.layer addSublayer:bottomBorder];
    
    
    
    
}


#pragma mark - 懒加载
- (UILabel *)itemTitle{
    if(!_itemTitle){
        _itemTitle = [[UILabel alloc]init];
    }
    return _itemTitle;
}

- (UITextField *)itemContent{
    if(!_itemContent){
        _itemContent = [[UITextField alloc]init];
    }
    return _itemContent;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
