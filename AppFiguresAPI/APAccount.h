//
//  APAccount.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-05.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const APAccountPlanTypeFree;
extern NSString * const APAccountPlanTypePremium;
extern NSString * const APAccountPlanTypePublisher;

typedef NSString * APAccountPlanType;

@interface APAccount : NSObject

- (id)initWithResponse:(NSDictionary *)response;

@property (readonly) NSUInteger accountID;
@property (readonly) NSString *companyName;
@property (readonly) NSString *autoImport;
@property (readonly) NSString *lastImport;
@property (readonly) APAccountPlanType plan;

@end
