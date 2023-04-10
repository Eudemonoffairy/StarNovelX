//
//  WitUserInfoBlockView.m
//  StarNovelX
//
//  Created by Martin Liu on 2023/1/31.
//

#import "WitUserInfoBlockView.h"

@implementation WitUserInfoBlockView


- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self addSubview:self.avatar];
    [self addSubview:self.username];
    [self addSubview:self.loginButton];
    
    [self.avatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(20);
        make.top.mas_equalTo(self.mas_top).mas_offset(10);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-10);
        make.width.mas_equalTo(self.mas_height).offset(-20);
    }];
    self.avatar.layer.cornerRadius = 30;
    self.avatar.layer.masksToBounds = YES;
    
    [self.username mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avatar.mas_right).mas_offset(10);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    self.username.font = [UIFont font_21];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).mas_offset(-20);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.mas_offset(64);
        make.height.mas_offset(32);
    }];
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton setBackgroundColor:[UIColor systemBlueColor]];
    self.loginButton.layer.cornerRadius = 8;
    self.loginButton.layer.masksToBounds = YES;
}

- (UIImageView *)avatar{
    if(!_avatar){
        _avatar = [[UIImageView alloc]init];
    }
    return _avatar;
}

- (UILabel *)username{
    if(!_username){
        _username = [[UILabel alloc]init];
    }
    return _username;
}

- (UIButton *)loginButton{
    if(!_loginButton){
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _loginButton;
}

@end
