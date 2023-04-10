//
//  WitParseRecource.h
//  StarNovelX
//
//  Created by Martin Liu on 2023/2/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WitParseRecource : NSObject
+(NSMutableArray *)GetRecommendResource:(NSString *)pageURL;
@end

NS_ASSUME_NONNULL_END
