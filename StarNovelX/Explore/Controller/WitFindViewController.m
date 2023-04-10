//
//  WitFindViewController.m
//  StarNovelX
//
//  Created by Martin Liu on 2023/2/2.
//

#import "WitFindViewController.h"
#import "WitBookTypeView.h"
#import "WitParseRecource.h"
@interface WitFindViewController ()
@property (nonatomic, strong) WitBookTypeView *typeView;
@end

@implementation WitFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.typeView];
    
    self.title = @"发现";
    [self.typeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.height.mas_offset(96);
        make.top.mas_equalTo(self.view.mas_top).mas_offset(128);
    }];
    [WitParseRecource GetRecommendResource:@"https://www.bbiquge.net/fenlei/2_1/"];
}

- (WitBookTypeView *)typeView{
    if(!_typeView){
        _typeView = [[WitBookTypeView alloc]init];
        [_typeView.dataSource  setArray:@[@"玄幻",@"修真", @"都市", @"历史", @"网游", @"科幻" ,@"完本"]];
    }
    return _typeView;
}

@end
