//
//  WitCatalogModel.h
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WitCatalogModel : NSObject
/// 章节标题
@property (nonatomic, strong)NSString *catalogName;
/// 标题链接
@property (nonatomic, strong)NSString *catalogUrl;
@end

NS_ASSUME_NONNULL_END
