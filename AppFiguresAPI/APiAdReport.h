//
//  APiAdReport.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-04.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APiAdReport : NSObject

- (id)initWithResponse:(NSDictionary *)response;

@property (readonly) NSString *country;
@property (readonly) NSString *countryISO;
@property (readonly) NSString *timestamp;
@property (readonly) float revenue;
@property (readonly) NSUInteger requests;
@property (readonly) NSUInteger impressions;
@property (readonly) float ECPM;
@property (readonly) float fillRate;
@property (readonly) float clickThroughRate;

@end
