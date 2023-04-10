//
//  WitParseRecource.m
//  StarNovelX
//
//  Created by Martin Liu on 2023/2/2.
//

#import "WitParseRecource.h"

@implementation WitParseRecource


/// 由于笔趣阁的首页和分类页里的代码格式不一样，因此重新写一套
+(NSMutableArray *)GetRecommendResource:(NSString *) pageURL{
    NSMutableArray *resultArr = [NSMutableArray array];
    NSError *error = nil;
    //  GBK 编码
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    //  网页内容为 GBK 编码， 解析网页内容
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:pageURL]];
    //  将网页内容数据转换成字符串对象
    NSString *htmlContent = [[NSString alloc]initWithData:data encoding:gbkEncoding];
    //  转换成 ONO文档对象
    ONOXMLDocument *document = [ONOXMLDocument XMLDocumentWithString:htmlContent encoding:NSUTF8StringEncoding error:&error];
    [document enumerateElementsWithXPath:@"//*[@class='shu_cont']" usingBlock:^(ONOXMLElement * _Nonnull element, NSUInteger idx, BOOL * _Nonnull stop) {
        ONOXMLElement *bookImage = [element firstChildWithXPath:@"div[1]/a/img/@src"];
        NSString *imgStr = [bookImage stringValue];
        [resultArr addObject:imgStr];
    }];
    return resultArr;
}



@end
