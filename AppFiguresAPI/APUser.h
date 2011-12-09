//
//  APUser.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-05.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APAccount.h"
#import "APProduct.h"

@interface APUser : NSObject

- (id)initWithResponse:(NSDictionary *)response;

@property (readonly) NSString *currency;
@property (readonly) NSString *region;
@property (readonly) BOOL isOwner;
@property (readonly) float shareOfProfit;
@property (readonly) NSString *lastLogin;
@property (readonly) NSString *timezone;
@property (readonly) APAccount *account;
@property (readonly) NSUInteger userID;
@property (readonly) NSString *role;
@property (readonly) NSString *name;
@property (readonly) NSString *email;
@property (readonly) NSArray *products;
@property (readonly) NSString *dateFormat;

@end
