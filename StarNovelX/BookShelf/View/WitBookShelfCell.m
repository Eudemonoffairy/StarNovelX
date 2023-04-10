//
//  WitBookShelfCell.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/8/21.
//

#import "WitBookShelfCell.h"

//  小说封面的尺寸一般是 4:5
@interface WitBookShelfCell ()

@end

@implementation WitBookShelfCell

- (void)drawRect:(CGRect)rect{
  
    [self addSubview:self.contentCell];
    [self.contentCell addSubview:self.visualEffectView];
    [self addSubview:self.bookCoverImg];
    [self.contentCell addSubview:self.bookNameLabel];
    [self.contentCell addSubview:self.authorNameLabel];
    [self.contentCell addSubview:self.chapterLabel];
    
    [self.visualEffectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentCell.mas_left);
        make.right.mas_equalTo(self.contentCell.mas_right);
        make.top.mas_equalTo(self.contentCell.mas_top);
        make.bottom.mas_equalTo(self.contentCell.mas_bottom);
    }];
    
    //  从用户偏好中获取当前显示模式
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.isGrid = [defaults boolForKey:BOOK_IS_GRID];
    if(self.isGrid){
        [self gridMode];
    }
    else{
        [self listMode];
    }
   
    
}
/// 网格显示模式
-(void)gridMode{
    self.authorNameLabel.hidden =  YES;
    self.chapterLabel.hidden = YES;
    [self.contentCell mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.top.mas_equalTo(self.mas_top).mas_offset(32);
    }];
    [self.bookCoverImg mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(2);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(GRID_COVER_WIDTH, GRID_COVER_HEIGHT));
    }];
    self.bookCoverImg.layer.cornerRadius = 8;
    self.bookCoverImg.layer.borderWidth = 1;
    self.bookCoverImg.layer.borderColor = [[UIColor orangeColor]CGColor];
    self.bookCoverImg.layer.masksToBounds = YES;
    
    [self.bookNameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentCell.mas_top).mas_offset(GRID_COVER_HEIGHT - 20);
        make.left.mas_equalTo(self.contentCell.mas_left);
        make.right.mas_equalTo(self.contentCell.mas_right);
    }];
    self.bookNameLabel.font = [UIFont boldFont_15];
}


/// 列表显示模式
-(void)listMode{
    self.authorNameLabel.hidden =  NO;
    self.chapterLabel.hidden = NO;
    [self.contentCell mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.top.mas_equalTo(self.mas_top).mas_offset(32);
    }];

    [self.bookCoverImg mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-2);
        make.size.mas_equalTo(CGSizeMake(LIST_COVER_WIDTH, LIST_COVER_HEIGHT));
    }];
    self.bookCoverImg.layer.cornerRadius = 8;
    self.bookCoverImg.layer.borderWidth = 1;
    self.bookCoverImg.layer.borderColor = [[UIColor orangeColor]CGColor];
    self.bookCoverImg.layer.masksToBounds = YES;
    
    [self.bookNameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentCell.mas_top).mas_offset(8);
        make.left.mas_equalTo(self.contentCell.mas_left).mas_offset(LIST_COVER_WIDTH + 8);
        make.right.mas_lessThanOrEqualTo(self.contentCell.mas_right);
    }];
    self.bookNameLabel.font = [UIFont boldFont_21];
    
    [self.authorNameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bookNameLabel.mas_bottom).mas_offset(4);
        make.left.mas_equalTo(self.bookNameLabel.mas_left);
        make.right.mas_lessThanOrEqualTo(self.contentCell.mas_right);
    }];
    
    [self.chapterLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentCell.mas_bottom).mas_offset(-8);
        make.left.mas_equalTo(self.bookNameLabel.mas_left);
        make.right.mas_lessThanOrEqualTo(self.contentCell.mas_right);
    }];
    
    
    
}

#pragma mark - 懒加载
- (UIView *)contentCell{
    if(!_contentCell){
        _contentCell = [[UIView alloc]init];
        _contentCell.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    }
    return _contentCell;
}

- (UIImageView *)bookCoverImg{
    if(!_bookCoverImg){
        _bookCoverImg = [[UIImageView alloc]init];
        _bookCoverImg.backgroundColor = [UIColor whiteColor];
    }
    return _bookCoverImg;
}

- (UILabel *)bookNameLabel{
    if(!_bookNameLabel){
        _bookNameLabel = [[UILabel alloc]init];
        _bookNameLabel.text = @"默认名称";
        _bookNameLabel.textColor = [UIColor bookCellTitle];
    }
    return _bookNameLabel;
}

- (UILabel *)authorNameLabel{
    if(!_authorNameLabel){
        _authorNameLabel = [[UILabel alloc]init];
        _authorNameLabel.text = @"默认作者";
        _authorNameLabel.font = [UIFont font_13];
        _authorNameLabel.textColor = [UIColor bookCellAuthor];
    }
    return _authorNameLabel;
}

- (UILabel *)chapterLabel{
    if(!_chapterLabel){
        _chapterLabel = [[UILabel alloc]init];
        _chapterLabel.text = [NSString stringWithFormat:@"%lu / %lu",self.readedChapter,self.allChapter];
        _chapterLabel.font = [UIFont font_13];
    }
    return _chapterLabel;
}

- (UIVisualEffectView *)visualEffectView{
    if(!_visualEffectView){
        //  毛玻璃效果
        UIBlurEffect *blurEffrct =[UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemChromeMaterialDark];
        _visualEffectView = [[UIVisualEffectView alloc]initWithEffect:blurEffrct];
        _visualEffectView.alpha = 0.6;
        _visualEffectView.layer.cornerRadius = 16;
        _visualEffectView.layer.masksToBounds = YES;
    }
    return  _visualEffectView;
}
@end
