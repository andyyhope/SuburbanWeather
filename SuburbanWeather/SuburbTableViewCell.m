//
//  SuburbTableViewCell.m
//  SuburbanWeather
//
//  Created by Andyy Hope on 28/08/2014.
//  Copyright (c) 2014 Andyy Hope. All rights reserved.
//

#import "SuburbTableViewCell.h"

@implementation SuburbTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        
    }
    return self;
}

- (void)awakeFromNib
{
    UIView *selectedView = [[UIView alloc] initWithFrame:self.contentView.frame];
    selectedView.backgroundColor = [UIColor blackColor];
    self.selectedBackgroundView = selectedView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];


}

@end
