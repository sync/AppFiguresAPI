//
//  APRankTransaction.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-30.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APTransaction.h"

@class APRankTransaction;
@class APDateRange;

extern NSString * const APRankGranularityDaily;
extern NSString * const APRankGranularityHourly;

typedef NSString * APRankGranularity;
typedef void (^APRankTransactionCompleted)(APRankTransaction *transaction, NSDictionary *results);

@interface APRankTransaction : APTransaction <APRequestDelegate>
@property (nonatomic, strong) NSArray *products;
@property (nonatomic, copy) APRankGranularity granularity;
@property (nonatomic, strong) APDateRange *dateRange;
@property (nonatomic, copy) NSArray *countries;
@property (nonatomic, assign) NSInteger filter;
@property (nonatomic, copy) APRankTransactionCompleted transactionCompleted;

- (void)beginTransaction;

@end
