//
//  WitAccessResources.h
//  StarNovelX
//
//  Created by Martin Liu on 2022/8/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WitAccessResources : NSObject
///  获取主页内容
+(NSMutableArray<NSMutableDictionary *> *)accessResourceHomePage;
///  获取介绍页的内容
+(NSMutableDictionary *)accessReourceIntroPage:(NSURL *)url;
///  获取书本目录
+(NSMutableArray *)accessBookCatalog:(NSURL *)url;
///  获取书本内容
+(NSString *)accessBookContent:(NSURL *)url;
@end

NS_ASSUME_NONNULL_END
