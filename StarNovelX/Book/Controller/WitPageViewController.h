//
//  WitPageViewController.h
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/7.
//

#import <UIKit/UIKit.h>
#import "WitCatalogModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface WitPageViewController : UIPageViewController
@property (nonatomic, strong)NSMutableArray<WitCatalogModel *> *catalogData;
@property (nonatomic, strong)NSMutableDictionary *contentDic;   //  key：章节号对象，value 章节号对应的内容数组
@property (nonatomic, strong)NSString *bookIntroUrl;
@property (nonatomic, strong)UILabel *informationLabel;
@property (nonatomic) NSString *bookTitle;

///  用于制作亮度的视图
@property (nonatomic, strong)UIView *darkView;

@end

NS_ASSUME_NONNULL_END
