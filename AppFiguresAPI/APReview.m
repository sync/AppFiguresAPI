//
//  APReview.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-04.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import "APReview.h"

@interface APReview ()
@property (nonatomic, strong) NSDictionary *data;
@end

@implementation APReview

- (id)initWithResponse:(NSDictionary *)response
{
    if ((self = [super init])) {
        self.data = response;
    }
    return self;
}

- (NSUInteger)reviewID
{
    return [[self.data objectForKey:@"id"] unsignedIntegerValue];
}

- (NSString *)title
{
    return [self.data objectForKey:@"title"];
}

- (NSString *)review
{
    return [self.data objectForKey:@"review"];
}

- (NSString *)originalTitle
{
    return [self.data objectForKey:@"original_title"];
}

- (NSString *)originalReview
{
    return [self.data objectForKey:@"original_review"];
}

- (NSString *)author
{
    return [self.data objectForKey:@"author"];
}

- (NSString *)version
{
    return [self.data objectForKey:@"version"];
}

- (NSString *)date
{
    return [self.data objectForKey:@"date"];
}

- (NSUInteger)stars
{
    return [[self.data objectForKey:@"stars"] unsignedIntegerValue];
}

- (NSString *)type
{
    return [self.data objectForKey:@"type"];
}

- (NSString *)reviewType
{
    return [self.data objectForKey:@"review_type"];
}

- (NSString *)countryISO
{
    return [self.data objectForKey:@"iso"];
}

- (NSString *)country
{
    return [self.data objectForKey:@"country"];
}

@end
