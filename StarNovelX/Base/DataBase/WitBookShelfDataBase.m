//
//  WitBookShelfDataBase.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/3.
//

#import "WitBookShelfDataBase.h"
#import "WitBookModel.h"
#import "FMDB.h"
@implementation WitBookShelfDataBase
static FMDatabaseQueue *_queue;


/// 初始化
+ (void)initialize{
    //  获取数据库文件路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [docPath stringByAppendingPathComponent:@"NOVELDATABASE.sqlite"];
    NSLog(@"%@", path);
    //  创建数据库对象
    FMDatabase *db = [FMDatabase databaseWithPath:path];
    //  打开数据库
    if([db open]){
        NSLog(@"打开数据库成功");
    }
    else{
        NSLog(@"打开数据库失败");
    }
    //  创建 BOOKSHELF 表
    _queue = [FMDatabaseQueue databaseQueueWithPath:path];
    ///  param
    ///  bookID  书本 ID
    ///  bookName  书本名称
    ///  bookAuthor  书本作者
    ///  bookCover  书本封面地址
    ///  bookType  书本类型
    ///  readedChapter  已读章节数
    ///  chapterCount  章节总数
    ///  bookIntroUrl  书本介绍页地址
    [_queue inDatabase:^(FMDatabase *db){
        NSString *createTableSqlString = @"CREATE TABLE IF NOT EXISTS BOOKSHELF_Table (bookID integer PRIMARY KEY, bookName text NOT NULL, bookAuthor text NOT NULL, bookCover text NOT NULL, bookType text NOT NULL, readedChapter integer NOT NULL, chapterCount integer NOT NULL,bookIntroUrl text NOT NULL)";
        [db executeUpdate:createTableSqlString];
    }];
}


/// 插入数据
/// @param aBook 插入数据的模型
+(void)insertData:(WitBookModel *)aBook{
    [_queue inDatabase:^(FMDatabase *db){
        NSString *sql = @"insert into BOOKSHELF_Table (bookID, bookName, bookAuthor, bookCover, bookType, readedChapter, chapterCount, bookIntroUrl) values(?, ?, ?, ?, ?, ?, ?, ?)";
        NSNumber *bookID = [NSNumber numberWithInteger:aBook.bookID];
        NSString *bookName = aBook.bookName;
        NSString *bookAuthor = aBook.bookAuthor;
        NSString *bookCover = aBook.bookCover;
        NSString *bookType = aBook.bookType;
        NSNumber *readedChapter = [NSNumber numberWithInteger:aBook.readedChapter];
        NSNumber *chapterCount = [NSNumber numberWithInteger:aBook.chapterCount];
        NSString *bookIntroUrl = aBook.bookIntroUrl;
        if([db executeUpdate:sql, bookID, bookName, bookAuthor, bookCover, bookType, readedChapter, chapterCount, bookIntroUrl]){
            NSLog(@"插入表 BOOKSHELF_Table 中记录 %@ 成功",bookID);
        }
        else{
            NSLog(@"插入表 BOOKSHELF_Table 中记录 %@ 失败",bookID);
        }
    }];
}

/// 查询数据
+(BOOL)queryData:(NSUInteger)bookID{
    NSNumber *bookIDObj = [NSNumber numberWithInteger:bookID];
    __block BOOL isExist = NO;
    [_queue inDatabase:^(FMDatabase * db) {
        NSString *sql = @"select bookID FROM BOOKSHELF_Table WHERE bookID = ?";
        FMResultSet *rs = [db executeQuery:sql, bookIDObj];
        if([rs next]){
            isExist = YES;
            NSLog(@"查询表 BOOKSHELF_Table 中记录 %@ 成功",bookIDObj);
        }
        [rs close];
        
    }];
    return isExist;
}

///  遍历 BOOKSHELF_Table
+(NSMutableArray *)traverseAllData{
    __block NSMutableArray *result = [NSMutableArray array];
    [_queue inDatabase:^(FMDatabase * db) {
        NSString *sql = @"select * FROM BOOKSHELF_Table";
        NSUInteger tablejilu = 0;
        FMResultSet *rs = [db executeQuery:sql];
        while([rs next]){
            WitBookModel *aBook = [[WitBookModel alloc]init];
            aBook.bookID = [rs intForColumnIndex:0];
            aBook.bookName = [rs stringForColumnIndex:1];
            aBook.bookAuthor = [rs stringForColumnIndex:2];
            aBook.bookCover = [rs stringForColumnIndex:3];
            aBook.bookType = [rs stringForColumnIndex:4];
            aBook.readedChapter = [rs intForColumnIndex:5];
            aBook.chapterCount = [rs intForColumnIndex:6];
            aBook.bookIntroUrl = [rs stringForColumnIndex:7];
            [result addObject:aBook];
            tablejilu ++;
        }
        NSLog(@"遍历 BOOKSHELF_Table 成功！");
        NSLog(@"共 %ld 条记录",tablejilu);
        [rs close];
    }];
    
     return result;
}



+(void)deleteData:(NSUInteger)bookID{
    NSNumber *bookIDObj = [NSNumber numberWithInteger:bookID];
    [_queue inDatabase:^(FMDatabase *  db) {
        NSString *sql = @"delete FROM BOOKSHELF_Table WHERE bookID = ?";
        if([db executeUpdate:sql, bookIDObj]){
            NSLog(@"删除表 BOOKSHELF_Table 记录成功， bookID = %@",bookIDObj);
        }
        else{
            NSLog(@"删除表 BOOKSHELF_Table 记录失败， bookID = %@",bookIDObj);
        }
    }];
}

+(void)updateData:(WitBookModel *)aBook{
    [_queue inDatabase:^(FMDatabase * db) {
        NSString *sql = @"update BOOKSHELF_Table set bookName = ?, bookAuthor = ?, bookCover = ?, bookType = ?, readedChapter = ?, chapterCount = ?, bookIntroUrl = ? where bookID = ?";
        NSNumber *bookID = [NSNumber numberWithInteger:aBook.bookID];
        NSString *bookName = aBook.bookName;
        NSString *bookAuthor = aBook.bookAuthor;
        NSString *bookCover = aBook.bookCover;
        NSString *bookType = aBook.bookType;
        NSNumber *readedChapter = [NSNumber numberWithInteger:aBook.readedChapter];
        NSNumber *chapterCount = [NSNumber numberWithInteger:aBook.chapterCount];
        NSString *bookIntroUrl = aBook.bookIntroUrl;
        if([db executeUpdate:sql, bookName, bookAuthor, bookCover, bookType, readedChapter, chapterCount, bookIntroUrl, bookID]){
            NSLog(@"更新表 BOOKSHELF_Table 成功， bookID = %@",bookID);
        }
        else{
            NSLog(@"更新表 BOOKSHELF_Table 失败， bookID = %@",bookID);
        }
    }];
}
+(void)updateData:(NSUInteger)bookID Readedchapter:(NSUInteger)readedChapter{
    [_queue inDatabase:^(FMDatabase * db) {
        NSNumber *bookIDObj = [NSNumber numberWithInteger:bookID];
        NSNumber *readedChapterObj = [NSNumber numberWithInteger:readedChapter];
        NSString *sql = @"update BOOKSHELF_Table readedChapter = ? where bookID = ?";
        
        if([db executeUpdate:sql,readedChapterObj, bookIDObj]){
            NSLog(@"更新表 BOOKSHELF_Table 阅读进度 成功， bookID = %@",bookIDObj);
        }
        else{
            NSLog(@"更新表 BOOKSHELF_Table 阅读进度 失败， bookID = %@",bookIDObj);
        }
    }];
}
+(void)updateData:(NSUInteger)bookID chapterCount:(NSUInteger)chapterCount{
    [_queue inDatabase:^(FMDatabase * db) {
        NSNumber *bookIDObj = [NSNumber numberWithInteger:bookID];
        NSNumber *chapterCountObj = [NSNumber numberWithInteger:chapterCount];
        NSString *sql = @"update BOOKSHELF_Table chapterCount = ? where bookID = ?";
        
        if([db executeUpdate:sql, chapterCountObj, bookIDObj]){
            NSLog(@"更新表 BOOKSHELF_Table 章节总数 成功， bookID = %@",bookIDObj);
        }
        else{
            NSLog(@"更新表 BOOKSHELF_Table 章节总数 失败， bookID = %@",bookIDObj);
        }
    }];
}

@end
