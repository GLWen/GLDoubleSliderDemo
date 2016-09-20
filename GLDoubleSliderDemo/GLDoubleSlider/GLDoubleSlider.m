//
//  GLDoubleSlider.m
//  GLSlider
//
//  Created by 温国力 on 16/9/20.
//  Copyright © 2016年 wenguoli. All rights reserved.
//

#import "GLDoubleSlider.h"
#import "NMRangeSlider.h"
@interface GLDoubleSlider()

@property (weak, nonatomic) IBOutlet NMRangeSlider *labelSlider;
@property (weak, nonatomic) IBOutlet UILabel *lowerLabel;
@property (weak, nonatomic) IBOutlet UILabel *upperLabel;

@property (weak, nonatomic) IBOutlet UILabel *PlaceholderNumber1;
@property (weak, nonatomic) IBOutlet UILabel *PlaceholderNumber2;


@end


@implementation GLDoubleSlider

@synthesize labelSlider;
@synthesize lowerLabel;
@synthesize upperLabel;

#pragma mark - awakeFromNib
- (void)awakeFromNib
{
    [self configureLabelSlider];
    
    [self configureMetalSlider];
    
}
#pragma mark - Label  Slider
- (void) configureLabelSlider
{
    if (self.handleLeftValue != 0) {
        self.labelSlider.minimumValue = self.handleLeftValue;
    }else{
        self.labelSlider.minimumValue = 0;
    }
    if (self.handleRightValue != 0) {
        self.labelSlider.maximumValue = self.handleRightValue;
    }else{
        self.labelSlider.maximumValue = 100;
    }
    if (self.lowerValue != 0) {
        self.labelSlider.lowerValue = self.lowerValue;
    }else{
        self.labelSlider.lowerValue = 0;
    }
    if (self.upperValue != 0) {
        self.labelSlider.upperValue = self.upperValue;
    }else{
        self.labelSlider.upperValue = 100;
    }
    if (self.handleSpace != 0) {
        self.labelSlider.minimumRange = self.handleSpace;
    }else{
        self.labelSlider.minimumRange = 10;
    }
    
}

- (void) updateSliderLabels
{
    // You get get the center point of the slider handles and use this to arrange other subviews
    
    CGPoint lowerCenter;
    lowerCenter.x = (self.labelSlider.lowerCenter.x + self.labelSlider.frame.origin.x);
    lowerCenter.y = (self.labelSlider.center.y - 30.0f);
    self.lowerLabel.center = lowerCenter;
    self.lowerLabel.hidden = NO;
    self.lowerLabel.text = [NSString stringWithFormat:@"%d", (int)self.labelSlider.lowerValue];
    
    CGPoint upperCenter;
    upperCenter.x = (self.labelSlider.upperCenter.x + self.labelSlider.frame.origin.x);
    upperCenter.y = (self.labelSlider.center.y - 30.0f);
    self.upperLabel.center = upperCenter;
    self.upperLabel.hidden = NO;
    self.upperLabel.text = [NSString stringWithFormat:@"%d", (int)self.labelSlider.upperValue];
    
    self.PlaceholderNumber1.hidden = YES;
    self.PlaceholderNumber2.hidden = YES;
    
    //传值出去
    if (_sliderBlock) {
        _sliderBlock(self.labelSlider.lowerValue,self.labelSlider.upperValue);
    }
    
}

#pragma mark - 监听滑动条数值的变化
- (IBAction)labelSliderChanged {
    
    [self updateSliderLabels];
    
}
#pragma mark - set HandleImage
- (void) configureMetalSlider
{
    [self configureMetalThemeForSlider:self.labelSlider];
}
#pragma mark - Metal Theme Slider
- (void) configureMetalThemeForSlider:(NMRangeSlider*) slider
{
    UIImage* image = nil;
    
    image = [UIImage imageNamed:@"slider-metal-trackBackground"];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 5.0, 0.0, 5.0)];
    slider.trackBackgroundImage = image;
    
    image = [UIImage imageNamed:@"slider-metal-track"];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 7.0, 0.0, 7.0)];
    slider.trackImage = image;
    
    image = [UIImage imageNamed:@"slider-metal-handle"];
    slider.lowerHandleImageNormal = image;
    slider.upperHandleImageNormal = image;
    
    image = [UIImage imageNamed:@"slider-metal-handle-highlighted"];
    slider.lowerHandleImageHighlighted = image;
    slider.upperHandleImageHighlighted = image;
}


@end
