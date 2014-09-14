//
//  Utility.m
//  SuburbanWeather
//
//  Created by Andyy Hope on 28/08/2014.
//  Copyright (c) 2014 Andyy Hope. All rights reserved.
//

#import "Utility.h"
#import "UIColor+Hex.h"

@implementation Utility
+ (NSInteger)getDaysFromEpochSecondsCount:(NSInteger)seconds
{

    // (Step 1) Create NSDate object
    NSDate *epochNSDate = [[NSDate alloc] initWithTimeIntervalSince1970:seconds];
//    NSLog (@"Epoch time %@ equates to UTC %@", seconds, epochNSDate);
    
    // (Step 2) Use NSDateFormatter to display epochNSDate in local time zone
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
//    NSLog (@"Epoch time %@ equates to %@", seconds, [dateFormatter stringFromDate:epochNSDate]);
    
    // (Just for interest) Display your current time zone
//    NSString *currentTimeZone = [[dateFormatter timeZone] abbreviation];
//    NSLog (@"(Your local time zone is: %@)", currentTimeZone);
    
    NSTimeInterval secondsBetween = [[NSDate date] timeIntervalSinceDate:epochNSDate];
    int numberOfDays = secondsBetween / 86400;
//    NSLog(@"days %i", numberOfDays);
    
    
    return numberOfDays;
}

+ (NSString *)getNumberFromString:(NSString *)string
{
    // Intermediate
    NSString *numberString;
    
    NSScanner *scanner = [NSScanner scannerWithString:string];
    NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    
    // Throw away characters before the first number.
    [scanner scanUpToCharactersFromSet:numbers intoString:NULL];
    
    // Collect numbers.
    [scanner scanCharactersFromSet:numbers intoString:&numberString];
    
    // Result.
    
    return numberString;
}

+ (NSString *)getWindDirectionFromString:(NSString *)string
{
    NSArray *substrings = [string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    return substrings[1];
}
+ (UIColor *)colorForCondition:(NSString *)condition
{
    UIColor *color;
    
    if ([condition isEqualToString:@"clear"]) {
        color = [UIColor colorWithHexString:@"f1c40f"];
    }
    
    if ([condition isEqualToString:@"partlycloudy"]) {
        color = [UIColor colorWithHexString:@"27ae60"];
    }
    if ([condition isEqualToString:@"cloudy"]) {
        color = [UIColor colorWithHexString:@"1abc9c"];
    }
    
    if ([condition isEqualToString:@"mostlycloudy"]) {
        color = [UIColor colorWithHexString:@"16a085"];
    }
    
    if ([condition isEqualToString:@"rain"]) {
        color = [UIColor colorWithHexString:@"3498db"];
    }
    
    if ([condition isEqualToString:@"tstorms"]) {
        color = [UIColor colorWithHexString:@"8e44ad"];
    }
    
    if ([condition isEqualToString:@"hazy"]) {
        color = [UIColor colorWithHexString:@"bdc3c7"];
    }
    
    if ([condition isEqualToString:@"fog"]) {
        color = [UIColor colorWithHexString:@"95a5a6"];
    }
    
    return color;
}

+ (UIImage *)screenshotOfView:(UIView *)view fromRect:(CGRect)rect
{
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [UIScreen mainScreen].scale);
    
    [view drawViewHierarchyInRect:rect afterScreenUpdates:NO];
    
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([screenshot CGImage], rect);
    UIImage *img = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return img;
    
    
    return img;
}

@end
