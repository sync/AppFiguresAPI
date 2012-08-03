//
//  APTransaction.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-29.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import "APTransaction.h"
#import "APRequest.h"
#import "APConstants.h"

@implementation APTransaction

+ (APTransaction *)transactionWithURL:(NSURL *)URL method:(APHTTPMethod)method
{
    APTransaction *_transaction = [[APTransaction alloc] init];
    [_transaction beginTransactionWithURL:URL method:method];
    return _transaction;
}

- (void)beginTransactionWithURL:(NSURL *)URL method:(APHTTPMethod)method
{
    self.URL = URL;
    self.method = method;
    self.request = [[APRequest alloc] initWithURL:URL method:method];
}

- (void)commitTransaction
{
    self.request.auth = self.auth;
    self.connection = [self.request start];
}

- (void)setURL:(NSURL *)URL
{
    _URL = URL;
    NSString *urlString = [_URL absoluteString];
    if (![urlString hasPrefix:kAPBaseURL]) {
        NSString *newURL = [NSString stringWithFormat:@"%@%@", kAPBaseURL, urlString];
        _URL = [NSURL URLWithString:newURL];
    }
}

@end
