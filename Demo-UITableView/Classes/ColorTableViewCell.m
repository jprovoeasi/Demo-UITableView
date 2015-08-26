//
//  ColorTableViewCell.m
//  Demo-UITableView
//
//  Created by Jonathan Provo on 19/08/15.
//  Copyright (c) 2105. All rights reserved.
//

#import "ColorTableViewCell.h"

@implementation ColorTableViewCell

#pragma mark - Public

- (void)configureForColor:(UIColor *)color
{
    // set the actual color
    self.contentView.backgroundColor = color;
    

    // create a color with adjusted brightness
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    UIColor *selectedColor = color;
    if ([color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha]) {
        selectedColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness * 0.9f alpha:alpha];
    }
    
    // set the selectedBackgroundView property to the custom color
    UIView *selectedView = [UIView new];
    selectedView.backgroundColor = selectedColor;
    self.selectedBackgroundView = selectedView;
}

@end
