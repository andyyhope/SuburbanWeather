//
//  DetailViewController.m
//  SuburbanWeather
//
//  Created by Andyy Hope on 27/08/2014.
//  Copyright (c) 2014 Andyy Hope. All rights reserved.
//

#import "DetailViewController.h"
#import "Suburb.h"
#import "Utility.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)configureView
{
    // Update the user interface for the detail item.
    
    self.suburbLabel.text = self.suburb.name;
    self.countryLabel.text = self.suburb.country;
    self.weatherLabel.text = self.suburb.condition;
    self.weatherImageView.image = [UIImage imageNamed:self.suburb.conditionIcon];
    self.temperatureLabel.text = [NSString stringWithFormat:@"%li°", (long)self.suburb.temperature];
    self.lastUpdatedLabel.text = [[NSString stringWithFormat:@"Last updated %@", self.suburb.daysAgoString] uppercaseString];
    self.humidityLabel.text = [NSString stringWithFormat:@"%@%%", [Utility getNumberFromString:self.suburb.humidity]];
    self.windSpeedLabel.text = [NSString stringWithFormat:@"%@kph", [Utility getNumberFromString:self.suburb.wind]];
    self.suburb.windDirection = [Utility getWindDirectionFromString:self.suburb.wind];
    self.windDirectionLabel.text = self.suburb.windDirection;
    self.windDirectionCompass.transform = CGAffineTransformMakeRotation([self getDegreesFromDirection:self.suburb.windDirection] * M_PI/180);
    
    // Make the compas shift very slightly to make it look like wind is making it wave
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
        self.windDirectionCompass.transform = CGAffineTransformMakeRotation(([self getDegreesFromDirection:self.suburb.windDirection] + 5) * M_PI/180);
    } completion:^(BOOL finished) {
        
    }];
    
    
    UIColor *tintColor = [Utility colorForCondition:self.suburb.conditionIcon];
    self.weatherImageView.tintColor = tintColor;
    self.temperatureLabel.textColor = tintColor;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IB Actions

- (CGFloat)getDegreesFromDirection:(NSString *)direction
{
    CGFloat degrees = 0;

    // Iterate until we find the correct value of the string, increment by 1/16 of 360 degrees each iteration
    for (int i = 0; i < 16; i++) {
        if ([direction isEqualToString:@"North"] && i == 0) break;  // 0        North
        if ([direction isEqualToString:@"NNE"] && i == 1) break;    // 22.5     North-NorthEast
        if ([direction isEqualToString:@"NE"] && i == 2) break;     // 45       North East
        if ([direction isEqualToString:@"ENE"] && i == 3) break;    // 67.5     East-NorthEast
        if ([direction isEqualToString:@"East"] && i == 4) break;   // 90       East
        if ([direction isEqualToString:@"ESE"] && i == 5) break;    // 112.5    East South East
        if ([direction isEqualToString:@"SE"] && i == 6) break;     // 135      South East
        if ([direction isEqualToString:@"SSE"] && i == 7) break;    // 157.5    South-SouthEast
        if ([direction isEqualToString:@"South"] && i == 8) break;  // 180      South
        if ([direction isEqualToString:@"SSW"] && i == 9) break;    // 202.5    South-SouthWest
        if ([direction isEqualToString:@"SW"] && i == 10) break;    // 225      South West
        if ([direction isEqualToString:@"WSW"] && i == 11) break;   // 247.5    West-SouthWest
        if ([direction isEqualToString:@"West"] && i == 12) break;  // 270      West
        if ([direction isEqualToString:@"WNW"] && i == 13) break;   // 292.5    West-NorthWest
        if ([direction isEqualToString:@"NW"] && i == 14) break;    // 315      North West
        if ([direction isEqualToString:@"NWN"] && i == 15) break;   // 337.5    North-NorthWest
        degrees += 22.5;
    }
    
    return degrees;
}

@end
