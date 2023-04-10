//
//  WitBookContentViewController.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/7.
//

#import "WitBookContentViewController.h"

@interface WitBookContentViewController ()

@end

@implementation WitBookContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.contentView];
//    [self.view addSubview:self.informationLabel];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).mas_offset(20);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(PAGE_CONTENT_WIDTH, PAGE_CONTENT_HEIGHT));
    }];
}
-(instancetype)initWithContent:(NSString *)content ChapterIdx:(NSUInteger)chapterIdx ChapterTitle:(NSString *)chapterTitle NowPage:(NSUInteger)nowPage PageCount:(NSUInteger)pageCount {
    self = [super init];
    self.chapterIdx = chapterIdx;
    self.contentStr = content;
    self.chapterTitle = chapterTitle;
    self.nowPage = nowPage;
    self.pageCount = pageCount;
    return self;
}
#pragma mark - 懒加载
- (UILabel *)informationLabel{
    if(!_informationLabel){
        _informationLabel = [[UILabel alloc]init];
        _informationLabel.text = [NSString stringWithFormat:@"%@\t\t(%ld / %ld)", self.chapterTitle, self.nowPage, self.pageCount];
        _informationLabel.backgroundColor = [UIColor grayColor];
        _informationLabel.textAlignment = NSTextAlignmentCenter;
        _informationLabel.font = [UIFont font_13];
    }
    return _informationLabel;
}


- (WitPageContentView *)contentView{
    if(!_contentView){
        _contentView = [[WitPageContentView alloc]init];
        _contentView.contentStr = self.contentStr;
    
    }
    return _contentView;
}

@end
