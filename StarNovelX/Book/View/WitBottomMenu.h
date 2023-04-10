//
//  WitBottomMenu.h
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WitBottomMenu : UIView
///  显示章节目录
@property (nonatomic, strong)UIButton *showCatalogButton;
///  切换显示模式
@property (nonatomic, strong)UIButton *switchDisplayButton;
///  更多设置
@property (nonatomic, strong)UIButton *moreSettingButton;

@end

NS_ASSUME_NONNULL_END
