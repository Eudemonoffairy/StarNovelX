//
//  WitProcessResources.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/7.
//

#import "WitProcessResources.h"
#import "CoreText/CoreText.h"
@implementation WitProcessResources

//  划分内容
+(NSMutableArray *)divideContent:(NSString *)contentStr{
    //  阅读页面窗口大小
    CGSize viewSize = CGSizeMake(PAGE_CONTENT_WIDTH, PAGE_CONTENT_HEIGHT);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSUInteger fontSize = [defaults integerForKey:@"READFONTSIZE"];
    NSUInteger lineSpacing = [defaults integerForKey:@"READLINESPACING"];
    return [WitProcessResources divideContent:contentStr ViewSize:viewSize LineSpacing:lineSpacing FontSize:fontSize];
}




+(NSMutableArray *)divideContent:(NSString *)contentStr ViewSize:(CGSize)viewSize LineSpacing:(CGFloat)lineSpacing FontSize:(CGFloat)fontSize{
    NSMutableArray<NSString *> *result = [NSMutableArray array];
    //  模拟需要显示的区域以划分章节内容
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    
    paragraphStyle.lineSpacing = lineSpacing;
    
    //  绘制内容的属性
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],NSForegroundColorAttributeName:[UIColor systemBlueColor],NSParagraphStyleAttributeName:paragraphStyle};
    
    //  创建富文本
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:contentStr attributes:attributes];
    
    //  使用 atrStr 创建 CTFrame
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attrStr);
    CFRange aRange = CFRangeMake(0, 0);
    while (aRange.location < [contentStr length]) {
        CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(aRange.location, 0), NULL, viewSize, &aRange);
        NSString *aStr = [contentStr substringWithRange:NSMakeRange(aRange.location, aRange.length)];
        [result addObject:aStr];
        aRange.location = aRange.location + aRange.length;
    }
    return result;
}


///  净化内容
///  主要是将笔趣阁 www.bbiquge.net，最快更新【小说标题】最新章节！ 修改为章节标题
+(NSString *)purifyContent:(NSString *)contentStr BookTitle:(NSString *)bookTitle ChapterTitle:(NSString *)chapterTitle{
    NSString *beReplacedStr = [NSString stringWithFormat:@"笔趣阁 www.bbiquge.net，最快更新%@最新章节！",bookTitle];
    contentStr = [contentStr stringByReplacingOccurrencesOfString:beReplacedStr withString:chapterTitle];
    return contentStr;
}

@end
