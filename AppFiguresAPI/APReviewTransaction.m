//
//  APReviewTransaction.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-04.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import "APReviewTransaction.h"

NSString * const APFetchReviewsCountryMajor = @"major";
NSString * const APFetchReviewsCountryMinor = @"minor";
NSString * const APFetchReviewsCountryList = @"use_list";

@implementation APReviewTransaction

- (id)init
{
    if  ((self = [super init])) {
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
    // GET /reviews/{productId}/{countries}/{page}/?language={language}
    //
    
    NSMutableString *_url = [[NSMutableString alloc] initWithString:@"reviews/"];
    [_url appendFormat:@"%d/", self.productID];
    
    if ([self.countryFetchType isEqualToString:APFetchReviewsCountryList]) {
        for (NSInteger i = 0; i < [self.countryList count]; i++) {
            [_url appendFormat:@"%@", [self.countryList objectAtIndex:i]];
            if (i != [self.countryList count]-1) {
                [_url appendString:@";"];
            }
        }
    } else {
        [_url appendFormat:@"%@/", self.countryFetchType];
    }
    
    [_url appendFormat:@"%d/", self.pageNumber];
    
    if ([self.language length] != 0) {
        // Probably should cross-reference supported languages?
        [_url appendFormat:@"?language=%@", self.language];
    }
    
    self.URL = [NSURL URLWithString:_url];
    
    [super commitTransaction];
}

- (void)request:(APRequest *)request didCompleteWithResults:(NSDictionary *)results
{
    NSMutableArray *_results = [[NSMutableArray alloc] init];
    for (NSString *countryKey in results) {
        [_results addObject:[[APStoreRating alloc] initWithResponse:[results objectForKey:countryKey]]];
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
