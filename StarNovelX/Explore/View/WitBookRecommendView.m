//
//  WitBookRecommendView.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/8/28.
//

#import "WitBookRecommendView.h"
#import "WitVerticalCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "WitBookIntroViewController.h"

#define RECOMMECNT_CELL_IDENTIFIER @"cell"
@interface WitBookRecommendView()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)UICollectionViewFlowLayout *rightLayout;
@end

@implementation WitBookRecommendView
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self addSubview:self.recommendButton];
    [self addSubview:self.collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.recommendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top);
        make.left.mas_equalTo(self.mas_left).mas_offset(8);
        make.right.mas_equalTo(self.mas_right).mas_offset(-8);
        make.height.mas_offset(42);
    }];
    self.recommendButton.backgroundColor = [UIColor lightGrayColor];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.recommendButton.mas_bottom);
        make.left.mas_equalTo(self.recommendButton.mas_left);
        make.right.mas_equalTo(self.recommendButton.mas_right);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-8);
    }];
//    self.collectionView.backgroundColor = [UIColor blueColor];
    [self.collectionView registerClass:[WitVerticalCollectionViewCell class] forCellWithReuseIdentifier:RECOMMECNT_CELL_IDENTIFIER];
}

#pragma mark - 懒加载
- (UIButton *)recommendButton{
    if(!_recommendButton){
        _recommendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _recommendButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _recommendButton.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0);
        _recommendButton.titleLabel.font = [UIFont boldFont_21];
        [_recommendButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _recommendButton;
}

- (UICollectionViewFlowLayout *)rightLayout{
    if(!_rightLayout){
        _rightLayout = [[UICollectionViewFlowLayout alloc]init];
        _rightLayout.minimumLineSpacing = 8;
        _rightLayout.minimumInteritemSpacing = 8;
        _rightLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _rightLayout.itemSize = CGSizeMake(RECOMMEND_CELL_WIDTH, RECOMMEND_CELL_HEIGHT);
//        _rightLayout.sectionInset = UIEdgeInsetsMake(0, 8, 0, 8);
    }
    return _rightLayout;
}

- (UICollectionView *)collectionView{
    if(!_collectionView){
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.rightLayout];
        _collectionView.showsHorizontalScrollIndicator = NO;
    }
    return _collectionView;
}
- (NSMutableArray *)dataSource{
    if(!_dataSource){
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}

#pragma mark - UICollectionViewCellDataSource
- (WitVerticalCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WitVerticalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NSMutableDictionary *sourceDic = [self.dataSource objectAtIndex:[indexPath item]];
    NSString *titleStr = [sourceDic objectForKey:@"TITLE"];
    NSString *imgStr = [sourceDic objectForKey:@"IMG"];
    NSString *introStr = [sourceDic objectForKey:@"INTRO"];
    cell.cellTitle.text = titleStr;
    [cell.cellImg sd_setImageWithURL:[NSURL URLWithString:imgStr]];
    cell.introURL = introStr;
    cell.backgroundColor = [UIColor jingzi];
    cell.layer.cornerRadius = 8;
    cell.layer.masksToBounds = YES;
    UITapGestureRecognizer *tag = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showBookIntro:)];
    [cell addGestureRecognizer:tag];
    
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataSource count];
}

//  可选:
///  返回分区的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

#pragma mark - 按钮方法
-(void)showBookIntro:(UIGestureRecognizer *)sender{
    NSLog(@"发送通知");
    WitVerticalCollectionViewCell *cell = (WitVerticalCollectionViewCell *)sender.view;
    NSLog(@"%@",cell.introURL);
    NSNotification *notice = [NSNotification notificationWithName:@"SHOWBOOKINTRO" object:nil userInfo:@{@"INTROURL":[NSURL URLWithString:cell.introURL]}];
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}
@end
