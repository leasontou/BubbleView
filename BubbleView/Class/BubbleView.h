//
//  BubbleView.h
//  wechat
//
//  Created by Den on 15/12/29.
//  Copyright © 2015年 Leason. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BubbleDirection) {
    BubbleDirectionLeft,
    BubbleDirectionRight
};

@interface BubbleView : UIView

//箭头的方向
@property(nonatomic)BubbleDirection direction;
//边框颜色
@property(nonatomic,strong)UIColor* borderColor;
//边框宽度
@property(nonatomic)CGFloat borderWidth;
//四个角的圆角大小
@property(nonatomic)CGFloat radius;
//箭头离顶部的高度
@property(nonatomic)CGFloat topOffset;
//箭头的宽度
@property(nonatomic)CGFloat triangleWidth;
//箭头的高度(这个是整个箭头一半的高度)
@property(nonatomic)CGFloat triangleHeight;
//箭头的圆角大小
@property(nonatomic)CGFloat triangleRadius;
@end
