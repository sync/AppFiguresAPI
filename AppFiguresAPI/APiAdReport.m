//
//  APiAdReport.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-04.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import "APiAdReport.h"

@interface APiAdReport ()
@property (nonatomic, strong) NSDictionary *data;
@end

@implementation APiAdReport

- (id)initWithResponse:(NSDictionary *)response
{
    if ((self = [super init])) {
        self.data = response;
    }
    return self;
}

- (NSString *)country
{
    return [self.data objectForKey:@"country"];
}

- (NSString *)countryISO
{
    return [self.data objectForKey:@"country_iso"];
}

- (NSString *)timestamp
{
    return [self.data objectForKey:@"timestamp"];
}

- (float)revenue
{
    return [[self.data objectForKey:@"revenue"] floatValue];
}

- (NSUInteger)requests
{
    return [[self.data objectForKey:@"requests"] unsignedIntegerValue];
}

- (NSUInteger)impressions
{
    return [[self.data objectForKey:@"impressions"] unsignedIntegerValue];
}

- (float)ECPM
{
    return [[self.data objectForKey:@"ecpm"] floatValue];
}

- (float)fillRate
{
    return [[self.data objectForKey:@"fillrate"] floatValue];
}

- (float)clickThroughRate
{
    return [[self.data objectForKey:@"ctr"] floatValue];
}

@end
