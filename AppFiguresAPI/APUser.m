//
//  APUser.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-05.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "APUser.h"

@interface APUser ()
@property (nonatomic, strong) NSDictionary *data;
@property (nonatomic, strong) APAccount *cachedAccount;
@property (nonatomic, strong) NSMutableArray *cachedProducts;
@end

@implementation APUser
@synthesize data;
@synthesize cachedAccount;
@synthesize cachedProducts;

- (id)initWithResponse:(NSDictionary *)response
{
    if ((self = [super init])) {
        self.data = response;
    }
    return self;
}

- (NSString *)currency
{
    return [self.data objectForKey:@"currency"];
}

- (NSString *)region
{
    return [self.data objectForKey:@"region"];
}

- (BOOL)isOwner
{
    return [[self.data objectForKey:@"is_owner"] boolValue];
}

- (float)shareOfProfit
{
    return [[self.data objectForKey:@"share_of_profit"] floatValue];
}

- (NSString *)lastLogin
{
    return [self.data objectForKey:@"last_login"];
}

- (NSString *)timezone
{
    return [self.data objectForKey:@"timezone"];
}

- (APAccount *)account
{
    if (!self.cachedAccount) {
        self.cachedAccount = [[APAccount alloc] initWithResponse:[self.data objectForKey:@"account"]];
    }
    return self.cachedAccount;
}

- (NSUInteger)userID
{
    return [[self.data objectForKey:@"id"] unsignedIntegerValue];
}

- (NSString *)role
{
    return [self.data objectForKey:@"role"];
}

- (NSString *)name
{
    return [self.data objectForKey:@"name"];
}

- (NSString *)email
{
    return [self.data objectForKey:@"email"];
}

- (NSArray *)products
{
    if (!self.cachedProducts) {
        self.cachedProducts = [[NSMutableArray alloc] init];
        for (NSDictionary *product in [self.data objectForKey:@"products"]) {
            [self.cachedProducts addObject:[[APProduct alloc] initWithResponse:product]];
        }
    }
    return self.cachedProducts;
}

- (NSString *)dateFormat
{
    return [self.data objectForKey:@"date_format"];
}

@end
