//
//  WitBookModel.h
//  StarNovelX
//
//  Created by Martin Liu on 2022/8/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WitBookModel : NSObject
/// 书本 ID
@property (nonatomic)NSUInteger bookID;
/// 书本名称
@property (nonatomic)NSString *bookName;
/// 书本作者
@property (nonatomic)NSString *bookAuthor;
/// 书本封面链接字符串
@property (nonatomic)NSString *bookCover;
/// 书本类型
@property (nonatomic)NSString *bookType;
/// 已读章节数
@property (nonatomic)NSUInteger readedChapter;
/// 章节总数
@property (nonatomic)NSUInteger chapterCount;
/// 书本介绍页链接字符串
@property (nonatomic)NSString *bookIntroUrl;

@end

NS_ASSUME_NONNULL_END
