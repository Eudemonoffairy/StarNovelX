//
//  WitBookClassifyView.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/8/28.
//

#import "WitBookClassifyView.h"
#import "WitVerticalCollectionViewCell.h"

#define CLASSIFY_CELL_IDENTIFIER @"classify_cell"

@interface WitBookClassifyView()<UICollectionViewDelegate, UICollectionViewDataSource>;
@property (nonatomic, strong)UICollectionViewFlowLayout *classifyLayout;

@end
@implementation WitBookClassifyView{
    NSMutableArray *dataSourceArr;     ///<  分类列表
}
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    dataSourceArr = [NSMutableArray arrayWithObjects:@"玄幻",@"修真",@"都市",@"历史",@"网游",@"科幻",@"完本", nil];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

#pragma mark -懒加载
- (UICollectionView *)collectionView{
    if(!_collectionView){
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.classifyLayout];
        [self addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top);
            make.left.mas_equalTo(self.mas_left);
            make.width.mas_equalTo(self.mas_width);
            make.height.mas_equalTo(self.mas_height);
        }];
        [_collectionView registerClass:[WitVerticalCollectionViewCell class] forCellWithReuseIdentifier:CLASSIFY_CELL_IDENTIFIER];
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)classifyLayout{
    if(!_classifyLayout){
        _classifyLayout = [[UICollectionViewFlowLayout alloc]init];
        _classifyLayout.itemSize = CGSizeMake(CLASSIFY_CELL_WIDTH, CLASSIFY_CELL_HEIGHT);
        _classifyLayout.minimumLineSpacing = 6;
        _classifyLayout.minimumInteritemSpacing = 6;
        _classifyLayout.sectionInset = UIEdgeInsetsMake(8, 8, 8, 8);
        _classifyLayout.footerReferenceSize = CGSizeMake(SCREEN_WIDTH, 1);
    }
    return _classifyLayout;
}

#pragma mark -UICollectionViewCellDataSource
- (WitVerticalCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WitVerticalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CLASSIFY_CELL_IDENTIFIER forIndexPath:indexPath];
    cell.type = CLASSIFY_CELL;
    cell.backgroundColor = [UIColor lightGrayColor];
    UIImageView *cellImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"testImg"]];
    NSString *cellTitle = dataSourceArr[[indexPath item]];
    [cell setImage:cellImg AndTitle:cellTitle];
    cell.layer.cornerRadius = 8;
    cell.layer.masksToBounds = YES;
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


@end
