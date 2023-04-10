//
//  WitBookShelfCell.h
//  StarNovelX
//
//  Created by Martin Liu on 2022/8/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger{
    XUANHUAN = 1,           ///<  玄幻
    QIHUAN,                 ///<  奇幻
    WUXIA,                  ///<  武侠
    XIANXIA,                ///<  仙侠
    DUSHI,                  ///<  都市
    XIANSHI,                ///<  现实
    JUNSHI,                 ///<  军事
    LISHI,                  ///<  历史
    YOUXI,                  ///<  游戏
    JINGJI,                 ///<  竞技
    KEHUAN,                 ///<  科幻
    XUANYI,                 ///<  悬疑
    YANQING,                ///<  言情
    QINGXIAOSHUO,           ///<  轻小说
}BookType;

@interface WitBookShelfCell : UICollectionViewCell
///  内容视图
@property (nonatomic, strong)UIView *contentCell;
///  小说封面
@property (nonatomic, strong)UIImageView *bookCoverImg;
///  小说名称
@property (nonatomic, strong)UILabel *bookNameLabel;
///  作者名称
@property (nonatomic, strong)UILabel *authorNameLabel;
///  章节标签
@property (nonatomic, strong)UILabel *chapterLabel;
///  已阅章节数
@property (nonatomic) NSUInteger readedChapter;
///  总章节数
@property (nonatomic) NSUInteger allChapter;
@property (nonatomic)NSString *bookType;     ///<  书本类型
@property (nonatomic)BOOL isGrid;           ///<  展示模式:默认是网格
@property (nonatomic)UIVisualEffectView *visualEffectView;
@end

NS_ASSUME_NONNULL_END
