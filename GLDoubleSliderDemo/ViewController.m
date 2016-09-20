//
//  ViewController.m
//  GLDoubleSliderDemo
//
//  Created by 温国力 on 16/9/20.
//  Copyright © 2016年 wenguoli. All rights reserved.
//

#import "ViewController.h"
#import "GLDoubleSlider.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载xib
    GLDoubleSlider *doubleSlider = [[NSBundle mainBundle] loadNibNamed:
                                    @"GLDoubleSlider" owner:nil options:nil ].lastObject;
    doubleSlider.frame = CGRectMake(20, 100, [UIScreen mainScreen].bounds.size.width - 40, 60);
    [self.view addSubview:doubleSlider];
    doubleSlider.sliderBlock = ^(NSInteger lowerNumber, NSInteger upperNumber){
        
        NSLog(@"最低值:%zd----最高值:%zd",lowerNumber,upperNumber);
        
    };
}


@end
