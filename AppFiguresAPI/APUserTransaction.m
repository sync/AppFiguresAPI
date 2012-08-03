//
//  APUserTransaction.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-05.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import "APUserTransaction.h"

NSString * const APUserTransactionTypeDefault = @"";
NSString * const APUserTransactionTypeProducts = @"products";
NSString * const APUserTransactionTypeExternalAccounts = @"external_accounts";

@implementation APUserTransaction

- (void)beginTransaction
{
    [self beginTransactionWithType:APUserTransactionTypeDefault];
}

- (void)beginTransactionWithType:(APUserTransactionType)type
{
    [super beginTransactionWithURL:nil method:APHTTPMethodGet];
    self.transactionType = type;
    self.request.delegate = self;
}

- (void)commitTransaction
{
    //
    // GET /users/{email}
    // GET /users/{email}/products
    // GET /users/{email}/external_accounts
    //
    
    NSMutableString *_url = [[NSMutableString alloc] initWithString:@"users/"];
    [_url appendFormat:@"%@/", self.email];
    [_url appendFormat:@"%@", self.transactionType];
    
    self.URL = [NSURL URLWithString:_url];
    
    [self commitTransaction];
}

- (void)request:(APRequest *)request didCompleteWithResults:(NSDictionary *)results
{
    NSMutableArray *_results = [[NSMutableArray alloc] init];
    if ([self.transactionType isEqualToString:APUserTransactionTypeDefault]) {
        [_results addObject:[[APUser alloc] initWithResponse:results]];
    } else if ([self.transactionType isEqualToString:APUserTransactionTypeExternalAccounts]) {
        for (NSString *key in results) {
            [_results addObject:[[APExternalAccount alloc] initWithResponse:[results objectForKey:key]]];
        }
    } else {
        for (NSString *key in results) {
            [_results addObject:[[APProduct alloc] initWithResponse:[results objectForKey:key]]];          
        }
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
