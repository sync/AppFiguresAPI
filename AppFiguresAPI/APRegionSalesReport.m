//
//  APRegionSalesReport.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-29.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import "APRegionSalesReport.h"

@interface APRegionSalesReport ()
@property (nonatomic, strong) NSDictionary *data;
@end

@implementation APRegionSalesReport

- (id)initWithResponse:(NSDictionary *)response
{
    if ((self = [super init])) {
        self.data = response;
    }
    return self;
}

- (NSUInteger)regionID
{
    return [[self.data objectForKey:@"region_id"] unsignedIntegerValue];
}

- (NSString *)regionName
{
    return [self.data objectForKey:@"region_name"];
}

- (NSString *)currency
{
    return [self.data objectForKey:@"currency"];
}

- (NSUInteger)returns
{
    return [[self.data objectForKey:@"returns"] unsignedIntegerValue];
}

- (NSUInteger)units
{
    return [[self.data objectForKey:@"units"] unsignedIntegerValue];
}

- (NSString *)convertedRevenue
{
    return [self.data objectForKey:@"converted_revenue"];
}

- (NSString *)baseRevenue
{
    return [self.data objectForKey:@"base_revenue"];
}

@end
