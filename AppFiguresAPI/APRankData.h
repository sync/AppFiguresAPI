//
//  APRankData.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-29.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APRankData : NSObject

- (id)initWithResponse:(NSDictionary *)response;

@property (readonly) NSUInteger productID;
@property (readonly) NSUInteger countryID;
@property (readonly) NSUInteger categoryID;
@property (readonly) NSString *subcategory;
@property (readonly) NSUInteger rankPosition;
@property (readonly) NSInteger delta;

@end
