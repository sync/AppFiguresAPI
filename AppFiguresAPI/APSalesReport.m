//
//  APSalesReport.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-29.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import "APSalesReport.h"
#import "APProduct.h"

NSString * const APSalesTypeProducts = @"products";
NSString * const APSalesTypeDates = @"dates";
NSString * const APSalesTypeCountries = @"countries";
NSString * const APSalesTypeProductsAndDates = @"products+dates";
NSString * const APSalesTypeDatesAndProducts = @"dates+products";
NSString * const APSalesTypeProductsAndCountries = @"products+countries";
NSString * const APSalesTypeCountriesAndProducts = @"countries+products";

NSString * const APSalesDataSourceDaily = @"daily";
NSString * const APSalesDataSourceWeekly = @"weekly";
NSString * const APSalesDataSourceMonthly = @"monthly";

@interface APSalesReport ()
@property (nonatomic, strong) NSDictionary *data;
@end

@implementation APSalesReport
@synthesize data;

- (id)initWithResponse:(NSDictionary *)response
{
    if ((self = [super init])) {
        self.data = response;
    }
    return self;
}

- (NSString *)country
{
    return [self.data objectForKey:@"country"];
}

- (NSString *)iso
{
    return [self.data objectForKey:@"iso"];
}

- (APProduct *)product
{
    static APProduct *_product = nil;
    if (!_product) {
        _product = [[APProduct alloc] initWithResponse:[self.data objectForKey:@"product"]];
    }
    return _product;
}

- (NSUInteger)downloads
{
    return [[self.data objectForKey:@"downloads"] unsignedIntegerValue];
}

- (NSInteger)netDownloads
{
    return [[self.data objectForKey:@"net_downloads"] integerValue];
}

- (NSUInteger)updates
{
    return [[self.data objectForKey:@"updates"] unsignedIntegerValue];
}

- (float)totalRevenue
{
    return [[self.data objectForKey:@"total_revenue"] floatValue];
}

- (NSUInteger)returns
{
    return [[self.data objectForKey:@"returns"] unsignedIntegerValue];
}

- (NSUInteger)giftRedemptions
{
    return [[self.data objectForKey:@"gift_redemptions"] unsignedIntegerValue];
}

- (NSUInteger)promos
{
    return [[self.data objectForKey:@"promos"] unsignedIntegerValue];
}

@end
