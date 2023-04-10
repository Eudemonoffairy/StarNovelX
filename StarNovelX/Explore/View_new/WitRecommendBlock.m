//
//  WitRecommendBlock.m
//  StarNovelX
//
//  Created by Martin Liu on 2023/2/2.
//

#import "WitRecommendBlock.h"
#import "WitRecommendCell.h"
#define RECOMMEND_CELL_INDENTIFIER @"cell"

@interface WitRecommendBlock()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)UICollectionViewFlowLayout *cellLayout;

@end
@implementation WitRecommendBlock


#pragma mark - 懒加载
- (UICollectionView *)collectionView{
    if(!_collectionView){
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.cellLayout];
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[WitRecommendCell class] forCellWithReuseIdentifier:RECOMMEND_CELL_INDENTIFIER];
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)cellLayout{
    if(!_cellLayout){
        _cellLayout = [[UICollectionViewFlowLayout alloc]init];
        _cellLayout.minimumLineSpacing = 8;
        _cellLayout.minimumInteritemSpacing = 8;
        _cellLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _cellLayout.itemSize = CGSizeMake(128, 200);
        _cellLayout.sectionInset = UIEdgeInsetsMake(8, 8, 8, 8);
    }
    return _cellLayout;
}


@end
