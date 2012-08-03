//
//  APRankTransaction.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-30.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import "APRankTransaction.h"
#import "APDateRange.h"
#import "APConstants.h"
#import "APRankData.h"

NSString * const APRankGranularityDaily = @"daily";
NSString * const APRankGranularityHourly = @"hourly";

@implementation APRankTransaction

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
    self.granularity = APRankGranularityDaily;
}

- (void)commitTransaction
{
    //
    // GET ranks/{productIds}/{granularity}/{startDate}/{endDate}/?countries={countries}&filter={filter}
    //
    
    NSMutableString *_url = [[NSMutableString alloc] initWithString:@"ranks/"];
    for (NSInteger i = 0; i < [self.products count]; i++) {
        NSInteger productID = [[self.products objectAtIndex:i] integerValue];
        [_url appendFormat:@"%d", productID];
        if (i != [self.products count]-1) {
            [_url appendString:@";"];
        }
    }
    [_url appendFormat:@"/%@/", self.granularity];

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    if (self.dateRange) {
        [_url appendFormat:@"%@/%@/", [formatter stringFromDate:self.dateRange.from], [formatter stringFromDate:self.dateRange.to]];
    } else {
        NSString *todaysDate = [formatter stringFromDate:[NSDate date]];
        [_url appendFormat:@"%@/%@/", todaysDate, todaysDate];
    }
    
    if ([self.countries count] > 0 || self.filter > 0) {
        [_url appendString:@"?"];
        
        if ([self.countries count] > 0) {
            [_url appendString:@"countries="];
            for (NSInteger i = 0; i < [self.countries count]; i++) {
                NSInteger isoID = [[self.countries objectAtIndex:i] integerValue];
                [_url appendFormat:@"%d", isoID];
                if (i != [self.countries count]-1) {
                    [_url appendString:@";"];
                }
            }
            if (self.filter > 0) {
                [_url appendString:@"&"];
            }
        }
        
        if (self.filter > 0) {
            [_url appendFormat:@"filter=%d", self.filter];
        }
    }
    
    self.URL = [NSURL URLWithString:_url];
    
    [super commitTransaction];
}

- (void)request:(APRequest *)request didCompleteWithResults:(NSDictionary *)results
{
    NSMutableDictionary *newDict = [[NSMutableDictionary alloc] initWithDictionary:results];
    for (NSString *key in newDict) {
        [newDict setObject:[[APRankData alloc] initWithResponse:[results objectForKey:key]] forKey:key];
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
