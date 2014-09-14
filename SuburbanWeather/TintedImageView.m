//
//  TintedImageView.m
//  SuburbanWeather
//
//  Created by Andyy Hope on 31/08/2014.
//  Copyright (c) 2014 Andyy Hope. All rights reserved.
//

#import "TintedImageView.h"

@implementation TintedImageView


-(void)awakeFromNib {
    self.image = self.image;
}

-(void)setImage:(UIImage *)image {
    super.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}



@end
