//
//  WitBookShelfViewController.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/8/21.
//

#import "WitBookShelfCell.h"
#import "WitBookShelfViewController.h"
#import "WitBookShelfDataBase.h"
#import "SDWebImage.h"
//#import "SAReachability.h"

#define CELL_IDENTIFIER   @"cell"
#define FOOTER_IDENTIFIER @"footer"

@interface WitBookShelfViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIImageView *backgroundImg;
///  列表模式
@property (nonatomic, strong) UICollectionViewFlowLayout *listLayout;
///  宫格模式
@property (nonatomic, strong) UICollectionViewFlowLayout *gridLayout;
///  转换显示模式按钮
@property (nonatomic, strong) UIButton *transformButton;
///  判断当前是什么模式，默认为列表模式（False）。
@property (nonatomic) BOOL isGrid;
@end

@implementation WitBookShelfViewController{
    NSMutableArray *dataSourceArr;      ///<  collectionView 资源列表
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.backgroundImg];
    dataSourceArr = [[NSMutableArray alloc]init];
    dataSourceArr = [WitBookShelfDataBase traverseAllData];
    self.title = @"书架";
    [self initNaviBtn];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(refreshBookShelf) name:@"REFRESHBOOKSHELF" object:nil];
    
    
    
    [self.backgroundImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self.view.mas_top);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
    
}


/// 初始化导航栏按钮
-(void)initNaviBtn{
    //  显示模式转换按钮
    [self.transformButton addTarget:self action:@selector(transformLayout) forControlEvents:UIControlEventTouchUpInside];
    self.transformButton.layer.cornerRadius = 12;
    self.transformButton.layer.masksToBounds = YES;
    UIBarButtonItem *rightButtonView = [[UIBarButtonItem alloc]initWithCustomView:self.transformButton];
    self.navigationItem.rightBarButtonItem = rightButtonView;
}


#pragma mark -懒加载
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        BOOL isGrid = [defaults boolForKey:BOOK_IS_GRID];
        if (isGrid) {
            _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.gridLayout];
            self.transformButton.selected = YES;
        } else {
            _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.listLayout];
            self.transformButton.selected = NO;
        }
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view.mas_top);
            make.left.mas_equalTo(self.view.mas_left);
            make.width.mas_equalTo(self.view.mas_width);
            make.height.mas_equalTo(self.view.mas_height);
        }];
        [_collectionView registerClass:[WitBookShelfCell class] forCellWithReuseIdentifier:CELL_IDENTIFIER];
        _collectionView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)listLayout {
    if (!_listLayout) {
        _listLayout = [[UICollectionViewFlowLayout alloc]init];
        _listLayout.itemSize = CGSizeMake(LIST_CELL_WIDTH, LIST_CELL_HEIGHT);
        _listLayout.minimumLineSpacing = 12;
        _listLayout.sectionInset = UIEdgeInsetsMake(5, 8, 5, 8);
        _listLayout.footerReferenceSize = CGSizeMake(SCREEN_WIDTH, 12);
    }
    return _listLayout;
}

- (UICollectionViewFlowLayout *)gridLayout {
    if (!_gridLayout) {
        _gridLayout = [[UICollectionViewFlowLayout alloc]init];
        _gridLayout.itemSize = CGSizeMake(GRID_CELL_WIDTH, GRID_CELL_HEIGHT);
        _gridLayout.minimumLineSpacing = 12;
        _gridLayout.sectionInset = UIEdgeInsetsMake(10, 5, 10, 5);
        _gridLayout.footerReferenceSize = CGSizeMake(SCREEN_WIDTH, 20);
    }
    return _gridLayout;
}

- (UIButton *)transformButton{
    if(!_transformButton){
        _transformButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_transformButton setFrame:CGRectMake(0, 0, 48, 24)];
        [_transformButton setTitle:@"列表" forState:UIControlStateNormal];
        [_transformButton setTitle:@"宫格" forState:UIControlStateSelected];
        _transformButton.backgroundColor = [UIColor orangeColor];
        _transformButton.titleLabel.font = [UIFont font_13];
    }
    return _transformButton;
}

- (UIImageView *)backgroundImg{
    if(!_backgroundImg){
        _backgroundImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bookshelf_back"]];
       
        _backgroundImg.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _backgroundImg;
}

#pragma mark -按钮方法
- (void)transformLayout {
    NSLog(@"切换书架展示模式");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.isGrid = [defaults boolForKey:BOOK_IS_GRID];
    if (!self.isGrid) {   //  如果当前是宫格模式
        NSLog(@"现在是宫格");
        self.isGrid = YES;
        self.transformButton.selected = YES;
        [self.collectionView setCollectionViewLayout:self.gridLayout animated:NO];
        [defaults setBool:self.isGrid forKey:BOOK_IS_GRID];

    } else {            //  如果当前是列表模式
        NSLog(@"现在是列表");
        self.isGrid = NO;
        self.transformButton.selected = NO;
        [self.collectionView setCollectionViewLayout:self.listLayout animated:NO];
        self.collectionView.scrollsToTop = YES;
        [self.collectionView setContentOffset:CGPointMake(0,-64) animated:NO];
        [defaults setBool:self.isGrid forKey:BOOK_IS_GRID];
    }
    [self.collectionView.visibleCells enumerateObjectsUsingBlock:^(__kindof UICollectionViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setNeedsDisplay];
    }];
}

    #pragma mark -UICollectionViewCellDataSource
    - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
        WitBookShelfCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        WitBookModel *aBook = dataSourceArr[[indexPath item]];
        cell.bookNameLabel.text = aBook.bookName;
        cell.authorNameLabel.text = aBook.bookAuthor;
        cell.readedChapter = aBook.readedChapter;
        cell.allChapter = aBook.chapterCount;

        //  TODO: 添加网络连接判定
        [WitNetworkStatus checkNetworkStatus];
        [cell.bookCoverImg sd_setImageWithURL:[NSURL URLWithString:aBook.bookCover] placeholderImage:[UIImage imageNamed:@"book_default_cover"]];

        cell.bookType = aBook.bookType;

        return cell;
    }
    - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
        return [dataSourceArr count];
    }
    //  可选:
    ///  返回分区的个数
    - (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
        return 1;
    }

#pragma mark - 回调方法
-(void)refreshBookShelf{
    NSLog(@"收到通知！！！");
    dataSourceArr = [WitBookShelfDataBase traverseAllData];
    [self.collectionView reloadData];
}

@end
