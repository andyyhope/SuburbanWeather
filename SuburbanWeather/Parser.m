//
//  Parser.m
//  WeatherPunt
//
//  Created by Andyy Hope on 27/08/2014.
//  Copyright (c) 2014 Andyy Hope. All rights reserved.
//

#import "Parser.h"
#import "Suburb.h"
#import "Utility.h"
@implementation Parser

+ (void)parseURL:(NSString *)url completion:(void (^)(NSArray *items))completion
{
    NSURL *JSONurl = [NSURL URLWithString:url];
    NSMutableURLRequest* urlRequest = [NSURLRequest requestWithURL:JSONurl];
    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
    
    NSMutableArray *newItems = [NSMutableArray new];
    
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (!connectionError) {
            
            NSError *error = nil;
            NSMutableDictionary *weather = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSArray *suburbsArray = weather[@"data"];
                
                for (NSDictionary *item in suburbsArray) {
                    
                    Suburb *suburb = [Suburb new];
                    
                    suburb.name = item[@"_name"];
                    suburb.condition = item[@"_weatherCondition"];
                    suburb.conditionIcon = item[@"_weatherConditionIcon"];
                    suburb.wind = item[@"_weatherWind"];
                    suburb.humidity = item[@"_weatherHumidity"];
                    suburb.temperature = [item[@"_weatherTemp"] intValue];
                    suburb.temperatureFeel = [item[@"_weatherFeelsLike"] intValue];
                    suburb.country = item[@"_country"][@"_name"];
                    suburb.lastUpdated = [item[@"_weatherLastUpdated"] intValue];
                    
                    if (suburb.lastUpdated) {
                        suburb.daysAgoString = [[NSString stringWithFormat:@"%li days ago", (long)[Utility getDaysFromEpochSecondsCount:suburb.lastUpdated]] uppercaseString];
                    }
                    
                    // Filter out any suburb that doesnt have data
                    // Reason: When the user filtered by Temperature, all the suburbs without data would go to the top
                    // I could have done this better if i had more time
                    
                    if (suburb.temperature != 0) {
                        [newItems addObject:suburb];
                    }
                    
                    completion([NSArray arrayWithArray:newItems]);
                }
            });

            
        } else {
            NSLog(@"%@", [connectionError localizedDescription]);
        }
    }];
}

@end
