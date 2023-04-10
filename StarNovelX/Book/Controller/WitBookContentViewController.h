//
//  WitBookContentViewController.h
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/7.
//

#import <UIKit/UIKit.h>
#import "WitPageContentView.h"
NS_ASSUME_NONNULL_BEGIN

@interface WitBookContentViewController : UIViewController

@property (nonatomic, strong)WitPageContentView *contentView;
///   用于显示章节名称和阅读进度
@property (nonatomic, strong)UILabel *informationLabel;
///  页面内容字符串
@property (nonatomic) NSString *contentStr;
///  章节标题
@property (nonatomic) NSString *chapterTitle;
///  章节号
@property (nonatomic) NSUInteger chapterIdx;
///  当前的页码
@property (nonatomic) NSUInteger nowPage;
///  章节总页码
@property (nonatomic) NSUInteger pageCount;

-(instancetype)initWithContent:(NSString *)content ChapterIdx:(NSUInteger)chapterIdx ChapterTitle:(NSString *)chapterTitle NowPage:(NSUInteger)nowPage PageCount:(NSUInteger)pageCount;

@end

NS_ASSUME_NONNULL_END
