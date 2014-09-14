//
//  MasterViewController.m
//  SuburbanWeather
//
//  Created by Andyy Hope on 27/08/2014.
//  Copyright (c) 2014 Andyy Hope. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

#import "Suburb.h"
#import "Parser.h"

#import "SuburbTableViewCell.h"
#import "NoDataTableViewCell.h"

#import "SortViewController.h"

#import "SortStoryboardSegue.h"
#import "SortUnwindStoryboardSegue.h"
#import "DetailStoryboardSegue.h"
#import "DetailUnwindStorboardSegue.h"
#import "Utility.h"

NSString *const kJSONurl = @"http://dnu5embx6omws.cloudfront.net/venues/weather.json";

@interface MasterViewController ()
<SortViewDelegate, UISearchBarDelegate, UIViewControllerTransitioningDelegate>
{
    NSArray *_objects;
    NSArray *_searchArray;
    BOOL searching;
}

@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [Parser parseURL:kJSONurl completion:^(NSArray *items) {
        _objects = [NSArray arrayWithArray:items];
        [self.tableView reloadData];
        [self.activityIndicator stopAnimating];
    }];
    
    self.sortAscending = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (searching) return _searchArray.count;
    else return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Suburb *s = (searching)? _searchArray[indexPath.row] : _objects[indexPath.row];

    if (s.temperature > 0) {
        SuburbTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        cell.suburbLabel.text = s.name;
        cell.lastUpdatedLabel.text = s.daysAgoString;
        cell.temperatureLabel.text = [NSString stringWithFormat:@"%li°", (long)s.temperature];
        cell.conditionIcon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@-small",s.conditionIcon]];
        
        UIColor *color = [Utility colorForCondition:s.conditionIcon];
        cell.temperatureLabel.textColor = color;
        cell.conditionIcon.tintColor = color;
        return cell;
    } else
    {
        NoDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NoDataCell" forIndexPath:indexPath];
        cell.suburbLabel.text = s.name;
        return cell;
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}
#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Used different Segue's for different views
    // Detail comes from the top
    // Sort comes from the bottom
    
    if ([segue isKindOfClass:[DetailStoryboardSegue class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Suburb *suburb = _objects[indexPath.row];
        DetailViewController *detailController = segue.destinationViewController;
        detailController.suburb = suburb;
    }
    if([segue isKindOfClass:[SortStoryboardSegue class]]) {
        SortViewController *sortController = segue.destinationViewController;
        sortController.delegate = self;
        sortController.sortStyle = (SortStyle)self.sortStyle;
        sortController.sortAscending = (self.sortStyle == MVCSortStyleLastUpdated)? !self.sortAscending : self.sortAscending;
    }
}


- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier {
    if ([fromViewController isKindOfClass:[SortViewController class]]) {
        SortUnwindStoryboardSegue *segue = [[SortUnwindStoryboardSegue alloc] initWithIdentifier:identifier source:fromViewController destination:toViewController];
        return segue;
    }
    
    if ([fromViewController isKindOfClass:[DetailViewController class]]){
        DetailUnwindStorboardSegue *segue = [[DetailUnwindStorboardSegue alloc] initWithIdentifier:identifier source:fromViewController destination:toViewController];
        return segue;
    }
    
    return [super segueForUnwindingToViewController:toViewController fromViewController:fromViewController identifier:identifier];
    
}

- (IBAction)unwindFromSortViewController:(UIStoryboardSegue *)sender {
    NSLog(@"Sort - Returning to Suburbs List");
}

- (IBAction)unwindFromDetailViewController:(UIStoryboardSegue *)sender {
    NSLog(@"Detail - Returning to Suburbs List");
}

#pragma mark - Search Bar Delegate


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    // Quick fix to tint the searchBar textfield Label because i ran out of time
    UITextField *searchField = [searchBar valueForKey:@"_searchField"];
    searchField.textColor = [UIColor whiteColor];
    
    // Each time the user edits the first, it will perform this search
    // Because i knew the list was finite, i made it do this
    // If it had to query a remote server for results, i would have probably made the search perform on pressing "Search" button
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name contains[cd] %@", searchText];
    _searchArray = [NSArray arrayWithArray:[_objects filteredArrayUsingPredicate:predicate]];
    searching = (searchText.length > 0)? YES : NO;
    [self.tableView reloadData];
    
}

#pragma mark - Sort View Delegate
- (void)sortViewDidSelectSortStyle:(SortStyle)sortStyle withDirection:(BOOL)direction
{
    
    NSLog(@"direction ascending %i", direction);
    
    self.sortStyle = (MVCSortStyle)sortStyle;
    
    NSString *key;
    
    switch (sortStyle) {
        case SortStyleAlphabetically:
            key = @"name";
            break;
        case SortStyleTemperature:
            key = @"temperature";
            break;
            
        case SortStyleLastUpdated:
            key = @"lastUpdated";
            break;
        default:
            break;
    }
    
    // Flip it if Last Updated is checked, it works opposite to the rest
    self.sortAscending = (self.sortStyle == MVCSortStyleLastUpdated)? !direction : direction;
    
    // Add sort descriptor to array
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:self.sortAscending];
    _objects = [_objects sortedArrayUsingDescriptors:@[sortDescriptor]];
    
    [self.tableView reloadData];
    
}

@end
