//
//  APDateRange.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-29.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import "APDateRange.h"

@implementation APDateRange
@synthesize from;
@synthesize to;

+ (APDateRange *)dateRangeFrom:(NSDate *)from to:(NSDate *)to
{
    return [[APDateRange alloc] initWithDateFrom:from to:to];
}

- (id)initWithDateFrom:(NSDate *)from to:(NSDate *)to
{
    if ((self = [super init])) {
        
    }
    return self;
}

@end
