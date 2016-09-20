//
//  GLDoubleSlider.h
//  GLSlider
//
//  Created by 温国力 on 16/9/20.
//  Copyright © 2016年 wenguoli. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^GLDoubleSliderBlock)(NSInteger lowerNumber, NSInteger upperNumber);

@interface GLDoubleSlider : UIView
/**
 *  回到滑动条两端的数值
 */
@property(strong,nonatomic) GLDoubleSliderBlock sliderBlock;
/**
 *  设置滑动按钮的左边位置，默认为0
 */
@property (nonatomic,assign) NSInteger handleLeftValue;
/**
 *  设置滑动按钮的右边位置，默认为100
 */
@property (nonatomic,assign) NSInteger handleRightValue;
/**
 *  设置滑动条左边的值，默认为0
 */
@property (nonatomic,assign) NSInteger lowerValue;
/**
 *  设置滑动条右边的值，默认为100
 */
@property (nonatomic,assign) NSInteger upperValue;
/**
 *  设置两个值之间的最小间距值，默认10
 */
@property (nonatomic,assign) NSInteger handleSpace;

@end
