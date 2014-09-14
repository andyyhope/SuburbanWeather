//
//  SuburbTableViewCell.h
//  SuburbanWeather
//
//  Created by Andyy Hope on 28/08/2014.
//  Copyright (c) 2014 Andyy Hope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuburbTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *suburbLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *noDataLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastUpdatedLabel;
@property (weak, nonatomic) IBOutlet UIImageView *conditionIcon;
@end
