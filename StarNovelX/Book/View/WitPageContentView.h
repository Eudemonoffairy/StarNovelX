//
//  WitPageContentView.h
//  StarNovelX
//
//  Created by Martin Liu on 2022/9/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WitPageContentView : UIView
/// 阅读页内容
@property (nonatomic, retain)NSString *contentStr;
/// 内容字体大小
@property (nonatomic, assign)CGFloat contentFontSize;
/// 内容行间距
@property (nonatomic, assign)CGFloat lineSpacing;



@end

NS_ASSUME_NONNULL_END
