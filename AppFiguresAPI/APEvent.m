//
//  APEvent.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-05.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import "APEvent.h"

@interface APEvent ()
@property (nonatomic, strong) NSDictionary *data;
@end

@implementation APEvent
@synthesize data;

- (id)initWithResponse:(NSDictionary *)response
{
    if ((self = [super init])) {
        self.data = response;
    }
    return self;
}

- (NSUInteger)eventID
{
    return [[self.data objectForKey:@"id"] unsignedIntegerValue];
}

- (NSUInteger)accountID
{
    return [[self.data objectForKey:@"account_id"] unsignedIntegerValue];
}

- (NSString *)caption
{
    return [self.data objectForKey:@"caption"];
}

- (NSString *)date
{
    return [self.data objectForKey:@"date"];
}

- (NSString *)origin
{
    return [self.data objectForKey:@"origin"];
}

- (NSArray *)productIDs
{
    return [self.data objectForKey:@"products"];
}

@end
