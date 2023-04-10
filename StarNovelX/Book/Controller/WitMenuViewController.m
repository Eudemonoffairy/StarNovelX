//
//  WitMenuViewController.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/9.
//

#import "WitMenuViewController.h"
#import "WitTopMenu.h"
#import "WitBottomMenu.h"
#import "WitMoreMenu.h"
@interface WitMenuViewController ()
@property (nonatomic, strong)WitTopMenu *topMenu;
@property (nonatomic, strong)WitBottomMenu *bottomMenu;
@property (nonatomic, strong)WitMoreMenu *moreMenu;
@end

@implementation WitMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.topMenu];
    [self.view addSubview:self.bottomMenu];
    [self.view addSubview:self.moreMenu];
    [self.topMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.height.mas_equalTo(72);
    }];
    
   
    
    [self.moreMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.height.mas_equalTo(292);
    }];
    self.moreMenu.hidden = YES;
    
    [self.bottomMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.height.mas_equalTo(96);
    }];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(doToggleMenu) name:@"TOGGLEMENU" object:nil];
}

#pragma mark - 懒加载
- (WitTopMenu *)topMenu{
    if(!_topMenu){
        _topMenu = [[WitTopMenu alloc]init];
        _topMenu.backgroundColor = [UIColor themeColor];
    }
    return _topMenu;
}

- (WitBottomMenu *)bottomMenu{
    if(!_bottomMenu){
        _bottomMenu = [[WitBottomMenu alloc]init];
        _bottomMenu.backgroundColor = [UIColor themeColor];
    }
    return _bottomMenu;
}
- (WitMoreMenu *)moreMenu{
    if(!_moreMenu){
        _moreMenu = [[WitMoreMenu alloc]init];
        _moreMenu.backgroundColor = [UIColor themeColor];
    }
    return _moreMenu;
}

#pragma mark - 点击事件相关
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    if([self isTouchInView:[touches anyObject] inView:self.bottomMenu] || [self isTouchInView:[touches anyObject] inView:self.topMenu] || [self isTouchInView:[touches anyObject] inView:self.moreMenu]){
        
        return ;
    }
    NSLog(@"隐藏菜单");
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (BOOL)isTouchInView:(UITouch *)touch inView:(UIView *)view {
    CGPoint point = [touch locationInView:view];
    if (point.x >= 0 && point.x <= CGRectGetWidth(view.frame) && point.y >= 0 && point.y <= CGRectGetHeight(view.frame)) {
        return YES;
    }
    return NO;
}


-(void)doToggleMenu{
    NSLog(@"切换菜单");
    if(self.moreMenu.hidden){
        self.moreMenu.hidden = NO;
        self.bottomMenu.hidden = YES;
    }
    else{
        self.moreMenu.hidden = YES;
        self.bottomMenu.hidden = NO;
    }
}
@end
