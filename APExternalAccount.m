//
//  APExternalAccount.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-05.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "APExternalAccount.h"

NSString * const APExternalAccountTypeITC = @"itunes_connect";
NSString * const APExternalAccountTypeAndroidMarket = @"android_market";
NSString * const APExternalAccountTypeGoogleCheckout = @"google_checkout";

@interface APExternalAccount ()
@property (nonatomic, strong) NSDictionary *data;
@end

@implementation APExternalAccount
@synthesize data;

- (id)initWithResponse:(NSDictionary *)response
{
    if ((self = [super init])) {
        self.data = response;
    }
    return self;
}

- (NSUInteger)appFiguresID
{
    return [[self.data objectForKey:@"id"] unsignedIntegerValue];
}

- (NSUInteger)accountID
{
    return [[self.data objectForKey:@"account_id"] unsignedIntegerValue];
}

- (NSString *)nickname
{
    return [self.data objectForKey:@"nickname"];
}

- (NSString *)username
{
    return [self.data objectForKey:@"username"];
}

- (BOOL)autoImports
{
    return [[self.data objectForKey:@"auto_imports"] boolValue];
}

- (BOOL)hasiAds
{
    return [[self.data objectForKey:@"has_iads"] boolValue];
}

- (NSUInteger)typeID
{
    return [[self.data objectForKey:@"type_id"] unsignedIntegerValue];
}

- (APExternalAccountType)type
{
    return [self.data objectForKey:@"type"];
}

@end
