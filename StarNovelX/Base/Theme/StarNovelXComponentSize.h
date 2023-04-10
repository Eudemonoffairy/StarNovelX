//
//  StarNovelXComponentSize.h
//  StarNovelX
//
//  Created by Martin Liu on 2022/8/21.
//  组件尺寸

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

///  列表模式高度
#define LIST_CELL_HEIGHT 136
///  列表模式宽度
#define LIST_CELL_WIDTH (SCREEN_WIDTH - 16)
///  宫格模式高度
#define GRID_CELL_HEIGHT ((GRID_CELL_WIDTH / 0.8) + 32)
///  宫格模式宽度
#define GRID_CELL_WIDTH (SCREEN_WIDTH/3 - 12)

///  列表模式图片宽度
#define LIST_COVER_WIDTH (128 * 0.8)
///  列表模式图片高度
#define LIST_COVER_HEIGHT 128
///  宫格模式图片宽度
#define GRID_COVER_WIDTH (GRID_CELL_WIDTH - 4)
///  宫格模式图片高度
#define GRID_COVER_HEIGHT (GRID_COVER_WIDTH / 0.8)

///  发现页分类图标的大小
#define CLASSIFY_CELL_WIDTH (SCREEN_WIDTH/6-10)
#define CLASSIFY_CELL_HEIGHT (CLASSIFY_CELL_WIDTH+26)

///  发现页推荐的大小
#define RECOMMEND_CELL_WIDTH  (128 * 0.8)
#define RECOMMEND_CELL_HEIGHT (128 + 24)

///  书本详细页图片大小
#define DETAIL_COVER_WIDTH 128
#define DETAIL_COVER_HEIGHT (128 * 1.25)

/// 阅读界面内容大小
#define PAGE_CONTENT_WIDTH (SCREEN_WIDTH - 20)
#define PAGE_CONTENT_HEIGHT (SCREEN_HEIGHT - 48)

@interface StarNovelXComponentSize : NSObject

@end

NS_ASSUME_NONNULL_END
