//
//  Suburb.h
//  SuburbanWeather
//
//  Created by Andyy Hope on 28/08/2014.
//  Copyright (c) 2014 Andyy Hope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Suburb : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *country;
@property (nonatomic) NSString *sport;

@property (nonatomic) NSString *condition;
@property (nonatomic) NSString *conditionIcon;

@property (nonatomic) NSString *wind;
@property (nonatomic) NSString *windDirection;
@property (nonatomic) NSInteger windSpeed;

@property (nonatomic) NSString *humidity;
@property (nonatomic) NSInteger humidityPercentage;

@property (nonatomic) NSInteger temperature;
@property (nonatomic) NSInteger temperatureFeel;
@property (nonatomic) NSInteger lastUpdated;

@property (nonatomic) NSString *daysAgoString;
@end
