//
//  WitVerticalCollectionViewCell.h
//  StarNovelX
//
//  Created by Martin Liu on 2022/8/28.
//  垂直的 CollectionViewCell

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum:NSUInteger {
    CLASSIFY_CELL = 1,          ///<  分类
    RECOMMEND_CELL              ///<  推荐
}CellType;

@interface WitVerticalCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong)UIImageView *cellImg;
@property (nonatomic, strong)UILabel *cellTitle;
@property (nonatomic)CellType type;
@property (nonatomic)NSString *introURL;
-(void)setImage:(UIImageView *)cellImg AndTitle:(NSString *)cellTitle;

@end

NS_ASSUME_NONNULL_END
