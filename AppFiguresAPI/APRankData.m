//
//  APRankData.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-29.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import "APRankData.h"

@interface APRankData ()
@property (nonatomic, strong) NSArray *data;
@end

@implementation APRankData
@synthesize data;

- (id)initWithResponse:(NSArray *)response
{
    if ((self = [super init])) {
        self.data = response;
    }
    return self;
}

- (NSUInteger)productID
{
    return [[self.data objectAtIndex:0] unsignedIntegerValue];
}

- (NSUInteger)countryID
{
    return [[self.data objectAtIndex:1] unsignedIntegerValue];
}

- (NSUInteger)categoryID
{
    return [[self.data objectAtIndex:2] unsignedIntegerValue];
}

- (NSString *)subcategory
{
    return [self.data objectAtIndex:3];
}

- (NSUInteger)rankPosition
{
    return [[self.data objectAtIndex:4] unsignedIntegerValue];
}

- (NSInteger)delta
{
    return [[self.data objectAtIndex:5] integerValue];
}

@end
