//
//  WitNetworkStatus.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/17.
//  参考：https://www.jianshu.com/p/d63bd93b363d

#import "WitNetworkStatus.h"
#import "AFNetworking/AFNetworkReachabilityManager.h"
@implementation WitNetworkStatus



+(void)getNetworkStatus:(void(^)(NetworkSatus status))netStatus{
//    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    //  创建网路监听对象
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    //  开始监听
    [manager startMonitoring];
    //  监听改变
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                //  未知的网络状态
                netStatus(STATUSUNKNOWN);
                NSLog(@"未知网络");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                //  无网络连接
                netStatus(STATUSNOTREACHABLE);
                NSLog(@"无网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                //  使用移动数据/蜂窝数据 进行网络连接
                netStatus(STATUSVIAWWAN);
                NSLog(@"移动数据网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                //  使用 WiFi 进行网络连接
                netStatus(STATUSVIAWIFI);
                NSLog(@"WIFI");
                break;
            default:
                netStatus(STATUSUNKNOWN);
                NSLog(@"未知网络2");
                break;
        }
    }];

    [manager startMonitoring];

}

+(void)hasNetworking:(void(^)(BOOL has))hasNetwork{
        //  创建网路监听对象
        AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
        //  开始监听
        [manager startMonitoring];
        //  监听改变
        [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusUnknown:
                    //  未知的网络状态
                case AFNetworkReachabilityStatusNotReachable:
                    //  无网络连接
                    hasNetwork(NO);
                    break;
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    //  使用移动数据/蜂窝数据 进行网络连接
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    //  使用 WiFi 进行网络连接
                    hasNetwork(YES);
                    break;
                default:
                    hasNetwork(NO);
                    break;
            }
        }];
        [manager startMonitoring];
}

+(void)checkNetworkStatus{
    //  创建一个用于测试的 url
    NSURL *url = [NSURL URLWithString:@"http://www.apple.com"];
    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc]initWithBaseURL:url];
    
    //  根据不同的网络状态改变去做相应处理
    [sessionManager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"无网络连接");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"移动数据网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WIFI");
            default:
                NSLog(@"未知网络2");
                break;
        }
    }];
    
    [sessionManager.reachabilityManager startMonitoring];
}






@end
