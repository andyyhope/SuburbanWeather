//
//  SortViewController.m
//  SuburbanWeather
//
//  Created by Andyy Hope on 28/08/2014.
//  Copyright (c) 2014 Andyy Hope. All rights reserved.
//

#import "SortViewController.h"

#import "UIColor+Hex.h"
@interface SortViewController ()
@property (nonatomic) UIColor *highlightColor;
@end

@implementation SortViewController

- (void)awakeFromNib
{
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view layoutIfNeeded];
    [self updateButtons];
}

- (void)updateButtons
{
    // Tint the current selected option
    
    _highlightColor = [UIColor colorWithHexString:@"007AFF"];
    
    switch (self.sortStyle) {
        case SortStyleAlphabetically:
            self.alphabeticallyButton.tintColor = _highlightColor;
            break;
        case SortStyleTemperature:
            self.temperatureButton.tintColor = _highlightColor;
            break;
        case SortStyleLastUpdated:
            self.lastUpdatedButton.tintColor = _highlightColor;
            break;
    }
    
    // Rotate the Direction button based on Ascending/Descending
    
    self.directionButton.transform = (self.sortAscending) ?  CGAffineTransformIdentity : CGAffineTransformMakeRotation(M_PI);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IB Actions
- (IBAction)sortAlphabeticallyPress:(id)sender {
    
    self.sortStyle = SortStyleAlphabetically;
    
    [self deselectOtherButtonsThatArent:self.alphabeticallyButton];
    
    [self.delegate sortViewDidSelectSortStyle:self.sortStyle withDirection:self.sortAscending];
}

- (IBAction)sortTemperaturePress:(id)sender {
    
    self.sortStyle = SortStyleTemperature;
    
    [self deselectOtherButtonsThatArent:self.temperatureButton];
    
    [self.delegate sortViewDidSelectSortStyle:self.sortStyle withDirection:self.sortAscending];
}

- (IBAction)sortLastUpdatedPress:(id)sender {
    
    self.sortStyle = SortStyleLastUpdated;
    
    [self deselectOtherButtonsThatArent:self.lastUpdatedButton];
    
    [self.delegate sortViewDidSelectSortStyle:self.sortStyle withDirection:self.sortAscending];
}
- (IBAction)directionButtonPress:(id)sender {
    
    
    
    if (self.sortAscending) {
        [UIView animateWithDuration:0.3 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.directionButton.transform = CGAffineTransformMakeRotation(M_PI);
        } completion:^(BOOL finished) {
        }];
    } else {
        [UIView animateWithDuration:0.3 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.directionButton.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
        }];
    }
    
    self.sortAscending = !self.sortAscending;
    
    [self.delegate sortViewDidSelectSortStyle:self.sortStyle withDirection:self.sortAscending];
}


- (void)deselectOtherButtonsThatArent:(UIButton *)button;
{
    UIColor *inactiveColor = [UIColor whiteColor];
    UIColor *activeColor = _highlightColor;
    
    BOOL buttonIsAlphabetical = (self.alphabeticallyButton == button);
    BOOL buttonIsTemperature = (self.temperatureButton == button);
    BOOL buttonIsLastUpdated = (self.lastUpdatedButton == button);
  
    self.alphabeticallyButton.tintColor =  (buttonIsAlphabetical)? activeColor : inactiveColor;
    self.temperatureButton.tintColor = (buttonIsTemperature)? activeColor : inactiveColor;
    self.lastUpdatedButton.tintColor = (buttonIsLastUpdated)? activeColor : inactiveColor;


    
}


@end
