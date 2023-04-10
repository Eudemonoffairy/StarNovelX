//
//  WitRecommendBlock.h
//  StarNovelX
//
//  Created by Martin Liu on 2023/2/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WitRecommendBlock : UICollectionViewCell
@property (nonatomic, strong)UILabel *cellTitle;
@property (nonatomic, strong)UIButton *rightButton;
@property (nonatomic, strong)NSMutableArray *dataSource;

@end

NS_ASSUME_NONNULL_END
