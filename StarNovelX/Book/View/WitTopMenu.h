//
//  WitTopMenu.h
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/9.
//  阅读器中顶部菜单

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WitTopMenu : UIView
//  TODO: 记录返回的页面
///  返回按钮
@property (nonatomic, strong)UIButton *backButton;
///  加入书架按钮
@property (nonatomic, strong)UIButton *addBookShelfButton;
@end

NS_ASSUME_NONNULL_END
