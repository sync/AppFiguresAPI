//
//  APSalesReport.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-29.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APProduct;

extern NSString * const APSalesTypeProducts;
extern NSString * const APSalesTypeDates;
extern NSString * const APSalesTypeCountries;
extern NSString * const APSalesTypeProductsAndDates;
extern NSString * const APSalesTypeDatesAndProducts;
extern NSString * const APSalesTypeProductsAndCountries;
extern NSString * const APSalesTypeCountriesAndProducts;

extern NSString * const APSalesDataSourceDaily;
extern NSString * const APSalesDataSourceWeekly;
extern NSString * const APSalesDataSourceMonthly;

typedef NSString * APSalesType;
typedef NSString * APSalesDataSource;

@interface APSalesReport : NSObject

- (id)initWithResponse:(NSDictionary *)response;

@property (readonly) NSString *country;
@property (readonly) NSString *iso;
@property (readonly) NSUInteger downloads;
@property (readonly) NSInteger netDownloads;
@property (readonly) NSUInteger updates;
@property (readonly) float totalRevenue;
@property (readonly) NSUInteger returns;
@property (readonly) NSUInteger giftRedemptions;
@property (readonly) NSUInteger promos;
@property (readonly) APProduct *product;

@end
