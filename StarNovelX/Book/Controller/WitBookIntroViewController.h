//
//  WitBookIntroViewController.h
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/1.
//  书本介绍视图控制器

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WitBookIntroViewController : UIViewController

@property (nonatomic)NSUInteger bookID;                         ///<  书本 ID
@property (nonatomic, strong)UIImageView *bookCover;            ///<  书本封面
@property (nonatomic, strong)NSString *bookCoverStr;            ///<  书本封面Url字符串
@property (nonatomic, strong)UILabel *bookName;                 ///<  书本名称
@property (nonatomic, strong)UILabel *bookAuthor;               ///<  作者名
@property (nonatomic, strong)UILabel *bookType;                 ///<  书本类型
@property (nonatomic, strong)UITextView *bookInfo;              ///<  书本简介
@property (nonatomic, strong)UIImageView *topView;              ///<  上半部分背景视图
@property (nonatomic, strong)UIView *buttonView;                ///<  按钮承接视图
@property (nonatomic, strong)UIButton *showCatalog;             ///<  显示目录按钮
@property (nonatomic, strong)UIButton *addBookShelf;            ///<  加入书架按钮
@property (nonatomic, strong)UIButton *startRead;               ///<  开始阅读按钮
@property (nonatomic, strong)NSString *bookIntroUrl;            ///<  书本介绍页Url字符串


- (instancetype)initWithID:(NSUInteger)bookID Name:(NSString *)bookName author:(NSString *)bookAuthor type:(NSString *)bookType info:(NSString *)bookInfo coverURL:(NSString *)coverURL;
@end

NS_ASSUME_NONNULL_END
