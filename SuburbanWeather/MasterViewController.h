//
//  MasterViewController.h
//  SuburbanWeather
//
//  Created by Andyy Hope on 27/08/2014.
//  Copyright (c) 2014 Andyy Hope. All rights reserved.
//

#import <UIKit/UIKit.h>
@import QuartzCore;
@class FadeTransition;

typedef NS_ENUM(NSUInteger, MVCSortStyle) {
    MVCSortStyleAlphabetically,
    MVCSortStyleTemperature,
    MVCSortStyleLastUpdated
};

@interface MasterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic) MVCSortStyle sortStyle;
@property (nonatomic) BOOL sortAscending;

@end
