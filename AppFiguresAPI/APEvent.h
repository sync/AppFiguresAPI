//
//  APEvent.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-05.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APEvent : NSObject

- (id)initWithResponse:(NSDictionary *)response;

@property (readonly) NSUInteger eventID;
@property (readonly) NSUInteger accountID;
@property (readonly) NSString *caption;
@property (readonly) NSString *date;
@property (readonly) NSString *origin;
@property (readonly) NSArray *productIDs;

@end
