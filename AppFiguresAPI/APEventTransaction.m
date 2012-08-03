//
//  APEventTransaction.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-05.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import "APEventTransaction.h"

NSString * const APEventTransactionTypeGet = @"GET";
NSString * const APEventTransactionTypeCreate = @"POST";
NSString * const APEventTransactionTypeUpdate = @"PUT";
NSString * const APEventTransactionTypeDelete = @"DELETE";

@implementation APEventTransaction

- (void)beginTransactionWithType:(APEventTransactionType)type
{
    [super beginTransactionWithURL:nil method:type];
    self.request.delegate = self;
    self.transactionType = type;
}

- (void)setTransactionType:(APEventTransactionType)newTransactionType
{
    _transactionType = [newTransactionType copy];
    self.request.method = _transactionType;
}

- (void)commitTransaction
{
    //
    // GET /events/
    // POST /events/ -> { caption, date, products }
    // PUT /events/  -> { event_id, caption, date, products }
    // DELETE /events/{eventId}
    //
    
    NSMutableString *_url = [[NSMutableString alloc] initWithString:@"events/"];
    
    if ([self.transactionType isEqualToString:APEventTransactionTypeDelete]) {
        [_url appendFormat:@"%d/", self.eventID];
    } else if ([self.transactionType isEqualToString:APEventTransactionTypeCreate] || 
               [self.transactionType isEqualToString:APEventTransactionTypeUpdate]) {
        NSMutableDictionary *_data = [[NSMutableDictionary alloc] init];
        [_data setObject:self.caption forKey:@"caption"];
        [_data setObject:self.date forKey:@"date"];

//      If this API doesn't use JSON data
//        NSMutableString *_productIDs = [[NSMutableString alloc] init];
//        for (NSInteger i = 0; i < [self.productIDs count]; i++) {
//            [_productIDs appendFormat:@"%d", [[self.productIDs objectAtIndex:i] unsignedIntegerValue]];
//            if (i != [self.productIDs count]-1) {
//                [_productIDs appendString:@","];
//            }
//        }
//        
        [_data setObject:self.productIDs forKey:@"products"];
        
        if ([self.transactionType isEqualToString:APEventTransactionTypeUpdate]) {
            [_data setObject:[NSNumber numberWithUnsignedInteger:self.eventID] forKey:@"eventId"];
        }
        
        self.request.arguments = _data;
    }
    
    self.URL = [NSURL URLWithString:_url];
    
    [super commitTransaction];
}

- (void)request:(APRequest *)request didCompleteWithResults:(NSDictionary *)results
{
    NSMutableArray *_events = [[NSMutableArray alloc] init];
    if ([self.transactionType isEqualToString:APEventTransactionTypeDelete]) {
        [_events addObject:[NSNumber numberWithBool:self.request.response.statusCode == 200]];
    } else {
        for (NSString *eventKey in results) {
            [_events addObject:[[APEvent alloc] initWithResponse:[results objectForKey:eventKey]]];
        }
    }
    
    if (self.transactionCompleted) {
        self.transactionCompleted(self, _events);
    }
}

- (void)request:(APRequest *)request didFailWithError:(NSError *)error
{
    if (self.transactionFailed) {
        self.transactionFailed(self, error);
    }
}

@end
