//
//  SortStoryboardSegue.m
//  SuburbanWeather
//
//  Created by Andyy Hope on 30/08/2014.
//  Copyright (c) 2014 Andyy Hope. All rights reserved.
//

#import "SortStoryboardSegue.h"
#import "Utility.h"

@implementation SortStoryboardSegue


- (void) perform {
    
    UIView *sView = ((UIViewController *)self.sourceViewController).view;
    UIView *dView = ((UIViewController *)self.destinationViewController).view;
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];

    [window insertSubview:dView aboveSubview:sView];
   
    
    UINavigationBar *nb;
    CGFloat navBarHeight = nb.frame.size.height;
    
    CGRect sF = sView.frame;
    
    dView.alpha = 0;
    dView.frame = CGRectMake(0, sF.size.height - navBarHeight, sF.size.width, sF.size.height);

    
    [UIView animateWithDuration:0.3 animations:^{
        dView.alpha = 1;
        dView.frame = sF;
        sView.frame = CGRectMake(0, - sF.size.height + navBarHeight, sF.size.width, sF.size.height);
        
    } completion:^(BOOL finished) {
        [[self sourceViewController] presentViewController:
         [self destinationViewController] animated:NO completion:nil];
    }];
    
}
@end
