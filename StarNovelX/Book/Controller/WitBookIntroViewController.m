//
//  WitBookIntroViewController.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/1.
//

#import "WitBookIntroViewController.h"
#import "SDWebImage/SDWebImage.h"
#import "WitBookShelfDataBase.h"
#import "WitAccessResources.h"
#import "WitCatalogViewController.h"
#import "WitPageViewController.h"
#import "WitBookContentViewController.h"
#import "WitProcessResources.h"
@interface WitBookIntroViewController ()

@end

@implementation WitBookIntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //  简介背景毛玻璃效果
    UIBlurEffect *blurEffrct =[UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemChromeMaterialDark];
    UIBlurEffect *blurEffrct_back =[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc]initWithEffect:blurEffrct_back];
    UIVisualEffectView *visualEffectView_back = [[UIVisualEffectView alloc]initWithEffect:blurEffrct];
    visualEffectView.alpha = 1;
    visualEffectView_back.alpha = 0.9;
  
    [self.view addSubview:self.topView];
    [self.topView addSubview:visualEffectView_back];
    [self.view addSubview:visualEffectView];
    [self.view addSubview:self.bookCover];
    [self.view addSubview:self.bookName];
    [self.view addSubview:self.bookAuthor];
    [self.view addSubview:self.bookType];
    [self.view addSubview:self.bookInfo];

    [self.view addSubview:self.buttonView];
    [self.view addSubview:self.showCatalog];
    [self.buttonView addSubview:self.addBookShelf];
    [self.buttonView addSubview:self.startRead];
    
    [self.bookCover mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).mas_offset(64 + 16);
        make.right.mas_equalTo(self.view.mas_right).mas_offset(-16);
        make.width.mas_offset(DETAIL_COVER_WIDTH);
        make.height.mas_offset(DETAIL_COVER_HEIGHT);
    }];
    [self.bookName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bookCover.mas_top);
        make.left.mas_equalTo(self.view.mas_left).mas_offset(16);
        make.right.mas_equalTo(self.bookCover.mas_left).mas_offset(-16);
    }];
    
    [self.bookAuthor mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bookName.mas_bottom).mas_offset(8);
        make.left.mas_equalTo(self.bookName.mas_left);
        make.right.mas_equalTo(self.bookName.mas_right);
    }];
    
    [self.bookType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.bookCover.mas_bottom);
        make.left.mas_equalTo(self.bookName.mas_left);
        make.right.mas_equalTo(self.bookName.mas_right);
    }];
    [self.showCatalog mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.top.mas_equalTo(self.bookCover.mas_bottom).mas_offset(16);
        make.right.mas_equalTo(self.view.mas_right);
        make.height.mas_offset(48);
    }];
    
    
    [self.buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.height.mas_offset(56);

    }];
    [self.addBookShelf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.buttonView.mas_top).mas_offset(6);
        make.left.mas_equalTo(self.buttonView.mas_left).mas_offset(18);
        make.bottom.mas_equalTo(self.buttonView.mas_bottom).mas_offset(-6);
        make.width.mas_equalTo(self.buttonView.mas_width).multipliedBy(0.5).mas_offset(-24);
    }];
    self.addBookShelf.layer.cornerRadius = 8;
    self.addBookShelf.layer.masksToBounds = YES;
    
    [self.startRead mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.addBookShelf);
        make.right.mas_equalTo(self.buttonView.mas_right).mas_offset(-18);
        make.bottom.mas_equalTo(self.addBookShelf);
        make.width.mas_equalTo(self.buttonView.mas_width).multipliedBy(0.5).mas_offset(-24);
    }];
    self.startRead.layer.cornerRadius = 8;
    self.startRead.layer.masksToBounds = YES;
    
    
    [self.bookInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.showCatalog.mas_bottom).mas_offset(12);
        make.left.mas_equalTo(self.view.mas_left).mas_offset(12);
        make.right.mas_equalTo(self.view.mas_right).mas_offset(-12);
        make.bottom.mas_equalTo(self.buttonView.mas_top).mas_offset(-12);
    }];
    self.bookInfo.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top);
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
    }];
    [visualEffectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bookInfo.mas_left);
        make.right.mas_equalTo(self.bookInfo.mas_right);
        make.top.mas_equalTo(self.bookInfo.mas_top);
        make.bottom.mas_equalTo(self.bookInfo.mas_bottom);
    } ];
    [visualEffectView_back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.topView.mas_left);
        make.right.mas_equalTo(self.topView.mas_right);
        make.top.mas_equalTo(self.topView.mas_top);
        make.bottom.mas_equalTo(self.topView.mas_bottom);
    } ];
    
    [self updateIntroData];
}

- (instancetype)initWithID:(NSUInteger)bookID Name:(NSString *)bookName author:(NSString *)bookAuthor type:(NSString *)bookType info:(NSString *)bookInfo coverURL:(NSString *)coverURL{
    self = [super init];
    self.bookID = bookID;
    self.bookCoverStr =  coverURL;
    self.bookName.text = bookName;
    self.bookAuthor.text = bookAuthor;
    self.bookType.text = bookType;
    self.bookInfo.text = [NSString stringWithFormat:@"简介:\n\t  %@",bookInfo];
    [self.bookCover sd_setImageWithURL:[NSURL URLWithString:coverURL]];
    return self;
}


-(void)updateIntroData{
    //  判断这个本书是不是在书架上
    if([WitBookShelfDataBase queryData:self.bookID]){
        //  在书架上
        self.addBookShelf.selected = YES;
    }
    else{
        self.addBookShelf.selected = NO;
    }
}




#pragma mark - 懒加载
- (UIImageView *)bookCover{
    if(!_bookCover){
        _bookCover = [[UIImageView alloc]init];
        _bookCover.backgroundColor = [UIColor blueColor];
    }
    return _bookCover;
}

- (UILabel *)bookName{
    if(!_bookName){
        _bookName = [[UILabel alloc]init];
        _bookName.text = @"默认名称";
        _bookName.font = [UIFont font_23];
        _bookName.textColor = [UIColor whiteColor];
        _bookName.numberOfLines = 0;
        [_bookName setLineBreakMode:NSLineBreakByWordWrapping];
    }
    return _bookName;
}

- (UILabel *)bookAuthor{
    if(!_bookAuthor){
        _bookAuthor = [[UILabel alloc]init];
        _bookAuthor.text = @"默认作者";
        _bookAuthor.font = [UIFont font_19];
        _bookAuthor.textColor = [UIColor whiteColor];
        _bookAuthor.numberOfLines = 0;
        [_bookAuthor setLineBreakMode:NSLineBreakByWordWrapping];
    }
    return _bookAuthor;
}

- (UILabel *)bookType{
    if(!_bookType){
        _bookType = [[UILabel alloc]init];
        _bookType.textColor = [UIColor whiteColor];
        _bookType.text = @"类别";
    }
    return _bookType;
}

- (UITextView *)bookInfo{
    if(!_bookInfo){
        _bookInfo = [[UITextView alloc]init];
        _bookInfo.font = [UIFont font_21];
        _bookInfo.textColor = [UIColor whiteColor];
        _bookInfo.textContainerInset = UIEdgeInsetsMake(12, 12, 12, 12);
        _bookInfo.showsVerticalScrollIndicator = NO;
        _bookInfo.editable = NO;
    }
    
    return _bookInfo;
}

- (UIView *)buttonView{
    if(!_buttonView){
        _buttonView = [[UIView alloc]init];
        _buttonView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.2];
        
    }
    return _buttonView;
}

- (UIButton *)addBookShelf{
    if(!_addBookShelf){
        _addBookShelf = [UIButton buttonWithType: UIButtonTypeCustom];
        [_addBookShelf setTitle:@"加入书架" forState:UIControlStateNormal];
        [_addBookShelf setTitle:@"已加入书架" forState:UIControlStateSelected];
        [_addBookShelf setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
        _addBookShelf.backgroundColor = [UIColor whiteColor];
        [_addBookShelf addTarget:self action:@selector(doAddBookShelf) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addBookShelf;
}

- (UIButton *)startRead{
    if(!_startRead){
        _startRead = [UIButton buttonWithType:UIButtonTypeCustom];
        [_startRead setTitle:@"开始阅读" forState:UIControlStateNormal];
        [_startRead setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
        _startRead.backgroundColor = [UIColor whiteColor];
        [_startRead addTarget:self action:@selector(doStartRead) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startRead;
}

- (UIButton *)showCatalog{
    if(!_showCatalog){
        _showCatalog = [UIButton buttonWithType:UIButtonTypeCustom];
        [_showCatalog setTitle:@"目录" forState:UIControlStateNormal];
        [_showCatalog setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
        _showCatalog.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _showCatalog.backgroundColor = [UIColor whiteColor];
        _showCatalog.titleEdgeInsets = UIEdgeInsetsMake(0, 16, 0, 0);
        [_showCatalog addTarget:self action:@selector(doShowCatalog) forControlEvents:UIControlEventTouchUpInside];
    }
    return _showCatalog;
}

- (UIImageView *)topView{
    if(!_topView){
        _topView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"introTopBack"]];
        _topView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _topView;
}



#pragma mark - 按钮方法
-(void)doAddBookShelf{
    if(self.addBookShelf.selected == NO){
        NSLog(@"加入书架：%ld",self.bookID);
        WitBookModel *aBook = [[WitBookModel alloc]init];
        aBook.bookID = self.bookID;
        aBook.bookName = self.bookName.text;
        aBook.bookAuthor = self.bookAuthor.text;
        aBook.bookCover = self.bookCoverStr;
        aBook.bookType = self.bookType.text;
        aBook.readedChapter = 1;
        aBook.chapterCount = 2;
        aBook.bookIntroUrl = self.bookIntroUrl;
        [WitBookShelfDataBase insertData:aBook];
        [self updateIntroData];
    }
    else{
        NSLog(@"从书架中移除：%ld",self.bookID);
        [WitBookShelfDataBase deleteData:self.bookID];
        [self updateIntroData];
    }
    NSNotification *notice = [NSNotification notificationWithName:@"REFRESHBOOKSHELF" object:nil];
    [[NSNotificationCenter defaultCenter]postNotification:notice];
    
}

-(void)doShowCatalog{
    NSLog(@"显示目录");
    NSMutableArray *dataSource = [NSMutableArray array];
    dataSource = [WitAccessResources accessBookCatalog:[NSURL URLWithString:self.bookIntroUrl]];
    WitCatalogViewController *catalogViewController = WitCatalogViewController.new;
    catalogViewController.dataSource = dataSource;
    [self presentViewController:catalogViewController animated:YES completion:nil];
}

-(void)doStartRead{
    NSLog(@"开始阅读！");
    NSDictionary *options = @{UIPageViewControllerOptionInterPageSpacingKey:@(20)};
    //  创建阅读控制器
    WitPageViewController *bookPageViewController = [[WitPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
    //  将小说章节数据传递给阅读控制器
    NSMutableArray<WitCatalogModel *> *catalogData = [NSMutableArray array];
    catalogData = [WitAccessResources accessBookCatalog:[NSURL URLWithString:self.bookIntroUrl]];;
    bookPageViewController.catalogData = catalogData;
    bookPageViewController.bookIntroUrl = self.bookIntroUrl;
    //  创建章节模型，内容为需要跳转的章节
    WitCatalogModel *aCatalog = [WitCatalogModel new];
    //  0为需要跳转的章节号
    aCatalog = bookPageViewController.catalogData[0];
    //  由于获取的url 为站内的相对路径，这里修改为绝对路径
    NSString *fullUrl = [self.bookIntroUrl stringByAppendingString:aCatalog.catalogUrl];
    //  根据章节的完整路径获取章节的内容
    NSString *achapterContent = [WitAccessResources accessBookContent:[NSURL URLWithString:fullUrl]];
    //  将章节的内容划分为页面内容
    achapterContent = [WitProcessResources purifyContent:achapterContent BookTitle:self.bookName.text ChapterTitle:aCatalog.catalogName];
    bookPageViewController.bookTitle = self.bookName.text;
    NSMutableArray *divideResult = [NSMutableArray array];
    divideResult = [WitProcessResources divideContent:achapterContent];

    //  创建内容字典 key: 章节号  value : 章节的内容数组
    NSMutableDictionary *contentDic = [NSMutableDictionary dictionary];
    [contentDic setObject:divideResult forKey:@(0)];    // 0 跳转的章节号
    
    WitBookContentViewController *firstViewController = [[WitBookContentViewController alloc]initWithContent:divideResult[0] ChapterIdx:0 ChapterTitle:catalogData[0].catalogName NowPage:1 PageCount:[divideResult count]];     //  第一个 0 是第几页，第二个 0 是第几章节（章节号）
    bookPageViewController.informationLabel.text = [NSString stringWithFormat:@"%@\t\t(%d / %ld)",catalogData[0].catalogName, 1, [divideResult count]];
    firstViewController.chapterIdx = 0;     //  章节号
   
    NSArray *viewCotrollers = [NSArray arrayWithObject:firstViewController];
    bookPageViewController.contentDic = contentDic;
    [bookPageViewController setViewControllers:viewCotrollers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
    [self.navigationController pushViewController:bookPageViewController animated:YES];
}
@end
