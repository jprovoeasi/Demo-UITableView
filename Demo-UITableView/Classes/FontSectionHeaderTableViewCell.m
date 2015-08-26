//
//  FontSectionHeaderTableViewCell.m
//  Demo-UITableView
//
//  Created by Jonathan Provo on 20/08/15.
//  Copyright (c) 2105. All rights reserved.
//

#import "FontSectionHeaderTableViewCell.h"

@interface FontSectionHeaderTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *fontFamilyLabel;

@end

@implementation FontSectionHeaderTableViewCell

#pragma mark - Public

- (void)configureForFamilyFont:(UIFont *)font
{
    self.fontFamilyLabel.font = font;
    self.fontFamilyLabel.text = font.familyName;
}

@end
