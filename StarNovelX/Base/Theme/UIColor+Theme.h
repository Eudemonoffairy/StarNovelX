//
//  UIColor+Theme.h
//  StarNovelX
//
//  Created by Martin Liu on 2022/8/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Theme)


+(UIColor *)moliRed;
+(UIColor *)jingzi;
+(UIColor *)yaju;
+(UIColor *)honglan;

+(UIColor *)orangeTheme;
+(UIColor *)bookCellTitle;
+(UIColor *)bookCellAuthor;
+(UIColor *)themeColor;
+(UIColor *)readFontColor;


+(UIColor *)readBackGroundColor:(NSUInteger)colorIdx;

@end

NS_ASSUME_NONNULL_END
