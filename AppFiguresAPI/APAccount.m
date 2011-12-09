//
//  APAccount.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-05.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import "APAccount.h"

NSString * const APAccountPlanTypeFree = @"free";
NSString * const APAccountPlanTypePremium = @"premium";
NSString * const APAccountPlanTypePublisher = @"publisher";

@interface APAccount ()
@property (nonatomic, strong) NSDictionary *data;
@end

@implementation APAccount
@synthesize data;

- (id)initWithResponse:(NSDictionary *)response
{
    if ((self = [super init])) {
        self.data = response;
    }
    return self;
}

- (NSUInteger)accountID
{
    return [[self.data objectForKey:@"id"] unsignedIntegerValue];
}

- (NSString *)companyName
{
    return [self.data objectForKey:@"company"];
}

- (NSString *)autoImport
{
    return [self.data objectForKey:@"auto_import"];
}

- (NSString *)lastImport
{
    return [self.data objectForKey:@"last_import"];
}

- (APAccountPlanType)plan
{
    return [self.data objectForKey:@"plan"];
}

@end
