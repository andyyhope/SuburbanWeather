//
//  SortTableViewCell.m
//  SuburbanWeather
//
//  Created by Andyy Hope on 31/08/2014.
//  Copyright (c) 2014 Andyy Hope. All rights reserved.
//

#import "SortTableViewCell.h"

@implementation SortTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
