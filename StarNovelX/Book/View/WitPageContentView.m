//
//  WitPageContentView.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/7.
//  书本页面内容视图

#import "WitPageContentView.h"
#import "CoreText/CoreText.h"
@implementation WitPageContentView
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
//    self.backgroundColor = [UIColor clearColor];
   
    
    //  获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //  在上下文中,创建一个标准坐标系
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    //  将上下文中的原点,进行平行移动,下面是沿着 y 轴方向移动,从而转换成屏幕坐标系
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    //  翻转 y 轴正方
    CGContextScaleCTM(context, 1, -1);
    // 绘制区域
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);

    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSNumber *numObj2 = [defaults objectForKey:@"readLineSpacing"];
//    CGFloat lineSpacing = [numObj2 floatValue];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *linespacingNumber = [defaults objectForKey:@"READLINESPACING"];
    paragraphStyle.lineSpacing = [linespacingNumber integerValue];
    // 绘制的内容属性字符串
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:self.contentFontSize],
                                 NSForegroundColorAttributeName: [UIColor readFontColor],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self.contentStr attributes:attributes];

    // 使用NSMutableAttributedString创建CTFrame
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attrStr);
    //  四个参数:framesetter: 生成 frame 的工厂  range : 显示字符串的范围
    //         path:  绘制的区域     frameAttributes: 额外控制 frame的属性字典
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attrStr.length), path, NULL);

    // 使用CTFrame在CGContextRef上下文上绘制
    CTFrameDraw(frame, context);
    
}
//- (instancetype)initWithFrame:(CGRect)frame Content:(NSString *)contentStr{
//    self = [super initWithFrame:frame];
//    self.contentStr = contentStr;
//    return self;
//}

- (instancetype)init{
    self = [super init];
    self.backgroundColor = [UIColor clearColor];
    return self;
}

- (CGFloat)contentFontSize{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *fontsizeNumber = [defaults objectForKey:@"READFONTSIZE"];
    _contentFontSize = [fontsizeNumber integerValue];
    return _contentFontSize;
}

- (CGFloat)lineSpacing{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *linespacingNumber = [defaults objectForKey:@"READLINESPACING"];
    _lineSpacing = [linespacingNumber integerValue];
    return _lineSpacing;
}
@end
