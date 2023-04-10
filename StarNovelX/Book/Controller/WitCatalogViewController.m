//
//  WitCatalogViewController.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/7.
//

#import "WitCatalogViewController.h"

@interface WitCatalogViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *catalogView;
@property (nonatomic, strong)UILabel *titleLabel;
@end

@implementation WitCatalogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.catalogView];
    [self.view addSubview:self.titleLabel];
}


#pragma  mark - 懒加载
- (NSMutableArray<WitCatalogModel *> *)dataSource{
    if(!_dataSource){
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (UITableView *)catalogView{
    if(!_catalogView){
        _catalogView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, SCREEN_HEIGHT-100) style:UITableViewStylePlain];
        _catalogView.delegate = self;
        _catalogView.dataSource = self;
    }
    return _catalogView;
}
- (UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        _titleLabel.text = @"目录";
        _titleLabel.backgroundColor = [UIColor systemBlueColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

#pragma  mark - UITableViewDatalog & UITableViewDatasource
//  返回每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}

//  返回每行内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    WitCatalogModel *aChapter = [[WitCatalogModel alloc]init];
    aChapter = self.dataSource[indexPath.row];
    cell.textLabel.text = aChapter.catalogName;
    return cell;
}




@end
