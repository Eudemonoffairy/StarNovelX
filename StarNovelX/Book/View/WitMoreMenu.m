//
//  WitMoreMenu.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/9.
//

#import "WitMoreMenu.h"

@implementation WitMoreMenu
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    
    [self.moreMenuLabel addSubview:self.backToBottomBtn];
    [self addSubview:self.moreMenuLabel];
    
    [self.brightnessView addSubview:self.brightnessSlider];
    [self.brightnessView addSubview:self.turnUpBrightness];
    [self.brightnessView addSubview:self.turnDownBrightness];
    [self.brightnessView addSubview:self.brightnessLabel];
    [self addSubview:self.brightnessView];
    
    [self.switchBackGroundView addSubview:self.backgroung_3];
    [self.switchBackGroundView addSubview:self.backgroung_2];
    [self.switchBackGroundView addSubview:self.backgroung_1];
    [self.switchBackGroundView addSubview:self.backgroung_4];
    [self.switchBackGroundView addSubview:self.backgroung_5];
    [self.switchBackGroundView addSubview:self.switchBackGroundLabel];
    [self addSubview:self.switchBackGroundView];
    
    [self.adjustFontView addSubview:self.adjustFontLabel];
    [self.adjustFontView addSubview:self.fontSizeLabel];
    [self.adjustFontView addSubview:self.ensmallFont];
    [self.adjustFontView addSubview:self.enlargeFont];
    [self addSubview:self.adjustFontView];
    
    
    [self.linespacingView addSubview:self.linespacingLabel];
    [self.linespacingView addSubview:self.linespacingLarge];
    [self.linespacingView addSubview:self.linespacingSmall];
    [self.linespacingView addSubview:self.linespacingMiddle];
    [self addSubview:self.linespacingView];
    
    
    [self.moreMenuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.height.mas_equalTo(36);
    }];
    [self.backToBottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.moreMenuLabel.mas_left).mas_offset(8);
        make.top.mas_equalTo(6);
        make.width.mas_offset(48);
        make.height.mas_offset(24);
    }];
    self.backToBottomBtn.layer.cornerRadius = 6;
    self.backToBottomBtn.layer.masksToBounds = YES;
    
    [self.backToBottomBtn addTarget:self action:@selector(showBottomMenu) forControlEvents:UIControlEventTouchUpInside];
    
    [self.brightnessView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.moreMenuLabel.mas_bottom).mas_offset(8);
        make.left.mas_equalTo(self.mas_left).mas_offset(8);
        make.right.mas_equalTo(self.mas_right).mas_offset(-8);
        make.height.mas_equalTo(60);
    }];
    self.brightnessView.layer.cornerRadius = 12;
    self.brightnessView.layer.masksToBounds = YES;
    
    
    [self.brightnessLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.brightnessView.mas_centerX);
        make.top.mas_equalTo(self.brightnessView.mas_top).mas_offset(4);
    }];
    
    
    [self.brightnessSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.brightnessView.mas_centerX);
        make.top.mas_equalTo(self.brightnessLabel).mas_offset(12);
        make.bottom.mas_equalTo(self.brightnessView).mas_offset(-8);
        make.width.mas_equalTo(156);
    }];
    
    
    [self.turnDownBrightness mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.brightnessSlider.mas_top);
        make.right.mas_equalTo(self.brightnessSlider.mas_left).mas_offset(-20);
        make.bottom.mas_equalTo(self.brightnessSlider.mas_bottom);
        make.width.mas_equalTo(self.turnDownBrightness.mas_height);
    }];
    
    [self.turnUpBrightness mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.brightnessSlider.mas_top);
        make.left.mas_equalTo(self.brightnessSlider.mas_right).mas_offset(20);
        make.bottom.mas_equalTo(self.brightnessSlider.mas_bottom);
        make.width.mas_equalTo(self.turnDownBrightness.mas_height);
    }];
    
    [self.switchBackGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.brightnessView.mas_bottom).mas_offset(8);
        make.left.mas_equalTo(self.brightnessView.mas_left);
        make.right.mas_equalTo(self.brightnessView.mas_right);
        make.height.mas_equalTo(72);
    }];
    self.switchBackGroundView.layer.cornerRadius = 12;
    self.switchBackGroundView.layer.masksToBounds = YES;
    
    [self.switchBackGroundLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.switchBackGroundView.mas_centerX);
        make.top.mas_equalTo(self.switchBackGroundView.mas_top).mas_offset(4);
    }];
    
    [self.backgroung_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.switchBackGroundLabel.mas_bottom).mas_offset(12);
        make.height.mas_offset(36);
        make.width.mas_equalTo(self.backgroung_3.mas_height);
        make.centerX.mas_equalTo(self.switchBackGroundView.mas_centerX);
    }];
    self.backgroung_3.layer.cornerRadius = 18;
    self.backgroung_3.layer.masksToBounds = YES;
   
    [self.backgroung_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.backgroung_3.mas_top);
        make.bottom.mas_equalTo(self.backgroung_3.mas_bottom);
        make.width.mas_equalTo(self.backgroung_2.mas_height);
        make.right.mas_equalTo(self.backgroung_3.mas_left).mas_offset(-24);
    }];
    self.backgroung_2.layer.cornerRadius = 18;
    self.backgroung_2.layer.masksToBounds = YES;

    [self.backgroung_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.backgroung_3.mas_top);
        make.bottom.mas_equalTo(self.backgroung_3.mas_bottom);
        make.width.mas_equalTo(self.backgroung_1.mas_height);
        make.right.mas_equalTo(self.backgroung_2.mas_left).mas_offset(-24);
    }];
    self.backgroung_1.layer.cornerRadius = 18;
    self.backgroung_1.layer.masksToBounds = YES;
   
    [self.backgroung_4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.backgroung_3.mas_top);
        make.bottom.mas_equalTo(self.backgroung_3.mas_bottom);
        make.width.mas_equalTo(self.backgroung_4.mas_height);
        make.left.mas_equalTo(self.backgroung_3.mas_right).mas_offset(24);
    }];
    self.backgroung_4.layer.cornerRadius = 18;
    self.backgroung_4.layer.masksToBounds = YES;
    
    [self.backgroung_5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.backgroung_3.mas_top);
        make.bottom.mas_equalTo(self.backgroung_3.mas_bottom);
        make.width.mas_equalTo(self.backgroung_5.mas_height);
        make.left.mas_equalTo(self.backgroung_4.mas_right).mas_offset(24);
    }];
    self.backgroung_5.layer.cornerRadius = 18;
    self.backgroung_5.layer.masksToBounds = YES;
    
    [self.adjustFontView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.switchBackGroundView.mas_bottom).mas_offset(8);
        make.left.mas_equalTo(self.brightnessView.mas_left);
        make.width.mas_offset((SCREEN_WIDTH)/2 - 12);
        make.height.mas_offset(60);
    }];
    self.adjustFontView.layer.cornerRadius = 12;
    self.adjustFontView.layer.masksToBounds = YES;
    
    [self.adjustFontLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.adjustFontView.mas_centerX);
        make.top.mas_equalTo(self.adjustFontView.mas_top).mas_offset(4);
        make.height.mas_offset(10);
    }];

    [self.fontSizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.adjustFontLabel.mas_bottom).mas_offset(4);
        make.bottom.mas_equalTo(self.adjustFontView.mas_bottom).mas_offset(-8);
        make.centerX.mas_equalTo(self.adjustFontView.mas_centerX);
    }];
    
    [self.ensmallFont mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.fontSizeLabel.mas_top).mas_offset(4);
        make.bottom.mas_equalTo(self.fontSizeLabel.mas_bottom).mas_offset(-4);
        make.right.mas_equalTo(self.fontSizeLabel.mas_left).mas_offset(-16);
        make.width.mas_equalTo(48);
    }];
    self.ensmallFont.layer.cornerRadius = 8;
    self.ensmallFont.layer.masksToBounds = YES;
    
    [self.enlargeFont mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.fontSizeLabel.mas_top).mas_offset(4);
        make.bottom.mas_equalTo(self.fontSizeLabel.mas_bottom).mas_offset(-4);
        make.left.mas_equalTo(self.fontSizeLabel.mas_right).mas_offset(16);
        make.width.mas_equalTo(48);
    }];
    self.enlargeFont.layer.cornerRadius = 8;
    self.enlargeFont.layer.masksToBounds = YES;
        
    [self.linespacingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.adjustFontView.mas_top);
        make.right.mas_equalTo(self.brightnessView.mas_right);
        make.width.mas_offset((SCREEN_WIDTH)/2 - 12);
        make.height.mas_equalTo(self.adjustFontView.mas_height);
    }];
    
    self.linespacingView.layer.cornerRadius = 12;
    self.linespacingView.layer.masksToBounds = YES;
    
    [self.linespacingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.linespacingView.mas_top).mas_offset(4);
        make.centerX.mas_equalTo(self.linespacingView.mas_centerX);
        make.height.mas_offset(10);
    }];
    
    CGFloat lineSpacingWidth = (SCREEN_WIDTH/2 - 60)/3;
    [self.linespacingSmall mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.linespacingView.mas_left).mas_offset(12);
        make.top.mas_equalTo(self.linespacingLabel.mas_bottom).mas_offset(4);
        make.bottom.mas_equalTo(self.linespacingView.mas_bottom).mas_offset(-8);
        make.width.mas_equalTo(lineSpacingWidth);
    }];
    self.linespacingSmall.layer.cornerRadius = 8;
    self.linespacingSmall.layer.masksToBounds = YES;
    
    
    [self.linespacingMiddle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.linespacingSmall.mas_right).mas_offset(12);
        make.top.mas_equalTo(self.linespacingSmall.mas_top);
        make.bottom.mas_equalTo(self.linespacingSmall.mas_bottom);
        make.width.mas_equalTo(lineSpacingWidth);
    }];
    self.linespacingMiddle.layer.cornerRadius = 8;
    self.linespacingMiddle.layer.masksToBounds = YES;
    
    [self.linespacingLarge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.linespacingMiddle.mas_right).mas_offset(12);
        make.top.mas_equalTo(self.linespacingSmall.mas_top);
        make.bottom.mas_equalTo(self.linespacingSmall.mas_bottom);
        make.width.mas_equalTo(lineSpacingWidth);
    }];
    self.linespacingLarge.layer.cornerRadius = 8;
    self.linespacingLarge.layer.masksToBounds = YES;
}



#pragma mark - 懒加载

//  更多菜单标题和返回按钮
- (UILabel *)moreMenuLabel{
    if(!_moreMenuLabel){
        _moreMenuLabel = [[UILabel alloc]init];
        _moreMenuLabel.text = @"更多菜单";
        _moreMenuLabel.textColor = [UIColor themeColor];
        _moreMenuLabel.textAlignment = NSTextAlignmentCenter;
        _moreMenuLabel.backgroundColor = [UIColor whiteColor];
        _moreMenuLabel.userInteractionEnabled = YES;
    }
    return _moreMenuLabel;
}

- (UIButton *)backToBottomBtn{
    if(!_backToBottomBtn){
        _backToBottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backToBottomBtn setTitle:@"返回" forState:UIControlStateNormal];
        _backToBottomBtn.titleLabel.font = [UIFont font_13];
        _backToBottomBtn.backgroundColor = [UIColor themeColor];
        [_backToBottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_backToBottomBtn addTarget:self action:@selector(showBottomMenu) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return _backToBottomBtn;
}




//  亮度设置界面
- (UIView *)brightnessView{
    if(!_brightnessView){
        _brightnessView = [[UIView alloc]init];
        _brightnessView.backgroundColor = [UIColor whiteColor];
    }
    return _brightnessView;
}


- (UILabel *)brightnessLabel{
    if(!_brightnessLabel){
        _brightnessLabel = [[UILabel alloc]init];
        _brightnessLabel.text = @"亮度";
        _brightnessLabel.textColor = [UIColor themeColor];
        _brightnessLabel.font = [UIFont font_11];
        _brightnessLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _brightnessLabel;
}

- (UIImageView *)turnUpBrightness{
    if(!_turnUpBrightness){
        _turnUpBrightness = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Menu_Brightness_High"]];
        _turnUpBrightness.contentMode = UIViewContentModeScaleAspectFill;
        [_turnUpBrightness.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        _turnUpBrightness.tintColor = [UIColor themeColor];
    }
    return _turnUpBrightness;
}

- (UIImageView *)turnDownBrightness{
    if(!_turnDownBrightness){
        _turnDownBrightness = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Menu_Brightness_Low"]];
        _turnDownBrightness.contentMode = UIViewContentModeScaleAspectFill;
        [_turnDownBrightness.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        _turnDownBrightness.tintColor = [UIColor themeColor];
    }
    return _turnDownBrightness;
}

- (UISlider *)brightnessSlider{
    if(!_brightnessSlider ){
        _brightnessSlider = [[UISlider alloc]init];
        [_brightnessSlider addTarget:self action:@selector(sliderAction) forControlEvents:UIControlEventValueChanged];
        _brightnessSlider.minimumTrackTintColor = [UIColor themeColor];
        _brightnessSlider.maximumValue = 0.7;
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSNumber  *alphaNumber = [defaults objectForKey:@"READBRIGHTNESS"];
        _brightnessSlider.value = [alphaNumber floatValue];
        
    }
    return _brightnessSlider;
}

- (UIView *)switchBackGroundView{
    if(!_switchBackGroundView){
        _switchBackGroundView = [[UIView alloc]init];
        _switchBackGroundView.backgroundColor = [UIColor whiteColor];
    }
    return _switchBackGroundView;
}
- (UILabel *)switchBackGroundLabel{
    if(!_switchBackGroundLabel){
        _switchBackGroundLabel = [[UILabel alloc]init];
        _switchBackGroundLabel.text = @"背景";
        _switchBackGroundLabel.textColor = [UIColor themeColor];
        _switchBackGroundLabel.font = [UIFont font_11];
        _switchBackGroundLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _switchBackGroundLabel;
}

- (UIButton *)backgroung_1 {
    if(!_backgroung_1){
        _backgroung_1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _backgroung_1.backgroundColor = [UIColor readBackGroundColor:1];
        _backgroung_1.tag = 100001;
        [_backgroung_1 addTarget:self action:@selector(changeBackGroundColor:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backgroung_1;
}

- (UIButton *)backgroung_2{
    if(!_backgroung_2){
        _backgroung_2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _backgroung_2.backgroundColor = [UIColor readBackGroundColor:2];
        _backgroung_2.tag = 100002;
        [_backgroung_2 addTarget:self action:@selector(changeBackGroundColor:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backgroung_2;
}


- (UIButton *)backgroung_3{
    if(!_backgroung_3){
        _backgroung_3 = [UIButton buttonWithType:UIButtonTypeCustom];
        _backgroung_3.backgroundColor = [UIColor readBackGroundColor:3];
        _backgroung_3.tag = 100003;
        [_backgroung_3 addTarget:self action:@selector(changeBackGroundColor:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backgroung_3;
}


- (UIButton *)backgroung_4{
    if(!_backgroung_4){
        _backgroung_4 = [UIButton buttonWithType:UIButtonTypeCustom];
        _backgroung_4.backgroundColor = [UIColor readBackGroundColor:4];
        _backgroung_4.tag = 100004;
        [_backgroung_4 addTarget:self action:@selector(changeBackGroundColor:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backgroung_4;
}

- (UIButton *)backgroung_5{
    if(!_backgroung_5){
        _backgroung_5 = [UIButton buttonWithType:UIButtonTypeCustom];
        _backgroung_5.backgroundColor = [UIColor readBackGroundColor:5];
        _backgroung_5.tag = 100005;
        [_backgroung_5 addTarget:self action:@selector(changeBackGroundColor:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backgroung_5;
}

- (UIView *)adjustFontView{
    if(!_adjustFontView){
        _adjustFontView = [[UIView alloc]init];
        _adjustFontView.backgroundColor = [UIColor whiteColor];
    }
    return _adjustFontView;
}
- (UILabel *)adjustFontLabel{
    if(!_adjustFontLabel){
        _adjustFontLabel = [[UILabel alloc]init];
        _adjustFontLabel.text = @"字体大小";
        _adjustFontLabel.textColor = [UIColor themeColor];
        _adjustFontLabel.font = [UIFont font_11];
        _adjustFontLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _adjustFontLabel;
}

- (UILabel *)fontSizeLabel{
    if(!_fontSizeLabel){
        _fontSizeLabel = [[UILabel alloc]init];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSNumber *fontsizeNumber = [defaults objectForKey:@"READFONTSIZE"];
        _fontSizeLabel.text = [NSString stringWithFormat:@"%ld", [fontsizeNumber integerValue]];
    }
    return _fontSizeLabel;
}

- (UIButton *)enlargeFont{
    if(!_enlargeFont){
        _enlargeFont = [UIButton buttonWithType:UIButtonTypeCustom];
        [_enlargeFont setImage:[UIImage imageNamed:@"Menu_Fontsize_Enlarge"] forState:UIControlStateNormal];
        _enlargeFont.imageView.contentMode = UIViewContentModeScaleAspectFit;
        _enlargeFont.backgroundColor = [UIColor themeColor];
        _enlargeFont.tag = 200001;
        [_enlargeFont addTarget:self action:@selector(changeFontSize:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _enlargeFont;
}

- (UIButton *)ensmallFont{
    if(!_ensmallFont){
        _ensmallFont = [UIButton buttonWithType:UIButtonTypeCustom];
        [_ensmallFont setImage:[UIImage imageNamed:@"Menu_Fontsize_Ensmall"] forState:UIControlStateNormal];
        _ensmallFont.imageView.contentMode = UIViewContentModeScaleAspectFit;
        _ensmallFont.backgroundColor = [UIColor themeColor];
        _ensmallFont.tag = 200002;
        [_ensmallFont addTarget:self action:@selector(changeFontSize:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _ensmallFont;
}

- (UIView *)linespacingView{
    if(!_linespacingView){
        _linespacingView = [[UIView alloc]init];
        _linespacingView.backgroundColor = [UIColor whiteColor];
    }
    return _linespacingView;
}

- (UILabel *)linespacingLabel{
    if(!_linespacingLabel){
        _linespacingLabel = [[UILabel alloc]init];
        _linespacingLabel.text = @"行间距";
        _linespacingLabel.textColor = [UIColor themeColor];
        _linespacingLabel.font = [UIFont font_11];
        _linespacingLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _linespacingLabel;
}

- (UIButton *)linespacingSmall{
    if(!_linespacingSmall){
        _linespacingSmall = [UIButton buttonWithType:UIButtonTypeCustom];
        _linespacingSmall.backgroundColor = [UIColor themeColor];
        [_linespacingSmall setTitle:@"小" forState:UIControlStateNormal];
        _linespacingSmall.tag = 300001;
        [_linespacingSmall addTarget:self action:@selector(changeLineSpacing:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _linespacingSmall;
}

- (UIButton *)linespacingMiddle{
    if(!_linespacingMiddle){
        _linespacingMiddle = [UIButton buttonWithType:UIButtonTypeCustom];
        _linespacingMiddle.backgroundColor = [UIColor themeColor];
        [_linespacingMiddle setTitle:@"中" forState:UIControlStateNormal];
        _linespacingMiddle.tag = 300002;
        [_linespacingMiddle addTarget:self action:@selector(changeLineSpacing:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _linespacingMiddle;
}

- (UIButton *)linespacingLarge{
    if(!_linespacingLarge){
        _linespacingLarge = [UIButton buttonWithType:UIButtonTypeCustom];
        _linespacingLarge.backgroundColor = [UIColor themeColor];
        [_linespacingLarge setTitle:@"大" forState:UIControlStateNormal];
        _linespacingLarge.tag = 300003;
        [_linespacingLarge addTarget:self action:@selector(changeLineSpacing:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _linespacingLarge;
}



#pragma mark - 菜单方法

-(void)showBottomMenu{
    NSLog(@"显示更多菜单");
    NSNotification *notice = [NSNotification notificationWithName:@"TOGGLEMENU" object:nil];
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}

-(void)sliderAction{
    NSNumber *alphaNumber = [NSNumber numberWithFloat:self.brightnessSlider.value];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:alphaNumber forKey:@"READBRIGHTNESS"];
    NSNotification *notice = [NSNotification notificationWithName:@"CHANGEBRIGHTNESS" object:nil ];
    [[NSNotificationCenter defaultCenter]postNotification:notice];
    
}

-(void)changeBackGroundColor:(UIButton *)btn{
    NSUInteger btnTag = btn.tag;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    switch (btnTag) {
        case 100001:
            [defaults setObject:[NSNumber numberWithInteger:1] forKey:@"READBACKGROUND"];
            break;
        case 100002:
            [defaults setObject:[NSNumber numberWithInteger:2] forKey:@"READBACKGROUND"];
            break;
        case 100003:
            [defaults setObject:[NSNumber numberWithInteger:3] forKey:@"READBACKGROUND"];
            break;
        case 100004:
            [defaults setObject:[NSNumber numberWithInteger:4] forKey:@"READBACKGROUND"];
            break;
        case 100005:
            [defaults setObject:[NSNumber numberWithInteger:5] forKey:@"READBACKGROUND"];
            break;
        default:
            break;
    }
    NSNotification *notice = [NSNotification notificationWithName:@"READCOLORCHANGED" object:nil];
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}

-(void)changeFontSize:(UIButton *)btn{
    NSUInteger btnTag = btn.tag;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *fontSizeNumber = [defaults objectForKey:@"READFONTSIZE"];
    NSUInteger fontsize = [fontSizeNumber integerValue];
    switch (btnTag) {
        case 200001:
            //  增大字体
            if(fontsize < 25){
                fontsize += 2;
            }
            break;
        case 200002:
            //  缩小字体
            if(fontsize > 17){
                fontsize -= 2;
            }
            break;
        default:
            break;
    }
    self.fontSizeLabel.text = [NSString stringWithFormat:@"%ld",fontsize];
    [defaults setObject:[NSNumber numberWithInteger:fontsize] forKey:@"READFONTSIZE"];
    NSNotification *notice = [NSNotification notificationWithName:@"READCHANGEFONTSIZE" object:nil];
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}


-(void)changeLineSpacing:(UIButton *)btn{
    NSUInteger btnTag = btn.tag;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSUInteger fontLinespacing = 0;
    switch (btnTag) {
        case 300001:
            //  行间距 小
            fontLinespacing = 10;
            break;
        case 300002:
            //  行间距 中
            fontLinespacing = 16;
            break;
        case 300003:
            //  行间距 大
            fontLinespacing = 22;
            break;
        default:
            break;
    }
    [defaults setObject:[NSNumber numberWithInteger:fontLinespacing] forKey:@"READLINESPACING"];
    NSNotification *notice = [NSNotification notificationWithName:@"READCHANGEFONTSIZE" object:nil];
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}



@end
