//
//  WitTabBarViewController.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/8/15.
//

#import "WitTabBarViewController.h"
#import "UIColor+Theme.h"
#import "WitBookShelfViewController.h"
#import "WitExploreViewController.h"
#import "WitcatalogViewController.h"
#import "WitAccessResources.h"
#import "WitMenuViewController.h"
#import "WitMineViewController.h"
#import "WitFindViewController.h"
@interface WitTabBarViewController ()

@end

@implementation WitTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //  书架
    WitBookShelfViewController *bookshelfView = WitBookShelfViewController.new;
    bookshelfView.view.backgroundColor = [UIColor whiteColor];
    bookshelfView.tabBarItem.title = @"书架";
    UINavigationController *bookshelfNavi = [[UINavigationController alloc]initWithRootViewController:bookshelfView];
    bookshelfNavi.tabBarItem.title = bookshelfView.tabBarItem.title;
    
    
    //  发现
    WitFindViewController *exploreView = WitFindViewController.new;
    exploreView.view.backgroundColor = [UIColor whiteColor];
    exploreView.tabBarItem.title = @"发现";
    UINavigationController *exploreNavi = [[UINavigationController alloc]initWithRootViewController:exploreView];
    exploreNavi.tabBarItem.title = exploreView.tabBarItem.title;
    
    
    //  我的
//    NSMutableArray *dataSource = [NSMutableArray array];
//    dataSource = [WitAccessResources accessBookCatalog:[NSURL URLWithString:@"https://www.bbiquge.net/book/133312/"]];
    WitMineViewController *personView = WitMineViewController.new;
////    personView.dataSource = dataSource;
    personView.view.backgroundColor = [UIColor whiteColor];
    personView.tabBarItem.title = @"我的";
    UINavigationController *personNavi = [[UINavigationController alloc]initWithRootViewController:personView];
    personNavi.tabBarItem.title = personView.tabBarItem.title;
    
    
//    bookshelfNavi.navigationBar.barTintColor=[UIColor orangeTheme];
//    bookshelfNavi.navigationBar.translucent = NO;
//    [exploreNavi.navigationBar setBarTintColor:[UIColor orangeTheme]];
//    exploreNavi.navigationBar.translucent = NO;
//    [personNavi.navigationBar setBarTintColor:[UIColor orangeTheme]];
//    personNavi.navigationBar.translucent = NO;
    
//    [[UINavigationBar appearance] setBackgroundColor:[UIColor orangeTheme]];
//    bookshelfNavi.edgesForExtendedLayout = 0;
    
    UINavigationBarAppearance *naviappearance = UINavigationBarAppearance.new;
    naviappearance.backgroundColor = [UIColor themeColor];
    naviappearance.shadowColor = [UIColor themeColor];
    [UINavigationBar appearance].standardAppearance = naviappearance;
    [UINavigationBar appearance].scrollEdgeAppearance = naviappearance;
    
    UITabBarAppearance *tabAppearance = UITabBarAppearance.new;
    tabAppearance.backgroundColor = [UIColor themeColor];
    tabAppearance.shadowColor = [UIColor themeColor];
    [UITabBar appearance].standardAppearance = tabAppearance;
    [UITabBar appearance].scrollEdgeAppearance = tabAppearance;
    self.tabBar.unselectedItemTintColor = [UIColor whiteColor];
    
    self.viewControllers = @[bookshelfNavi, exploreNavi, personNavi];
    
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
}
@end
