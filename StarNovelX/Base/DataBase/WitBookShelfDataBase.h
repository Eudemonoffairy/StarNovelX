//
//  WitBookShelfDataBase.h
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/3.
//

#import <Foundation/Foundation.h>
#import "WitBookModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface WitBookShelfDataBase : NSObject
+(void)insertData:(WitBookModel *)aBook;
+(BOOL)queryData:(NSUInteger)bookID;
+(NSMutableArray *)traverseAllData;
+(void)deleteData:(NSUInteger)bookID;
+(void)updateData:(WitBookModel *)aBook;
+(void)updateData:(NSUInteger)bookID Readedchapter:(NSUInteger)readedChapter;
+(void)updateData:(NSUInteger)bookID chapterCount:(NSUInteger)chapterCount;
@end

NS_ASSUME_NONNULL_END
