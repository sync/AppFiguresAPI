//
//  APDateRange.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-29.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APDateRange : NSObject
@property (nonatomic, strong) NSDate *from;
@property (nonatomic, strong) NSDate *to;

+ (APDateRange *)dateRangeFrom:(NSDate *)from to:(NSDate *)to;
- (id)initWithDateFrom:(NSDate *)from to:(NSDate *)to;
@end
