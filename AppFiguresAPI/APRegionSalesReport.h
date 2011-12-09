//
//  APRegionSalesReport.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-29.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APRegionSalesReport : NSObject

- (id)initWithResponse:(NSDictionary *)response;

@property (readonly) NSUInteger regionID;
@property (readonly) NSString *regionName;
@property (readonly) NSString *currency;
@property (readonly) NSUInteger returns;
@property (readonly) NSUInteger units;
@property (readonly) NSString *convertedRevenue;
@property (readonly) NSString *baseRevenue;

@end
