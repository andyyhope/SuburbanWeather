//
//  DetailStoryboardSegue.m
//  SuburbanWeather
//
//  Created by Andyy Hope on 31/08/2014.
//  Copyright (c) 2014 Andyy Hope. All rights reserved.
//

#import "DetailStoryboardSegue.h"

@implementation DetailStoryboardSegue


- (void) perform {
    
    UIView *sView = ((UIViewController *)self.sourceViewController).view;
    UIView *dView = ((UIViewController *)self.destinationViewController).view;
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    [window insertSubview:dView aboveSubview:sView];
    
    
    CGRect sF = sView.frame;
    UINavigationBar *nb;
    CGFloat navBarHeight = nb.frame.size.height;

    // Shift Destination view upwards but have the navigation bars stacked so when they animate, they look like one
    
    // Note, i know using the
    dView.frame = CGRectMake(0, - sF.size.height + navBarHeight, sF.size.width, sF.size.height);
    dView.alpha = 0;
    
    
    [UIView animateWithDuration:0.3 animations:^{
        dView.alpha = 1;
        dView.frame = sF;
        sView.frame = CGRectMake(0, sF.size.height - navBarHeight, sF.size.width, sF.size.height);
    } completion:^(BOOL finished) {
        [[self sourceViewController] presentViewController:
         [self destinationViewController] animated:NO completion:nil];
    }];
    
}
@end
