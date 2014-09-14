//
//  SortTableViewCell.h
//  SuburbanWeather
//
//  Created by Andyy Hope on 31/08/2014.
//  Copyright (c) 2014 Andyy Hope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SortTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *sortIcon;
@property (weak, nonatomic) IBOutlet UILabel *sortLabel;
@property (weak, nonatomic) IBOutlet UIImageView *directionIcon;

@end
