//
//  Parser.h
//  WeatherPunt
//
//  Created by Andyy Hope on 27/08/2014.
//  Copyright (c) 2014 Andyy Hope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parser : NSObject
+ (void)parseURL:(NSString *)url completion:(void (^)(NSArray *items))completion;
@end
