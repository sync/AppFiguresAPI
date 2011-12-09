//
//  APProduct.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-29.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    APProductTypeApp = 0,
    APProductTypeInApp,
    APProductTypeBook
};
typedef NSUInteger APProductType;

@interface APProduct : NSObject
- (id)initWithResponse:(NSDictionary *)response;

@property (readonly) NSArray *inAppIDs;
@property (readonly) APProductType type;
@property (readonly) NSString *timestamp;
@property (readonly) NSString *name;
@property (readonly) NSUInteger productID;
@property (readonly) NSURL *iconURL;
@property (readonly) BOOL active;
@property (readonly) BOOL hidden;
@property (readonly) NSString *sku;
@property (readonly) NSUInteger storeID;
@property (readonly) NSString *storeName;
@property (readonly) NSInteger refNumber;
@property (readonly) NSArray *addOns;

@end
