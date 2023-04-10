//
//  WitMoreMenu.h
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WitMoreMenu : UIView

//  更多菜单标题和返回按钮
@property (nonatomic, strong)UILabel *moreMenuLabel;
@property (nonatomic, strong)UIButton *backToBottomBtn;

///  亮度设置界面
@property (nonatomic, strong)UIView *brightnessView;
@property (nonatomic, strong)UILabel *brightnessLabel;
@property (nonatomic, strong)UIImageView *turnUpBrightness;
@property (nonatomic, strong)UIImageView *turnDownBrightness;
@property (nonatomic, strong)UISlider *brightnessSlider;
@property (nonatomic) CGFloat brightnessValue;
///  背景
@property (nonatomic, strong)UIView *switchBackGroundView;
@property (nonatomic, strong)UILabel *switchBackGroundLabel;
@property (nonatomic, strong)UIButton *backgroung_1;
@property (nonatomic, strong)UIButton *backgroung_2;
@property (nonatomic, strong)UIButton *backgroung_3;
@property (nonatomic, strong)UIButton *backgroung_4;
@property (nonatomic, strong)UIButton *backgroung_5;

///  字体大小
@property (nonatomic, strong)UIView *adjustFontView;
@property (nonatomic, strong)UILabel *adjustFontLabel;
@property (nonatomic, strong)UILabel *fontSizeLabel;
@property (nonatomic, strong)UIButton *enlargeFont;
@property (nonatomic, strong)UIButton *ensmallFont;
///  行间距
@property (nonatomic, strong)UIView *linespacingView;
@property (nonatomic, strong)UILabel *linespacingLabel;
@property (nonatomic, strong)UIButton *linespacingSmall;
@property (nonatomic, strong)UIButton *linespacingMiddle;
@property (nonatomic, strong)UIButton *linespacingLarge;
@end

NS_ASSUME_NONNULL_END
