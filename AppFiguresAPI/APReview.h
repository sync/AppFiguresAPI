//
//  APReview.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-04.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APReview : NSObject
- (id)initWithResponse:(NSDictionary *)response;

@property (readonly) NSUInteger reviewID;
@property (readonly) NSString *title;
@property (readonly) NSString *review;
@property (readonly) NSString *originalTitle;
@property (readonly) NSString *originalReview;
@property (readonly) NSString *author;
@property (readonly) NSString *version;
@property (readonly) NSString *date;
@property (readonly) NSUInteger stars;
@property (readonly) NSString *type;
@property (readonly) NSString *reviewType;
@property (readonly) NSString *countryISO;
@property (readonly) NSString *country;

@end
