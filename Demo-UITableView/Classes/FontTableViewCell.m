//
//  FontTableViewCell.m
//  Demo-UITableView
//
//  Created by Jonathan Provo on 20/08/15.
//  Copyright (c) 2105. All rights reserved.
//

#import "FontTableViewCell.h"

@interface FontTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *fontLabel;

@end

@implementation FontTableViewCell

#pragma mark - Public

- (void)configureForFont:(UIFont *)font
{
    self.fontLabel.font = font;
    self.fontLabel.text = font.familyName;
}

@end
