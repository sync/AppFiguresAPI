//
//  AppFiguresAPI.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-29.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APConstants.h"
#import "APDateRange.h"
#import "APSalesReport.h"
#import "APAuthentication.h"

#import "APSalesTransaction.h"
#import "APRankTransaction.h"
#import "APReviewTransaction.h"
#import "APExternalAccountTransaction.h"
#import "APiAdTransaction.h"
#import "APArchiveTransaction.h"
#import "APEventTransaction.h"
#import "APUserTransaction.h"

typedef void (^APSalesForTypeCompleted)(NSDictionary *results);

@interface AppFiguresAPI : NSObject

@property (nonatomic, strong) APAuthentication *auth;

+ (AppFiguresAPI *)engine;
+ (AppFiguresAPI *)engineWithUsername:(NSString *)username password:(NSString *)password;
- (id)initWithUsername:(NSString *)username password:(NSString *)password;

#pragma mark - Sales

- (APSalesTransaction *)beginSalesTransaction;

#pragma mark - Ranks

- (APRankTransaction *)beginRankTransaction;

#pragma mark - Reviews

- (APReviewTransaction *)beginReviewTransaction;

#pragma mark - iAds

- (APiAdTransaction *)beginiAdTransaction;

#pragma mark - Archive

- (APArchiveTransaction *)beginArchiveTransaction;

#pragma mark - Events

- (APEventTransaction *)beginEventTransaction;

#pragma mark - Users

- (APUserTransaction *)beginUserTransaction;

@end
