//
//  WitCatalogViewController.h
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/7.
//

#import <UIKit/UIKit.h>
#import "WitCatalogModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface WitCatalogViewController : UIViewController

@property (nonatomic, strong)NSMutableArray<WitCatalogModel *> *dataSource;

@end

NS_ASSUME_NONNULL_END
