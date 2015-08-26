//
//  FontTableViewController.h
//  Demo-UITableView
//
//  Created by Jonathan Provo on 20/08/15.
//  Copyright (c) 2105. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FontTableViewController;

@protocol FontTableViewControllerDelegate

- (void)fontTableViewController:(FontTableViewController *)controller didSelectFont:(UIFont *)font;

@end

@interface FontTableViewController : UITableViewController

@property (weak, nonatomic) id <FontTableViewControllerDelegate> delegate;

@end
