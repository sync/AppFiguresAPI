//
//  APExternalAccountTransaction.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-05.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "APExternalAccountTransaction.h"

NSString * const APExternalAccountTransactionTypeAll = @"";
NSString * const APExternalAccountTransactionTypeLookup = @"GET";
NSString * const APExternalAccountTransactionTypeCreate = @"POST";
NSString * const APExternalAccountTransactionTypeUpdate = @"PUT";
NSString * const APExternalAccountTransactionTypeDelete = @"DELETE";

@implementation APExternalAccountTransaction
@synthesize transactionCompleted;
@synthesize transactionType;
@synthesize accountID;
@synthesize nickname;
@synthesize auth;
@synthesize autoImport;
@synthesize type = _type;

- (void)beginTransaction
{
    [self beginTransactionWithType:APExternalAccountTransactionTypeAll];
}

- (void)beginTransactionWithType:(APExternalAccountTransactionType)type
{
    [super beginTransactionWithURL:nil method:([type length] > 0 ? type : APHTTPMethodGet)];
    self.transactionType = type;
    self.request.delegate = self;
}

- (void)commitTransaction
{
    //
    // GET /external_accounts
    // GET /external_accounts/{external_account_id}
    // POST /external_accounts
    // PUT /external_accounts/{external_account_id}
    // DELETE /external_account/{accountId} (success=204)
    //
    
    NSMutableString *_url = [[NSMutableString alloc] initWithString:@"external_accounts/"];
    if ([self.transactionType isEqualToString:APExternalAccountTransactionTypeLookup]) {
        [_url appendFormat:@"%d/", self.accountID];
    } else if ([self.transactionType isEqualToString:APExternalAccountTransactionTypeCreate] ||
               [self.transactionType isEqualToString:APExternalAccountTransactionTypeUpdate]) {
        
        NSMutableDictionary *_data = [[NSMutableDictionary alloc] init];
        
        if ([self.transactionType isEqualToString:APExternalAccountTransactionTypeCreate]) {
            [_data setObject:self.type forKey:@"type"];
        } else {
            [_data setObject:[NSNumber numberWithUnsignedInteger:self.accountID] forKey:@"accountId"];
        }
        [_data setObject:self.nickname forKey:@"nickname"];
        [_data setObject:self.auth.username forKey:@"username"];
        [_data setObject:self.auth.password forKey:@"password"];
        [_data setObject:[NSNumber numberWithBool:self.autoImport] forKey:@"auto_import"];
        
        self.request.arguments = _data;
    }
    
    self.URL = [NSURL URLWithString:_url];
    
    [super commitTransaction];
}

- (void)request:(APRequest *)request didCompleteWithResults:(NSDictionary *)results
{
    NSMutableArray *_accounts = [[NSMutableArray alloc] init];
    if ([self.transactionType isEqualToString:APExternalAccountTransactionTypeDelete]) {
        [_accounts addObject:[NSNumber numberWithBool:self.request.response.statusCode == 204]];
    } else {
        if ([self.transactionType isEqualToString:APExternalAccountTransactionTypeAll]) {
            for (NSString *key in results) {
                [_accounts addObject:[[APExternalAccount alloc] initWithResponse:[results objectForKey:key]]];
            }
        } else {
            [_accounts addObject:[[APExternalAccount alloc] initWithResponse:results]];
        }
    }
    
    if (self.transactionCompleted) {
        self.transactionCompleted(self, _accounts);
    }
}

- (void)request:(APRequest *)request didFailWithError:(NSError *)error
{
    if (self.transactionFailed) {
        self.transactionFailed(self, error);
    }
}

@end
