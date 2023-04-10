//
//  WitExploreViewController.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/8/28.
//

#import "WitExploreViewController.h"
#import "WitBookClassifyView.h"
#import "WitBookRecommendView.h"
#import "WitAccessResources.h"
#import "WitBookIntroViewController.h"
#import "WitRoundTypeButton.h"

#import "WitExploreView.h"
@interface WitExploreViewController ()
@property (nonatomic, strong) WitBookClassifyView *classifyView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) WitBookRecommendView *specialRecommend;
@property (nonatomic, strong) WitExploreView *exploreView;
@end

@implementation WitExploreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.exploreView];
    [self.exploreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(turnToIntro:) name:@"SHOWBOOKINTRO" object:nil];
    
    WitRoundTypeButton *aButton = [[WitRoundTypeButton alloc]initWithFrame:CGRectMake(90, 150, 48, 96)];
    [self.view addSubview:aButton];
//    aButton.backgroundColor = [UIColor systemBlueColor];
    
}

#pragma mark -懒加载
- (WitExploreView *)exploreView{
    if(!_exploreView){
        _exploreView = [[WitExploreView alloc]init];
    }
    return _exploreView;
}

-(void)turnToIntro:(NSNotification *)notification{
    NSLog(@"这里！");
    NSURL *introUrl = notification.userInfo[@"INTROURL"];
    NSMutableDictionary *introInfo = [NSMutableDictionary dictionary];
    introInfo = [WitAccessResources accessReourceIntroPage:introUrl];
    NSString *bookIDStr = [introInfo objectForKey:@"ID"];
    NSUInteger bookID = [bookIDStr integerValue];
    NSString *bookName = [introInfo objectForKey:@"NAME"];
    NSString *bookAuthor = [introInfo objectForKey:@"AUTHOR"];
    NSString *bookCover = [introInfo objectForKey:@"COVER"];
    NSString *bookInfo = [introInfo objectForKey:@"INFO"];
    NSString *bookType = [introInfo objectForKey:@"TYPE"];
    
    
    
    WitBookIntroViewController *introView = [[WitBookIntroViewController alloc]initWithID:bookID Name:bookName author:bookAuthor type:bookType  info:bookInfo coverURL:bookCover];
    introView.bookIntroUrl = [introUrl absoluteString];
    introView.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:introView animated:YES];
    
    
}

@end
