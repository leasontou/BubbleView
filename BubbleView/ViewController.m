//
//  ViewController.m
//  BubbleView
//
//  Created by Den on 15/12/29.
//  Copyright © 2015年 Leason. All rights reserved.
//

#import "ViewController.h"
#import "BubbleView.h"

#define ColorFromRGB(rgbValue) ([UIColor  \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0  \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0  \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0])

@interface ViewController ()
@property (weak, nonatomic) IBOutlet BubbleView *bubble1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)toogleDirection:(id)sender {
    if (self.bubble1.direction == BubbleDirectionLeft) {
        self.bubble1.direction = BubbleDirectionRight;
    }else{
        self.bubble1.direction = BubbleDirectionLeft;
    }
}
- (IBAction)changeBorderColor:(id)sender {
    static int rgb = 0x000000;
    rgb += 0x000088;
    if (rgb>0xffffff) {
        rgb = 0x000000;
    }
    self.bubble1.borderColor = ColorFromRGB(rgb);
}
- (IBAction)changeBorderWidth:(id)sender {
    self.bubble1.borderWidth += 0.5;
}
- (IBAction)changeTopoffset:(id)sender {
    self.bubble1.topOffset += 10;
}
- (IBAction)changeRadius:(id)sender {
    self.bubble1.radius += 4;
}
- (IBAction)changeTriangleWidth:(id)sender {
    self.bubble1.triangleWidth += 5;
}
- (IBAction)changeTriangleHeight:(id)sender {
    self.bubble1.triangleHeight += 5;
}
- (IBAction)changeTriangleRadius:(id)sender {
    self.bubble1.triangleRadius += 2.0;
}
- (IBAction)testImage:(id)sender {
    static BOOL hasTest = NO;
    if (!hasTest) {
        UIImageView* imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"testimage"]];
        imageview.contentMode = UIViewContentModeScaleAspectFill;
        imageview.frame = CGRectMake(0, 0, self.bubble1.frame.size.width, self.bubble1.frame.size.height);
        [self.bubble1 addSubview:imageview];
    }else{
        for (UIView* view in self.bubble1.subviews) {
            [view removeFromSuperview];
        }
    }
    
    hasTest = !hasTest;
}

@end
