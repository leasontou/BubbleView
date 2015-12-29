//
//  BubbleView.m
//  wechat
//
//  Created by Den on 15/12/29.
//  Copyright © 2015年 Leason. All rights reserved.
//

#import "BubbleView.h"

@interface BubbleView(){
    
}

@property(nonatomic,strong)CAShapeLayer* borderLayer;
@end

@implementation BubbleView

- (id)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    
    return self;
}
-(void)setup{
    self.backgroundColor = [UIColor clearColor];
    self.borderColor = [UIColor colorWithRed:0xaa/255.0 green:0xaa/255.0 blue:0xaa/255.0 alpha:1];
    self.borderWidth = 1;
    self.radius = 4;
    self.topOffset = 10;
    self.triangleWidth = 8;
    self.triangleHeight = 5;
    self.triangleRadius = 2;
    
    self.borderLayer=[CAShapeLayer layer];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    // Drawing code
    
    
    CGFloat viewW = rect.size.width;
    CGFloat viewH = rect.size.height;
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setFillColor:[[UIColor whiteColor] CGColor]];
    CGMutablePathRef path = CGPathCreateMutable();
    
    if (self.direction == BubbleDirectionRight) {
        CGPathMoveToPoint(path, NULL, self.radius, 0.0);
        CGPathAddLineToPoint(path, NULL, viewW-self.radius-self.triangleWidth, 0.0);
        CGPathAddArcToPoint(path, NULL, viewW-self.triangleWidth, 0, viewW-self.triangleWidth, self.radius, self.radius);
        CGPathAddLineToPoint(path, NULL, viewW-self.triangleWidth, self.radius+self.topOffset);
        CGPathAddLineToPoint(path, NULL, viewW-self.triangleRadius, self.radius+self.topOffset+self.triangleHeight-self.triangleRadius);
        
        CGPathAddArcToPoint(path, NULL, viewW, self.radius+self.topOffset+self.triangleHeight, viewW-self.triangleRadius, self.radius+self.topOffset+self.triangleHeight+self.triangleRadius, self.triangleRadius);
        
        CGPathAddLineToPoint(path, NULL, viewW-self.triangleWidth, self.radius+self.topOffset+self.triangleHeight*2);
        CGPathAddLineToPoint(path, NULL, viewW-self.triangleWidth, viewH-self.radius);
        
        CGPathAddArcToPoint(path, NULL, viewW-self.triangleWidth, viewH, viewW-self.triangleWidth-self.radius, viewH, self.radius);
        
        CGPathAddLineToPoint(path, NULL, self.radius, viewH);
        CGPathAddArcToPoint(path, NULL, 0, viewH, 0, viewH-self.radius, self.radius);
        CGPathAddLineToPoint(path, NULL, 0, self.radius);
        CGPathAddArcToPoint(path, NULL, 0, 0, self.radius,0 , self.radius);
        
        CGPathCloseSubpath(path);
        [shapeLayer setPath:path];
        
    }else{
        CGPathMoveToPoint(path, NULL, self.radius+self.triangleWidth, 0.0);
        CGPathAddLineToPoint(path, NULL, viewW-self.radius, 0.0);
        
        CGPathAddArcToPoint(path, NULL, viewW, 0, viewW,self.radius , self.radius);
        CGPathAddLineToPoint(path, NULL, viewW, viewH-self.radius);
        CGPathAddArcToPoint(path, NULL, viewW, viewH, viewW-self.radius,viewH , self.radius);
        
        CGPathAddLineToPoint(path, NULL, self.triangleWidth+self.radius, viewH);
        CGPathAddArcToPoint(path, NULL, self.triangleWidth, viewH, self.triangleWidth,viewH-self.radius , self.radius);
        CGPathAddLineToPoint(path, NULL, self.triangleWidth, self.radius+self.triangleHeight*2+self.topOffset);
        
        CGPathAddLineToPoint(path, NULL, self.triangleRadius, self.radius+self.topOffset+self.triangleHeight+self.triangleRadius);
        
        CGPathAddArcToPoint(path, NULL, 0, self.radius+self.topOffset+self.triangleHeight, self.triangleRadius,self.radius+self.topOffset+self.triangleHeight-self.triangleRadius , self.triangleRadius);
        
        CGPathAddLineToPoint(path, NULL, self.triangleWidth, self.radius+self.topOffset);
        
        CGPathAddLineToPoint(path, NULL, self.triangleWidth, self.radius);
        
        CGPathAddArcToPoint(path, NULL, self.triangleWidth, 0, self.triangleWidth+self.radius,0, self.radius);
        CGPathCloseSubpath(path);
        [shapeLayer setPath:path];
        
    }
    
    [self.borderLayer setPath:path];
    self.borderLayer.fillColor  = [UIColor clearColor].CGColor;
    self.borderLayer.strokeColor    = self.borderColor.CGColor;
    self.borderLayer.lineWidth      = self.borderWidth;
    self.borderLayer.frame=self.bounds;
    
    [self.borderLayer removeFromSuperlayer];
    [self.layer addSublayer:self.borderLayer];
    
    
    self.layer.mask = shapeLayer;
    
    CFRelease(path);
    
}


-(void)setDirection:(BubbleDirection)direction{
    _direction = direction;
    [self setNeedsDisplay];
}

-(void)setBorderColor:(UIColor *)borderColor{
    _borderColor = borderColor;
    [self setNeedsDisplay];
}

-(void)setBorderWidth:(CGFloat)borderWidth{
    _borderWidth = borderWidth;
    [self setNeedsDisplay];
}

-(void)setTopOffset:(CGFloat)topOffset{
    _topOffset = topOffset;
    [self setNeedsDisplay];
}

-(void)setRadius:(CGFloat)radius{
    _radius = radius;
    [self setNeedsDisplay];
}

-(void)setTriangleWidth:(CGFloat)triangleWidth{
    _triangleWidth = triangleWidth;
    [self setNeedsDisplay];
}

-(void)setTriangleHeight:(CGFloat)triangleHeight{
    _triangleHeight = triangleHeight;
    [self setNeedsDisplay];
}

-(void)setTriangleRadius:(CGFloat)triangleRadius{
    _triangleRadius = triangleRadius;
    [self setNeedsDisplay];
}

@end
