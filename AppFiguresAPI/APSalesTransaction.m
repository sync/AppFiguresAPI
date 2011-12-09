//
//  APSalesTransaction.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-29.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import "APSalesTransaction.h"
#import "APProduct.h"
#import "APDateRange.h"
#import "APConstants.h"

@implementation APSalesTransaction
@synthesize dataSource;
@synthesize type;
@synthesize dateRange;
@synthesize products;
@synthesize countryISO;
@synthesize transactionFailed;
@synthesize transactionCompleted;

- (id)init
{
    if ((self = [super init])) {
        [self beginTransaction];
    }
    return self;
}

- (void)beginTransaction
{
    [super beginTransactionWithURL:nil method:APHTTPMethodGet];
    self.request.delegate = self;
    self.type = APSalesTypeDates;
}

- (void)commitTransaction
{
    //
    // GET /sales/{type}/{startDate}/{endDate}/?data_source={dataSource}&products={productId1;productId2;...productIdN}&country={country}
    //
    
    NSMutableString *_url = [[NSMutableString alloc] initWithString:@"sales/"];
    [_url appendFormat:@"%@/", self.type];
    
    if (self.dateRange) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        [_url appendFormat:@"%@/%@/", [formatter stringFromDate:self.dateRange.from], [formatter stringFromDate:self.dateRange.to]];
    } else {
        if ([self.type rangeOfString:@"dates"].length != 0) {
            // We have a problem. For now just add today.
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy-MM-dd"];
            NSString *todaysDate = [formatter stringFromDate:[NSDate date]];
            [_url appendFormat:@"%@/%@/", todaysDate, todaysDate];
        }
    }
    
    BOOL hasProducts = (self.products && [self.products count] > 0);
    if (self.dataSource || hasProducts || self.countryISO) {
        [_url appendString:@"?"];
        
        if (self.dataSource) {
            [_url appendFormat:@"data_source=%@", self.dataSource];
            if (hasProducts || self.countryISO) {
                [_url appendString:@"&"];
            }
        }
        
        if (hasProducts) {
            [_url appendString:@"products="];
            for (NSInteger i = 0; i < [self.products count]; i++) {
                NSInteger productID = [[self.products objectAtIndex:i] integerValue];
                [_url appendFormat:@"%d", productID];
                if (i != [self.products count]-1) {
                    [_url appendString:@";"];
                }
            }
            if (self.countryISO) {
                [_url appendString:@"&"];
            }
        }
        
        if (self.countryISO) {
            [_url appendFormat:@"country=%@", self.countryISO];
        }
    }
    
    self.URL = [NSURL URLWithString:_url];
    
    [super commitTransaction];
}

- (void)request:(APRequest *)request didCompleteWithResults:(NSDictionary *)results
{
    // Replace all actual reports with objects.
    NSMutableDictionary *newDict = [[NSMutableDictionary alloc] initWithDictionary:results];
    
    if ([self.type rangeOfString:@"+"].length == 0) {
        for (NSString *key in results) {
            [newDict setObject:[[APSalesReport alloc] initWithResponse:[results objectForKey:key]] forKey:key];
        }
    } else {
        for (NSString *key in results) {
            NSDictionary *dict = [results objectForKey:key];
            for (NSString *key2 in dict) {
                APSalesReport *report = [[APSalesReport alloc] initWithResponse:[dict objectForKey:key2]];
                
                [[newDict objectForKey:key] setObject:report forKey:key2];
            }
        }
    }
    
    if (self.transactionCompleted) {
        self.transactionCompleted(self, newDict);
    }
}

- (void)request:(APRequest *)request didFailWithError:(NSError *)error
{
    if (self.transactionFailed) {
        self.transactionFailed(self, error);
    }
}

@end
