//
//  OverviewTableViewController.m
//  Demo-UITableView
//
//  Created by Jonathan Provo on 19/08/15.
//  Copyright (c) 2105. All rights reserved.
//

#import "OverviewTableViewController.h"

#import "ColorTableViewController.h"
#import "FontTableViewController.h"

@interface OverviewTableViewController () <ColorTableViewControllerDelegate, FontTableViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *strokeView;
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (strong, nonatomic) UIColor *color;
@property (weak, nonatomic) IBOutlet UILabel *fontFamilyName;
@property (strong, nonatomic) UIFont *font;

- (void)updateOverview;

@end

@implementation OverviewTableViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.color = [UIColor whiteColor];
    self.strokeView.layer.cornerRadius = CGRectGetWidth(self.strokeView.frame) / 2.0f;
    self.colorView.layer.cornerRadius = CGRectGetWidth(self.colorView.frame) / 2.0f;
    self.fontFamilyName.hidden = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateOverview];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self updateOverview];
}

#pragma mark - UIViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    
    if ([segue.destinationViewController isKindOfClass:[ColorTableViewController class]]) {
        ColorTableViewController *colorTableViewController = segue.destinationViewController;
        colorTableViewController.delegate = self;
        
    } else if ([segue.destinationViewController isKindOfClass:[FontTableViewController class]]) {
        FontTableViewController *fontTableViewController = segue.destinationViewController;
        fontTableViewController.delegate = self;
    }
}

#pragma mark - ColorTableViewControllerDelegate

- (void)colorTableViewController:(ColorTableViewController *)controller didSelectColor:(UIColor *)color
{
    self.color = color;
}

#pragma mark - FontTableViewControllerDelegate

- (void)fontTableViewController:(FontTableViewController *)controller didSelectFont:(UIFont *)font
{
    self.font = font;
}

#pragma mark - Private

- (void)updateOverview
{
    self.colorView.backgroundColor = self.color;
    self.fontFamilyName.font = self.font;
    self.fontFamilyName.text = self.font.familyName;
    self.fontFamilyName.hidden = NO;
}

#pragma mark - Navigation

- (IBAction)unwindToOverview:(UIStoryboardSegue *)segue
{
}

@end
