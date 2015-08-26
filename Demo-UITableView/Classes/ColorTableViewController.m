//
//  ColorTableViewController.m
//  Demo-UITableView
//
//  Created by Jonathan Provo on 19/08/15.
//  Copyright (c) 2105. All rights reserved.
//

#import "ColorTableViewController.h"

#import "ColorTableViewCell.h"

@interface ColorTableViewController ()

@property (strong, nonatomic) NSArray *colors;

- (void)createColors;

@end

@implementation ColorTableViewController

#pragma mark - Public

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createColors];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.colors.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ColorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ColorTableViewCell class]) forIndexPath:indexPath];
    [cell configureForColor:self.colors[indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate colorTableViewController:self didSelectColor:self.colors[indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *heightFactors = @[ @(1.0), @(1.4), @(1.8), @(2.2), @(2.6), @(2.2), @(1.8), @(1.4) ];
    NSUInteger index = indexPath.row % heightFactors.count;
    NSNumber *heightFactor = heightFactors[index];
    
    return heightFactor.floatValue * 22.0f;
}

#pragma mark - Private

- (void)createColors
{
    NSMutableArray *randomColors = [NSMutableArray array];
    
    CGFloat step = 0.025f;
    NSUInteger numberOfColors = 1.0f / step;
    for (NSUInteger i = 0; i < numberOfColors; i++) {
        [randomColors addObject:[UIColor colorWithHue:step * i saturation:0.5f brightness:1.0f alpha:1.0f]];
    }
    
    self.colors = randomColors;
}

@end
