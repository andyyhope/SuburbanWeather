//
//  DetailViewController.h
//  SuburbanWeather
//
//  Created by Andyy Hope on 27/08/2014.
//  Copyright (c) 2014 Andyy Hope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
