//
//  UIColor+Extension.h
//  StarNovel
//
//  Created by Martin Liu on 2022/6/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Extension)

+(UIColor *)colorWithHex:(NSString *)color alpha:(CGFloat)alpha;
+(UIColor *)colorWithHex:(NSString *)color;

@end

NS_ASSUME_NONNULL_END
