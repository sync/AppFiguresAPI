//
//  APStoreRating.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-04.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import "APStoreRating.h"

@interface APStoreRating ()
@property (nonatomic, strong) NSDictionary *data;
@property (nonatomic, strong) NSMutableArray *cachedReviews;
@end

@implementation APStoreRating

- (id)initWithResponse:(NSDictionary *)response
{
    if ((self = [super init])) {
        self.data = response;
    }
    return self;
}

- (NSUInteger)storeID
{
    return [[self.data objectForKey:@"store_id"] unsignedIntegerValue];
}

- (NSString *)country
{
    return [self.data objectForKey:@"country"];
}

- (NSString *)countryISO
{
    return [self.data objectForKey:@"iso_country"];
}

- (NSUInteger)numberOfRatingsForAllVersions
{
    return [[self.data objectForKey:@"all_ratings"] unsignedIntegerValue];
}

- (NSUInteger)numberOfRatings
{
    return [[self.data objectForKey:@"ratings"] unsignedIntegerValue];
}

- (NSUInteger)numberOfStarsForAllVersions
{
    return [[self.data objectForKey:@"all_stars"] unsignedIntegerValue];
}

- (float)averageRating
{
    return [[self.data objectForKey:@"stars"] floatValue];
}

- (NSUInteger)numberOfPages
{
    return [[self.data objectForKey:@"num_pages"] unsignedIntegerValue];
}

- (NSUInteger)numberOfReviews
{
    return [[self.data objectForKey:@"num_reviews"] unsignedIntegerValue];
}

- (NSString *)version
{
    return [self.data objectForKey:@"version"];
}

- (NSArray *)starsForAllVersions
{
    return [((NSString *)[self.data objectForKey:@"all_star_breakdown"]) componentsSeparatedByString:@","];
}

- (NSArray *)stars
{
    return [((NSString *)[self.data objectForKey:@"star_breakdown"]) componentsSeparatedByString:@","];
}

- (NSArray *)reviews
{
    if (!self.cachedReviews) {
        self.cachedReviews = [[NSMutableArray alloc] init];
        
        NSArray *_reviews = [self.data objectForKey:@"reviews"];
        for (NSDictionary *aReview in _reviews) {
            [self.cachedReviews addObject:[[APReview alloc] initWithResponse:aReview]];
        }
    }
    return self.cachedReviews;
}

@end
