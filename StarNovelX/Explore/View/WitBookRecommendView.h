//
//  WitBookRecommendView.h
//  StarNovelX
//
//  Created by Martin Liu on 2022/8/28.
//  推荐栏视图

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WitBookRecommendView : UIView
@property (nonatomic, strong)UIButton *recommendButton;     ///<  去推荐项目所在分类
@property (nonatomic, strong)NSMutableArray<NSMutableDictionary *> *dataSource;     ///<  推荐的资源列表

@end

NS_ASSUME_NONNULL_END
