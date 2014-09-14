//
//  SortViewController.h
//  SuburbanWeather
//
//  Created by Andyy Hope on 28/08/2014.
//  Copyright (c) 2014 Andyy Hope. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef NS_ENUM(NSUInteger, SortStyle) {
    SortStyleAlphabetically,
    SortStyleTemperature,
    SortStyleLastUpdated
};

@protocol SortViewDelegate <NSObject>
- (void)sortViewDidSelectSortStyle:(SortStyle)sortStyle withDirection:(BOOL)direction;
@end


@interface SortViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *directionButton;
@property (weak, nonatomic) IBOutlet UIButton *alphabeticallyButton;
@property (weak, nonatomic) IBOutlet UIButton *temperatureButton;
@property (weak, nonatomic) IBOutlet UIButton *lastUpdatedButton;

@property (nonatomic) BOOL sortAscending;

@property (assign) SortStyle sortStyle;

@property (weak) id<SortViewDelegate>delegate;
@end
