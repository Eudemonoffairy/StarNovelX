//
//  WitUserInfoBlockView.h
//  StarNovelX
//
//  Created by Martin Liu on 2023/1/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WitUserInfoBlockView : UIView
@property (nonatomic, strong)UIImageView *avatar;       ///< 用户头像
@property (nonatomic, strong)UILabel *username;     ///< 用户名
@property (nonatomic, strong)UIButton *loginButton; ///< 登录按钮


@end

NS_ASSUME_NONNULL_END
