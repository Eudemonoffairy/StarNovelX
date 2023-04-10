//
//  WitMineViewController.m
//  StarNovelX
//
//  Created by Martin Liu on 2023/1/31.
//

#import "WitMineViewController.h"
#import "WitUserInfoBlockView.h"
#import "WitUserFunctionItem.h"
#import "WitLoginViewController.h"
@interface WitMineViewController ()

@end

@implementation WitMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WitUserInfoBlockView *userView = [[WitUserInfoBlockView alloc]initWithFrame:CGRectMake(0, 72, SCREEN_WIDTH, 80)];
    userView.backgroundColor = [UIColor systemGray5Color];
    [self.view addSubview:userView];
    
    [userView.avatar setImage:[UIImage imageNamed:@"user_avatar"]];
    [userView.username setText:@"未登录"];
    
    //  浏览记录模块
    WitUserFunctionItem *exploreLog = WitUserFunctionItem.new;
    [self.view addSubview:exploreLog];
    [exploreLog mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(userView.mas_bottom).mas_offset(12);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.height.mas_offset(48);
    }];
    [exploreLog.itemIcon setImage:[UIImage imageNamed:@"user_avatar"]];
    [exploreLog.opName setText:@"浏览记录"];
    exploreLog.backgroundColor = UIColor.systemGray5Color;
    
    WitUserFunctionItem *downloadLog = WitUserFunctionItem.new;
    [self.view addSubview:downloadLog];
    [downloadLog mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(exploreLog.mas_bottom).offset(2);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.height.mas_offset(48);
    }];
    [downloadLog.itemIcon setImage:[UIImage imageNamed:@"user_avatar"]];
    [downloadLog.opName setText:@"下载记录"];
    downloadLog.backgroundColor = UIColor.systemGray5Color;
    
    UIButton *logoutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:logoutButton];
    [logoutButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view.mas_centerX);
            make.top.mas_offset(SCREEN_HEIGHT - 100);
            make.height.mas_offset(36);
            make.width.mas_offset(128);
    }];
    logoutButton.backgroundColor = UIColor.systemRedColor;
    [logoutButton setTitle:@"退出登录" forState:UIControlStateNormal];
    logoutButton.layer.cornerRadius = 4;
    logoutButton.layer.masksToBounds = YES;
    
    
    [userView.loginButton addTarget:self action:@selector(doLogin) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)doLogin{
    self.hidesBottomBarWhenPushed = YES;
    WitLoginViewController *loginView = [[WitLoginViewController alloc]init];
    [self.navigationController pushViewController:loginView animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

@end
