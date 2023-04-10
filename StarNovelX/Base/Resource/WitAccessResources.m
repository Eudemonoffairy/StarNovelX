//
//  WitAccessResources.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/8/26.
//

#import "WitAccessResources.h"
#import "WitCatalogModel.h"
@implementation WitAccessResources


/// 获取小说主页资源
+(NSMutableArray<NSMutableDictionary *> *)accessResourceHomePage{
//    if(![AFNetworkReachabilityManager sharedManager].isReachable){
//        //  如果当前没有网络连接
//        return nil;
//    }
//    [WitNetworkStatus checkNetworkStatus];
    NSMutableArray *result = [NSMutableArray array];
    NSError *error = nil;
    //  gbk编码
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    //  网页内容为 gbk 编码，解析网页内容
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://www.bbiquge.net"]];
    //  将网页内容数据转化为字符串对象
    NSString *htmlContent = [[NSString alloc]initWithData:data encoding:gbkEncoding];
    //  转换成 ONO文档对象（转换为 UTF8 ？）
    ONOXMLDocument *document = [ONOXMLDocument XMLDocumentWithString:htmlContent encoding:NSUTF8StringEncoding error:&error];
    
    [document enumerateElementsWithXPath:@"//*[@id='container']/div[@class='item']" usingBlock:^(ONOXMLElement * _Nonnull element, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableDictionary *resuleDic = [NSMutableDictionary dictionary];
        ONOXMLElement *bookImg = [element firstChildWithXPath:@"div[1]/a/img/@src"];
        NSString *aImg =[bookImg stringValue];
         
        ONOXMLElement *bookTitle = [element firstChildWithXPath:@"div[2]/dl/dt/a"];
        NSString *aTitle =[bookTitle stringValue];
      
        ONOXMLElement *bookIntro = [element firstChildWithXPath:@"div[1]/a/@href"];
        NSString *aIntro =[bookIntro stringValue];
     
        [resuleDic setObject:aImg forKey:@"IMG"];
        [resuleDic setObject:aTitle forKey:@"TITLE"];
        [resuleDic setObject:aIntro forKey:@"INTRO"];
        [result addObject:resuleDic];
        }];
//    //  根据 Xpath 规则获取对应节点
//    ONOXMLElement * aElem = [document firstChildWithXPath:@"/html/body/a"];
//    //  输出节点内容
//    NSLog(@"%@",[aElem stringValue]);
    
    return result;
}


/// 获取小说介绍页资源
/// @param url 介绍页 url
+(NSMutableDictionary *)accessReourceIntroPage:(NSURL *)url{
//    if(![AFNetworkReachabilityManager sharedManager].isReachable){
//        //  如果当前没有网络连接
//        return nil;
//    }
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    NSError *error = nil;
    //  gbk编码
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    //  网页内容为 gbk 编码，解析网页内容
    NSData *data = [NSData dataWithContentsOfURL:url];
    //  将网页内容数据转化为字符串对象
    NSString *htmlContent = [[NSString alloc]initWithData:data encoding:gbkEncoding];
    //  转换成 ONO文档对象（转换为 UTF8 ？）
    ONOXMLDocument *document = [ONOXMLDocument XMLDocumentWithString:htmlContent encoding:NSUTF8StringEncoding error:&error];
    
    
    //  获取书本 ID
    NSString *urlStr = [url absoluteString];
    NSArray *urlArr = [urlStr componentsSeparatedByString:@"/"];
    NSString *IDStr = urlArr[4];
    
    //  获取书名名称和作者名称
    ONOXMLElement *nameANDauthor = [document firstChildWithXPath:@"//*[@id='info']/h1"];
    NSString *nameANDauthorStr = [nameANDauthor stringValue];
    NSArray<NSString *> *array = [[nameANDauthorStr stringByReplacingOccurrencesOfString:@" " withString:@""]componentsSeparatedByString:@"/"] ;
//    NSLog(@"%@,",array[0]);
//    NSLog(@"%@,",array[1]);
    
    //  获取书本封面
    ONOXMLElement *Cover = [document firstChildWithXPath:@"//*[@id='picbox']/div/img/@src"];
    NSString *CoverStr = [Cover stringValue];
//    NSLog(@"%@", CoverStr);
//
    //  获取书本简介
    ONOXMLElement *info = [document firstChildWithXPath:@"//*[@id='intro']"];
    NSString *infoStr = [info stringValue];
//    NSLog(@"%@", infoStr);

    //  获取书本类型
    ONOXMLElement *type = [document firstChildWithXPath:@"//*[@id='bookdetail']/div[1]/a[2]"];
    NSString *typeStr = [type stringValue];
//    NSLog(@"%@", typeStr);
    
    [result setObject:IDStr forKey:@"ID"];
    [result setObject:array[0] forKey:@"NAME"];
    [result setObject:array[1] forKey:@"AUTHOR"];
    [result setObject:CoverStr forKey:@"COVER"];
    [result setObject:infoStr forKey:@"INFO"];
    [result setObject:typeStr forKey:@"TYPE"];
    return result;
}


/// 获取小说内容
/// @param url 小说内容页
+(NSString *)accessBookContent:(NSURL *)url{
        if(![AFNetworkReachabilityManager sharedManager].isReachable){
            return nil;
        }
    NSError *error = nil;
    //  gbk编码
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    //  网页内容为 gbk 编码，解析网页内容
    NSData *data = [NSData dataWithContentsOfURL:url];
    //  将网页内容数据转化为字符串对象
    NSString *htmlContent = [[NSString alloc]initWithData:data encoding:gbkEncoding];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"<br />" withString:@"\n"];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"\n\n" withString:@"\n\t "];
    //  转换成 ONO文档对象（转换为 UTF8 ？）
    ONOXMLDocument *document = [ONOXMLDocument XMLDocumentWithString:htmlContent encoding:NSUTF8StringEncoding error:&error];
    //  获取此章节内容
    ONOXMLElement *chapterContent = [document firstChildWithXPath:@"//*[@id='content']"];
    NSString *chapterContentStr = [chapterContent stringValue];
    return chapterContentStr;
}

+(NSMutableArray *)accessBookCatalog:(NSURL *)url{
    if(![AFNetworkReachabilityManager sharedManager].isReachable){
        //  如果当前没有网络连接
        return nil;
    }
    NSError *error = nil;
    //  gbk编码
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    //  网页内容为 gbk 编码，解析网页内容
    NSData *data = [NSData dataWithContentsOfURL:url];
    //  将网页内容数据转化为字符串对象
    NSString *htmlContent = [[NSString alloc]initWithData:data encoding:gbkEncoding];
    //  “网站特色”，需要排除掉这个才能够收集
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"disabled" withString:@""];
    //  转换成 ONO文档对象（转换为 UTF8 ？）
    ONOXMLDocument *document = [ONOXMLDocument XMLDocumentWithString:htmlContent encoding:NSUTF8StringEncoding error:&error];
    //  获取目录内容
    __block NSMutableArray *catalogArr = [NSMutableArray array];
    [document enumerateElementsWithXPath:@"//dl[@class ='zjlist']/dd" usingBlock:^(ONOXMLElement * _Nonnull element, NSUInteger idx, BOOL * _Nonnull stop) {
        ONOXMLElement *chapterTitle = [element firstChildWithXPath:@"a"];
        NSString *catalogName = [chapterTitle stringValue];
        ONOXMLElement *chapterUrl = [element firstChildWithXPath:@"a/@href"];
        NSString *catalogUrl = [chapterUrl stringValue];
        if(catalogName != nil && catalogUrl != nil){
            WitCatalogModel *aCatalog = [[WitCatalogModel alloc]init];
            aCatalog.catalogName = catalogName;
            aCatalog.catalogUrl = catalogUrl;
            [catalogArr addObject:aCatalog];
        }
    }];
    //  获取下一页目录
    ONOXMLElement *nextEdge = [document firstChildWithXPath:@"//div[@class='zjbox']/div/span[2]/a/@href"];
    if([[nextEdge stringValue] isEqualToString:@"javascript:"]){
        //  说明此时是最后一页目录
        return catalogArr;
    }
    else{
        NSString *nextEdgeStr = [@"https://www.bbiquge.net" stringByAppendingString:[nextEdge stringValue]];
        NSURL *nextEdgeUrl = [NSURL URLWithString:nextEdgeStr];
//        NSString *nextEdgeStr = [UrlStr stringByAppendingString:[nextEdge stringValue]];
        
        NSMutableArray *nextEdgeArr = [NSMutableArray array];
        nextEdgeArr = [WitAccessResources accessBookCatalog:nextEdgeUrl];
        [catalogArr addObjectsFromArray:nextEdgeArr];
        return catalogArr;
    }
 
}

@end
