//
//  WitInitApp.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/8.
//

#import "WitInitApp.h"

@implementation WitInitApp
+ (void)firstLoadApp{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if(![defaults valueForKey:FIRST_LOAD]){
        //  第一次加载 app
        //  标记已经启动了 APP
        [defaults setValue:@"YES" forKey:FIRST_LOAD];
        //  初始化阅读页面字体大小
        [defaults setInteger:17 forKey:@"READFONTSIZE"];
        //  初始化阅读页面行间距
        [defaults setInteger:10 forKey:@"READLINESPACING"];
        
        
        
        
        
    }
}
@end
