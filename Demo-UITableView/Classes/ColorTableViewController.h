//
//  ColorTableViewController.h
//  Demo-UITableView
//
//  Created by Jonathan Provo on 19/08/15.
//  Copyright (c) 2105. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ColorTableViewController;

@protocol ColorTableViewControllerDelegate

- (void)colorTableViewController:(ColorTableViewController *)controller didSelectColor:(UIColor *)color;

@end

@interface ColorTableViewController : UITableViewController

@property (weak, nonatomic) id <ColorTableViewControllerDelegate> delegate;

@end
