//
//  WitNetworkStatus.h
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WitNetworkStatus : NSObject
typedef enum : NSUInteger{
    STATUSUNKNOWN = 0,              ///<  未知的网络
    STATUSNOTREACHABLE,             ///<  未连接网络
    STATUSVIAWWAN,                  ///<  通过移动数据/蜂窝数据进行连接
    STATUSVIAWIFI                   ///<  通过 WIFI 进行连接
}NetworkSatus;

+(void)getNetworkStatus:(void(^)(NetworkSatus status))netStatus;
+(void)hasNetworking:(void(^)(BOOL has))hasNetwork;
+(void)checkNetworkStatus;
@end

NS_ASSUME_NONNULL_END
