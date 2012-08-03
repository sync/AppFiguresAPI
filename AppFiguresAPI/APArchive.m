//
//  APArchive.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-04.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import "APArchive.h"

NSString * const APArchiveTypeDaily = @"daily";
NSString * const APArchiveTypeWeekly = @"weekly";
NSString * const APArchiveTypeFinancial = @"financial";
NSString * const APArchiveTypePayment = @"payment";
NSString * const APArchiveTypeAll = @"all";

@interface APArchive ()
@property (nonatomic, strong) NSDictionary *data;
@end

@implementation APArchive

- (id)initWithResponse:(NSDictionary *)response
{
    if ((self = [super init])) {
        self.data = response;
    }
    return self;
}

- (NSUInteger)archiveID
{
    return [[self.data objectForKey:@"id"] unsignedIntegerValue];
}

- (APArchiveType)type
{
    return [self.data objectForKey:@"type"];
}

- (NSUInteger)itcID
{
    return [[self.data objectForKey:@"itc_id"] unsignedIntegerValue];
}

- (NSString *)reportTimestamp
{
    return [self.data objectForKey:@"report_timestamp"];
}

- (NSString *)importTimestamp
{
    return [self.data objectForKey:@"import_timestamp"];
}

- (NSString *)importMethod
{
    return [self.data objectForKey:@"import_method"];
}

- (NSString *)region
{
    return [self.data objectForKey:@"region"];
}

@end
