//
//  WitRegisterViewController.m
//  StarNovelX
//
//  Created by Martin Liu on 2023/2/1.
//

#import "WitRegisterViewController.h"
#import "WitTextFieldWithLabel.h"
@interface WitRegisterViewController ()

@end

@implementation WitRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"注册 / Login";
    self.view.backgroundColor = [UIColor whiteColor];
    
//    UIButton *registerButton = [[UIButton alloc]init];
//    [registerButton setTitle:@"登录" forState:UIControlStateNormal];
//    [registerButton setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
//    UIBarButtonItem *rightCustonView = [[UIBarButtonItem alloc] initWithCustomView:registerButton];
//    self.navigationItem.rightBarButtonItem = rightCustonView;
    
    
    UIImageView *loginBanner = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_banner"]];
    [self.view addSubview:loginBanner];
    loginBanner.contentMode = UIViewContentModeScaleAspectFill;
    [loginBanner mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.view.mas_left);
            make.right.mas_equalTo(self.view.mas_right);
            make.top.mas_equalTo(self.view.mas_top).mas_offset(NAVIGATION_BAR_HEIGHT + STATUS_BAR_HEIGHT - 2);
        make.height.mas_offset(64);
    }];
    
    WitTextFieldWithLabel *username = [[WitTextFieldWithLabel alloc]init];
    [self.view addSubview:username];
    
    [username mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.view).mas_offset(24);
            make.right.mas_equalTo(self.view).mas_offset(-24);
            make.top.mas_equalTo(loginBanner.mas_bottom).mas_offset(24);
        make.height.mas_offset(48);
    }];
    username.itemTitle.text = @"账号";
    
    WitTextFieldWithLabel *password = [[WitTextFieldWithLabel alloc]init];
    [self.view addSubview:password];
    
    [password mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.view).mas_offset(24);
            make.right.mas_equalTo(self.view).mas_offset(-24);
            make.top.mas_equalTo(username.mas_bottom).mas_offset(16);
        make.height.mas_offset(48);
    }];
    password.itemTitle.text = @"密码";
    password.itemContent.secureTextEntry = YES;
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:loginButton];
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(password).mas_offset(128);
        make.width.mas_equalTo(self.view).multipliedBy(0.8);
        make.height.mas_offset(48);
    }];
    [loginButton setTitle:@"注册" forState:UIControlStateNormal];
    loginButton.backgroundColor = [UIColor systemBlueColor];
    loginButton.layer.cornerRadius = 12;
    loginButton.layer.masksToBounds = YES;

    
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
