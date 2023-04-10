//
//  WitExploreView.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/18.
//

#import "WitExploreView.h"
#import "WitBookClassifyView.h"
#import "WitBookRecommendView.h"
#import "WitAccessResources.h"
#import "WitBookIntroViewController.h"

@interface WitExploreView()
@property (nonatomic, strong) WitBookClassifyView *classifyView;                ///<  分类部分
@property (nonatomic, strong) UIView *lineView;                                 ///<  分隔线
@property (nonatomic, strong) WitBookRecommendView *specialRecommend;           ///<  特别推荐
@property (nonatomic, strong) WitBookRecommendView *xuanhuanRecommend;          ///<  玄幻小说
@property (nonatomic, strong) WitBookRecommendView *xiuzhenRecommend;           ///<  修真小说
@property (nonatomic, strong) WitBookRecommendView *dushiRecommend;             ///<  都市小说
@property (nonatomic, strong) WitBookRecommendView *lishiRecommend;             ///<  历史小说
@property (nonatomic, strong) WitBookRecommendView *wangyouRecommend;           ///<  网游小说
@property (nonatomic, strong) WitBookRecommendView *kehuanRecommend;            ///<  科幻小说
@property (nonatomic, strong) WitBookRecommendView *wanbenRecommend;            ///<  完本小说
@end

@implementation WitExploreView

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self addSubview:self.classifyView];
    [self addSubview:self.specialRecommend];
    [self addSubview:self.xuanhuanRecommend];
    [self addSubview:self.xiuzhenRecommend];
    [self addSubview:self.dushiRecommend];
    [self addSubview:self.lishiRecommend];
    [self addSubview:self.wangyouRecommend];
    [self addSubview:self.kehuanRecommend];
    [self addSubview:self.wanbenRecommend];
    
    
    [self addSubview:self.lineView];
    [self createUI];
    [self.classifyView setNeedsLayout];
    [self.specialRecommend setNeedsLayout];
    [self.xuanhuanRecommend setNeedsLayout];
    [self.xiuzhenRecommend setNeedsLayout];
    [self.dushiRecommend setNeedsLayout];
    [self.lishiRecommend setNeedsLayout];
    [self.wangyouRecommend setNeedsLayout];
    [self.kehuanRecommend setNeedsLayout];
    [self.wanbenRecommend setNeedsLayout];
    
    [self.classifyView layoutIfNeeded];
    [self.specialRecommend layoutIfNeeded];
    [self.xuanhuanRecommend layoutIfNeeded];
    [self.xiuzhenRecommend layoutIfNeeded];
    [self.dushiRecommend layoutIfNeeded];
    [self.lishiRecommend layoutIfNeeded];
    [self.wangyouRecommend layoutIfNeeded];
    [self.kehuanRecommend layoutIfNeeded];
    [self.wanbenRecommend layoutIfNeeded];
}


-(void)createUI{
    [self.classifyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top);
        make.left.mas_equalTo(self.mas_left);
        make.width.mas_offset(SCREEN_WIDTH);
        make.height.mas_offset(CLASSIFY_CELL_HEIGHT * 2 + 88);
    }];
    
    self.lineView.backgroundColor = [UIColor grayColor];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.classifyView.mas_bottom).mas_offset(4);
        make.left.mas_equalTo(self.mas_left).mas_offset(6);
        make.right.mas_equalTo(self.mas_right).mas_offset(-6);
        make.height.mas_offset(2);
    }];
    
    [self.specialRecommend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lineView.mas_bottom).mas_offset(12);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.height.mas_offset(216);
    }];
    [self.specialRecommend.recommendButton setTitle:@"特别 · 推荐     >" forState:UIControlStateNormal];
    self.specialRecommend.dataSource = [WitAccessResources accessResourceHomePage];
    
    [self.xuanhuanRecommend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.specialRecommend.mas_bottom).mas_offset(12);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.height.mas_offset(216);
    }];
    [self.xuanhuanRecommend.recommendButton setTitle:@"玄幻 · 推荐     >" forState:UIControlStateNormal];
    
    [self.xiuzhenRecommend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.xuanhuanRecommend.mas_bottom).mas_offset(12);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.height.mas_offset(216);
    }];
    [self.xiuzhenRecommend.recommendButton setTitle:@"修真 · 推荐     >" forState:UIControlStateNormal];
    
    [self.dushiRecommend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.xiuzhenRecommend.mas_bottom).mas_offset(12);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.height.mas_offset(216);
    }];
    [self.dushiRecommend.recommendButton setTitle:@"都市 · 推荐     >" forState:UIControlStateNormal];
    
    [self.lishiRecommend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.dushiRecommend.mas_bottom).mas_offset(12);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.height.mas_offset(216);
    }];
    [self.lishiRecommend.recommendButton setTitle:@"历史 · 推荐     >" forState:UIControlStateNormal];
    
    [self.wangyouRecommend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lishiRecommend.mas_bottom).mas_offset(12);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.height.mas_offset(216);
    }];
    [self.wangyouRecommend.recommendButton setTitle:@"网游 · 推荐     >" forState:UIControlStateNormal];
    
    [self.kehuanRecommend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.wangyouRecommend.mas_bottom).mas_offset(12);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.height.mas_offset(216);
    }];
    [self.kehuanRecommend.recommendButton setTitle:@"科幻 · 推荐     >" forState:UIControlStateNormal];
    
    [self.wanbenRecommend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.kehuanRecommend.mas_bottom).mas_offset(12);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.height.mas_offset(216);
    }];
    [self.wanbenRecommend.recommendButton setTitle:@"完本 · 推荐     >" forState:UIControlStateNormal];
   
    
}

#pragma mark - 懒加载
- (WitBookClassifyView *)classifyView{
    if(!_classifyView){
        _classifyView = [[WitBookClassifyView alloc]init];
  
    }
    return _classifyView;
}

- (UIView *)lineView{
    if(!_lineView){
        _lineView = [[UIView alloc]init];
    }
    return _lineView;
}
- (WitBookRecommendView *)specialRecommend{
    if(!_specialRecommend){
        _specialRecommend = [[WitBookRecommendView alloc]init];
    }
    return _specialRecommend;
}

- (WitBookRecommendView *)xuanhuanRecommend{
    if(!_xuanhuanRecommend){
        _xuanhuanRecommend = [[WitBookRecommendView alloc]init];
    }
    return _xuanhuanRecommend;
}

- (WitBookRecommendView *)xiuzhenRecommend{
    if(!_xiuzhenRecommend){
        _xiuzhenRecommend = [[WitBookRecommendView alloc]init];
    }
    return _xiuzhenRecommend;
}

- (WitBookRecommendView *)dushiRecommend{
    if(!_dushiRecommend){
        _dushiRecommend = [[WitBookRecommendView alloc]init];
    }
    return _dushiRecommend;
}

- (WitBookRecommendView *)lishiRecommend{
    if(!_lishiRecommend){
        _lishiRecommend = [[WitBookRecommendView alloc]init];
    }
    return _lishiRecommend;
}
- (WitBookRecommendView *)wangyouRecommend{
    if(!_wangyouRecommend){
        _wangyouRecommend = [[WitBookRecommendView alloc]init];
    }
    return _wangyouRecommend;
}

- (WitBookRecommendView *)kehuanRecommend{
    if(!_kehuanRecommend){
        _kehuanRecommend = [[WitBookRecommendView alloc]init];
    }
    return _kehuanRecommend;
}
- (WitBookRecommendView *)wanbenRecommend{
    if(!_wanbenRecommend){
        _wanbenRecommend = [[WitBookRecommendView alloc]init];
    }
    return _wanbenRecommend;
}

@end
