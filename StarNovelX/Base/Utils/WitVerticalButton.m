//
//  WitVerticalButton.m
//  StarNovelX
//
//  Created by Martin Liu on 2022/8/28.
//

#import "WitVerticalButton.h"

@implementation WitVerticalButton

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //调整图片(imageView)的位置和尺寸
    CGPoint center = self.imageView.center;
    center.x = self.frame.size.width/2;
    center.y = self.imageView.frame.size.height/2;
    self.imageView.center = center;
    
    
    //调整文字(titleLable)的位置和尺寸
   CGRect newFrame = self.titleLabel.frame;
    newFrame.origin.x = 0;
    newFrame.origin.y = self.imageView.frame.size.height;
    
    newFrame.size.width = self.frame.size.width;
    newFrame.size.height = self.frame.size.height - self.imageView.frame.size.height;
    
    self.titleLabel.frame = newFrame;
    
    
   //让文字居中
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
