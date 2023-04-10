//
//  WitPageViewController.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/7.
//

#import "WitPageViewController.h"
#import "WitBookContentViewController.h"
#import "WitAccessResources.h"
#import "WitProcessResources.h"
#import "WitMenuViewController.h"
@interface WitPageViewController ()<UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@end
@implementation WitPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *BGIdxNumber = [defaults objectForKey:@"READBACKGROUND"];
    self.view.backgroundColor = [UIColor readBackGroundColor:[BGIdxNumber integerValue]];
    self.delegate = self;
    self.dataSource = self;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showMenu)];
    [self.view addGestureRecognizer:tap];

    [self.view addSubview:self.informationLabel];
    [self.informationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.height.mas_offset(20);
    }];
    
    [self.view addSubview:self.darkView];
    [self.darkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.top.mas_equalTo(self.view.mas_top);
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.right.mas_equalTo(self.view.mas_right);
    }];
    NSNotificationCenter  *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(changeDarkView:) name:@"CHANGEBRIGHTNESS" object:nil];
    [center addObserver:self selector:@selector(changeBackGroundColor) name:@"READCOLORCHANGED" object:nil];
    [center addObserver:self selector:@selector(reacquireResource) name:@"READCHANGEFONTSIZE" object:nil];
    
    
    
}
#pragma mark - 懒加载
- (NSMutableArray<WitCatalogModel *> *)catalogData{
    if(!_catalogData){
        _catalogData = [NSMutableArray array];
    }
    return _catalogData;
}
- (NSMutableDictionary *)contentDic{
    if(!_contentDic){
        _contentDic = [NSMutableDictionary dictionary];
    }
    return _contentDic;
}

- (UILabel *)informationLabel{
    if(!_informationLabel){
        _informationLabel = [[UILabel alloc]init];
        _informationLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        _informationLabel.textAlignment = NSTextAlignmentCenter;
        _informationLabel.font = [UIFont font_13];
    }
    return _informationLabel;
}

- (UIView *)darkView{
    if(!_darkView){
        _darkView = [[UIView alloc]init];
        _darkView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        _darkView.userInteractionEnabled  = NO;
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSNumber  *alphaNumber = [defaults objectForKey:@"READBRIGHTNESS"];
        NSLog(@"%f", [alphaNumber floatValue]);
        _darkView.alpha = [alphaNumber floatValue];
        
        
//        _darkView.hidden = YES;
    }
    return _darkView;
}



#pragma  mark - UIPageViewControllerDelegate & DataSource
- ( WitBookContentViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(WitBookContentViewController *)viewController{
    //  切换到上一个视图控制器需要解决两个问题，1.第一章第一页，2.下一章回到上一章
    
    //  如果是第一页
    if(viewController.nowPage == 1){
        if(viewController.chapterIdx == 0){
            // 第一章第一页
            self.informationLabel.text = [NSString stringWithFormat:@"%@\t\t(%ld / \%ld)",viewController.chapterTitle,viewController.nowPage,viewController.pageCount];
            return nil;
            
        }
        else{
            //  不是第一章
            NSMutableArray *previousArr = [NSMutableArray array];
            NSUInteger previousIdx = viewController.chapterIdx - 1;
            WitCatalogModel *aCatalog = self.catalogData[previousIdx];
            if([[self.contentDic allKeys] containsObject:@(previousIdx) ]){
                previousArr = [self.contentDic objectForKey:@(previousIdx)];
                
            }
            else{
                NSString *fullUrl = [self.bookIntroUrl stringByAppendingString:aCatalog.catalogUrl];
                NSString *preViousStr = [WitAccessResources accessBookContent:[NSURL URLWithString:fullUrl]];
                preViousStr = [WitProcessResources purifyContent:preViousStr BookTitle:self.bookTitle ChapterTitle:aCatalog.catalogName];
                previousArr = [WitProcessResources divideContent:preViousStr];
                [self.contentDic setObject:previousArr forKey:@(previousIdx)];
            }
            WitBookContentViewController *previousPage = [[WitBookContentViewController alloc]initWithContent:[previousArr lastObject]  ChapterIdx:previousIdx ChapterTitle:aCatalog.catalogName NowPage:[previousArr count] PageCount:[previousArr count]];
            
            self.informationLabel.text = [NSString stringWithFormat:@"%@\t\t(%ld / \%ld)",viewController.chapterTitle,viewController.nowPage,viewController.pageCount];
            return previousPage;
        }
    }
    else{
        NSUInteger nowChapterIdx = viewController.chapterIdx;     //  当前章节号
        NSMutableArray *nowChapterArr = [self.contentDic objectForKey:@(nowChapterIdx)];
        NSUInteger nowPageIdx = viewController.nowPage;
        NSString *previousStr = nowChapterArr[nowPageIdx - 2];
        WitBookContentViewController *previousPage = [[WitBookContentViewController alloc]initWithContent:previousStr ChapterIdx:nowChapterIdx ChapterTitle:viewController.chapterTitle NowPage:nowPageIdx - 1 PageCount:viewController.pageCount];
        self.informationLabel.text = [NSString stringWithFormat:@"%@\t\t(%ld / \%ld)",viewController.chapterTitle,viewController.nowPage,viewController.pageCount];
        return previousPage;
    }
    
    
        
}
- ( WitBookContentViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(WitBookContentViewController *)viewController{
    //  切换到下一个视图控制器需要解决两个问题，1.最后一张最后一页，2.切换到下一章
    
    //  如果是最后一页
    if(viewController.nowPage == viewController.pageCount ){
        if(viewController.chapterIdx == [self.catalogData count]){
            // 最后一章最后一页
            self.informationLabel.text = [NSString stringWithFormat:@"%@\t\t(%ld / \%ld)",viewController.chapterTitle,viewController.nowPage,viewController.pageCount];
            return nil;
        }
        else{
            //  不是最后一章
            NSMutableArray *nextArr = [NSMutableArray array];
            NSUInteger nextIdx = viewController.chapterIdx + 1;
            WitCatalogModel *aCatalog = self.catalogData[nextIdx];
            if([[self.contentDic allKeys] containsObject:@(nextIdx)]){
                nextArr = [self.contentDic objectForKey:@(nextIdx)];
            }
            else{
                NSString *fullUrl = [self.bookIntroUrl stringByAppendingString:aCatalog.catalogUrl];
                NSString *nextStr = [WitAccessResources accessBookContent:[NSURL URLWithString:fullUrl]];
                nextStr = [WitProcessResources purifyContent:nextStr BookTitle:self.bookTitle ChapterTitle:aCatalog.catalogName];
                nextArr = [WitProcessResources divideContent:nextStr];
                [self.contentDic setObject:nextArr forKey:@(nextIdx)];
            }
                WitBookContentViewController *nextPage = [[WitBookContentViewController alloc]initWithContent:nextArr[0] ChapterIdx:nextIdx ChapterTitle:aCatalog.catalogName NowPage:1 PageCount:[nextArr count]];
                self.informationLabel.text = [NSString stringWithFormat:@"%@\t\t(%ld / \%ld)",viewController.chapterTitle,viewController.nowPage,viewController.pageCount];
                return nextPage;
        }
    }
    else{
        NSUInteger nowChapterIdx = viewController.chapterIdx;     //  当前章节号
        NSMutableArray *nowChapterArr = [self.contentDic objectForKey:@(nowChapterIdx)];
        NSUInteger nowPageIdx = viewController.nowPage;
        NSString *nextStr = nowChapterArr[nowPageIdx];
        WitBookContentViewController *nextPage = [[WitBookContentViewController alloc]initWithContent:nextStr ChapterIdx:nowChapterIdx ChapterTitle:viewController.chapterTitle NowPage:nowPageIdx + 1 PageCount:viewController.pageCount];
        self.informationLabel.text = [NSString stringWithFormat:@"%@\t\t(%ld / \%ld)",viewController.chapterTitle,viewController.nowPage,viewController.pageCount];
        return nextPage;
    }
}


#pragma mark - 其他方法
-(void)showMenu{
    NSLog(@"显示菜单");
    WitMenuViewController *menuViewController = [[WitMenuViewController alloc]init];
    menuViewController.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:menuViewController animated:NO completion:nil];
}

-(void)changeDarkView:(NSNotification *)notification{
    NSLog(@"调节亮度");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber  *alphaNumber = [defaults objectForKey:@"READBRIGHTNESS"];
    NSLog(@"%f", [alphaNumber floatValue]);
    self.darkView.alpha = [alphaNumber floatValue];
    
}

-(void)changeBackGroundColor{
    NSLog(@"更改背景颜色");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *BGIdxNumber = [defaults objectForKey:@"READBACKGROUND"];
    self.view.backgroundColor = [UIColor readBackGroundColor:[BGIdxNumber integerValue]];
}

-(void)reacquireResource{
    //  遍历 contentDIC 每个键
    [self.contentDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        //  获取的键对应的内容数组
        NSMutableArray *contentArr = [self.contentDic objectForKey:key];
        NSLog(@"更新前的页数%ld",[contentArr count]);
        __block NSString *fullString = @"";
        [contentArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    fullString = [fullString stringByAppendingString:obj];
        }];
        //  遍历完成以后，依据新的字体大小和行间距划分字符串
        [contentArr removeAllObjects];
        contentArr = [WitProcessResources divideContent:fullString];
        NSLog(@"更新后的页数%ld",[contentArr count]);
        [self.contentDic setObject:contentArr forKey:key];
    }];
    NSLog(@"重载完成");
    WitBookContentViewController *oldContentViewController = [WitBookContentViewController new];
    oldContentViewController = self.viewControllers[0];
    NSString *chapterTit = oldContentViewController.chapterTitle;
    NSUInteger chapterIdx = oldContentViewController.chapterIdx;
    NSArray *nowContent = [self.contentDic objectForKey:@(chapterIdx)];
    NSUInteger nowPage = oldContentViewController.nowPage < [nowContent count]? oldContentViewController.nowPage : [nowContent count];
    NSUInteger pageCount = [nowContent count];
    NSString *contentStr = [nowContent objectAtIndex:nowPage-1];
    
    WitBookContentViewController *newContentViewController = [[WitBookContentViewController alloc]initWithContent:contentStr ChapterIdx:chapterIdx ChapterTitle:chapterTit NowPage:nowPage PageCount:pageCount];
    NSArray *viewControllers = [NSArray arrayWithObject:newContentViewController];
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}






@end
