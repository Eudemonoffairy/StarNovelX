//
//  WitProcessResources.h
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/7.
//  处理资源

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WitProcessResources : NSObject
///  以用户偏好所记录的字体大小、行间距划分内容
+(NSMutableArray *)divideContent:(NSString *)contentStr;
+(NSMutableArray *)divideContent:(NSString *)contentStr ViewSize:(CGSize)viewSize LineSpacing:(CGFloat)lineSpacing FontSize:(CGFloat)fontSize;
+(NSString *)purifyContent:(NSString *)contentStr BookTitle:(NSString *)bookTitle ChapterTitle:(NSString *)chapterTitle;
@end

NS_ASSUME_NONNULL_END
