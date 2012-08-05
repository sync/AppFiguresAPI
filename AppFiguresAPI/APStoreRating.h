//
//  APStoreRating.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-04.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APReview.h"

@interface APStoreRating : NSObject
- (id)initWithResponse:(NSDictionary *)response;

@property (readonly) NSUInteger storeID;
@property (readonly) NSString *country;
@property (readonly) NSString *countryISO;
@property (readonly) NSUInteger numberOfRatingsForAllVersions;
@property (readonly) NSUInteger numberOfRatings;
@property (readonly) NSUInteger numberOfStarsForAllVersions;
@property (readonly) float averageRating;
@property (readonly) NSUInteger numberOfPages;
@property (readonly) NSUInteger numberOfReviews;
@property (readonly) NSString *version;
@property (readonly) NSArray *starsForAllVersions;
@property (readonly) NSArray *stars;
@property (readonly) NSArray *reviews;

@end
