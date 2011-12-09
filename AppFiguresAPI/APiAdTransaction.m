//
//  APiAdTransaction.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-04.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "APiAdTransaction.h"

@implementation APiAdTransaction
@synthesize type;
@synthesize dateRange;
@synthesize products;
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
}

- (void)commitTransaction
{
    //
    // GET /iads/{type}/{startDate}/{endDate}?products={productIds}
    //
    
    NSMutableString *_url = [[NSMutableString alloc] initWithString:@"iads/"];
    [_url appendFormat:@"%@/", self.type];
    
    if (self.dateRange) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        [_url appendFormat:@"%@/%@/", [formatter stringFromDate:self.dateRange.from], [formatter stringFromDate:self.dateRange.to]];
    } else {
        // We have a problem. For now just add today.
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSString *todaysDate = [formatter stringFromDate:[NSDate date]];
        [_url appendFormat:@"%@/%@/", todaysDate, todaysDate];
    }
    
    if ([self.products count] > 0) {
        [_url appendString:@"?products="];
        for (NSInteger i = 0; i < [self.products count]; i++) {
            [_url appendFormat:@"%d", [[self.products objectAtIndex:i] integerValue]];
            if (i != [self.products count]-1) {
                [_url appendString:@";"];
            }
        }
    }

    self.URL = [NSURL URLWithString:_url];
    
    [super commitTransaction];
}

- (void)request:(APRequest *)request didCompleteWithResults:(NSDictionary *)results
{
    NSMutableDictionary *_results = [[NSMutableDictionary alloc] initWithDictionary:results];
    for (NSString *key in results) {
        [_results setObject:[[APiAdReport alloc] initWithResponse:[results objectForKey:key]] forKey:key];
    }
    
    if (self.transactionCompleted) {
        self.transactionCompleted(self, _results);
    }
}

- (void)request:(APRequest *)request didFailWithError:(NSError *)error
{
    if (self.transactionFailed) {
        self.transactionFailed(self, error);
    }
}

@end
