//
//  SortUnwindStoryboardSegue.m
//  SuburbanWeather
//
//  Created by Andyy Hope on 30/08/2014.
//  Copyright (c) 2014 Andyy Hope. All rights reserved.
//

#import "SortUnwindStoryboardSegue.h"

@implementation SortUnwindStoryboardSegue
- (void)perform {
    UIView *sView = ((UIViewController *)self.sourceViewController).view;
    UIView *dView = ((UIViewController *)self.destinationViewController).view;
    
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    [window insertSubview:dView belowSubview:sView];
    
    UINavigationBar *nb;
    CGFloat navBarHeight = nb.frame.size.height;
    
    CGRect sF = sView.frame;
    
    // Set the Suburbs list below the visible frame, minus the width of navigation bar
    dView.frame = CGRectMake(0, - sF.size.height + navBarHeight, sF.size.width, sF.size.height);


    [UIView animateWithDuration:0.25 animations:^{
        sView.frame = CGRectMake(0, sF.size.height - navBarHeight, sF.size.width, sF.size.height);
        sView.alpha = 0;
        dView.frame = sF;

    } completion:^(BOOL finished) {
        [[self destinationViewController] dismissViewControllerAnimated:NO completion:nil];
    }];
}
@end
