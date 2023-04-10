//
//  WitBookTypeView.m
//  StarNovelX
//
//  Created by Martin Liu on 2023/2/1.
//

#import "WitBookTypeView.h"
#import "WitRoundTypeButton.h"

#define TYPE_CELL_IDENTIFIER @"cell"
@interface WitBookTypeView()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *typeLayout;

@end

@implementation WitBookTypeView
- (void)drawRect:(CGRect)rect{
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.top.mas_equalTo(self);
        make.bottom.mas_equalTo(self);
    }];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}


#pragma mark - 懒加载
- (UICollectionView *)collectionView{
    if(!_collectionView){
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.typeLayout];
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[WitRoundTypeButton class] forCellWithReuseIdentifier:TYPE_CELL_IDENTIFIER];
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)typeLayout{
    if(!_typeLayout){
        _typeLayout = [[UICollectionViewFlowLayout alloc]init];
        _typeLayout.minimumLineSpacing = 20;
        _typeLayout.minimumInteritemSpacing = 8;
        _typeLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _typeLayout.itemSize = CGSizeMake(48, 96);
        _typeLayout.sectionInset = UIEdgeInsetsMake(8, 16, 8, 16);
        
    }
    return _typeLayout;
}

- (NSMutableArray *)dataSource{
    if(!_dataSource){
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

#pragma mark - UICollectionViewCellDataSource
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WitRoundTypeButton *cell = [collectionView dequeueReusableCellWithReuseIdentifier:TYPE_CELL_IDENTIFIER forIndexPath:indexPath];
    NSUInteger itemIndex = [indexPath item];
    NSString *iconName = [NSString stringWithFormat:@"Type_Icon_%ld",itemIndex + 1];
    [cell.itemIcon setImage:[UIImage imageNamed:iconName]];
    cell.itemTitle.text = self.dataSource[itemIndex];
    cell.tag = itemIndex;           //  用来进行跳转
    return cell;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataSource count];
}

@end
