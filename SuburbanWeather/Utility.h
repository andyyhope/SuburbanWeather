//
//  Utility.h
//  SuburbanWeather
//
//  Created by Andyy Hope on 28/08/2014.
//  Copyright (c) 2014 Andyy Hope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject
+ (NSInteger)getDaysFromEpochSecondsCount:(NSInteger)seconds;
+ (NSString *)getNumberFromString:(NSString *)string;
+ (NSString *)getWindDirectionFromString:(NSString *)string;


+ (UIColor *)colorForCondition:(NSString *)condition;

+ (UIImage *)screenshotOfView:(UIView *)view fromRect:(CGRect)rect;
@end
