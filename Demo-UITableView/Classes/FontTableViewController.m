//
//  FontTableViewController.m
//  Demo-UITableView
//
//  Created by Jonathan Provo on 20/08/15.
//  Copyright (c) 2105. All rights reserved.
//

#import "FontTableViewController.h"

#import "FontSectionHeaderTableViewCell.h"
#import "FontTableViewCell.h"

@interface FontTableViewController () <UISearchBarDelegate>

@property (strong, nonatomic) NSDictionary *fontsPerFamilyName;

- (UIFont *)fontAtIndexPath:(NSIndexPath *)indexPath;
- (NSArray *)fontsInSection:(NSUInteger)section;

- (void)createFontsPerFamilyNameWithSearchText:(NSString *)searchText;

@end

@implementation FontTableViewController

#pragma mark - Public

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createFontsPerFamilyNameWithSearchText:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.fontsPerFamilyName.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self fontsInSection:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FontTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FontTableViewCell class]) forIndexPath:indexPath];
    [cell configureForFont:[self fontAtIndexPath:indexPath]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate fontTableViewController:self didSelectFont:[self fontAtIndexPath:indexPath]];
    [self.navigationController popViewControllerAnimated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 66.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    FontSectionHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FontSectionHeaderTableViewCell class])];
    NSIndexPath *indexPathOfFirstFontInFamily = [NSIndexPath indexPathForRow:0 inSection:section];
    [cell configureForFamilyFont:[self fontAtIndexPath:indexPathOfFirstFontInFamily]];
    
    return cell;
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self createFontsPerFamilyNameWithSearchText:searchText];
    [self.tableView reloadData];
}

#pragma mark - Private

- (UIFont *)fontAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *fonts = [self fontsInSection:indexPath.section];
    UIFont *font = fonts[indexPath.row];
    
    return font;
}

- (NSArray *)fontsInSection:(NSUInteger)section
{
    NSArray *sortedKeys = [self.fontsPerFamilyName.allKeys sortedArrayUsingSelector:@selector(compare:)];
    NSString *fontFamilyName = sortedKeys[section];
    NSArray *fonts = self.fontsPerFamilyName[fontFamilyName];
    
    return fonts;
}

- (void)createFontsPerFamilyNameWithSearchText:(NSString *)searchText
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    NSArray *familyNames = [UIFont familyNames];
    for (NSString *familyName in familyNames) {
        
        NSString *searchableFamilyName = familyName.lowercaseString;
        if (searchText.length == 0 || [searchableFamilyName containsString:searchText.lowercaseString]) {
        
            NSArray *fontNamesForFamilyName = [UIFont fontNamesForFamilyName:familyName];
            NSMutableArray *fontsForFamilyName = [NSMutableArray arrayWithCapacity:fontNamesForFamilyName.count];
            for (NSString *fontName in fontNamesForFamilyName) {
                [fontsForFamilyName addObject:[UIFont fontWithName:fontName size:16.0f]];
            }
        
            [dictionary setObject:fontsForFamilyName forKey:familyName];
        }
    }
    
    self.fontsPerFamilyName = dictionary;
}

@end
