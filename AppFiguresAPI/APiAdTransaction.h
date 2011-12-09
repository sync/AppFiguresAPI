//
//  APiAdTransaction.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-04.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "APTransaction.h"
#import "APDateRange.h"
#import "APiAdReport.h"

@class APiAdTransaction;

extern NSString * const APiAdReportTypeDates;
extern NSString * const APiAdReportTypeCountries;

typedef NSString * APiAdReportType;

typedef void (^APiAdTransactionCompleted)(APiAdTransaction *transaction, NSDictionary *results);

@interface APiAdTransaction : APTransaction <APRequestDelegate>

- (void)beginTransaction;

@property (nonatomic, copy) APiAdReportType type;
@property (nonatomic, strong) APDateRange *dateRange;
@property (nonatomic, strong) NSArray *products;
@property (nonatomic, copy) APiAdTransactionCompleted transactionCompleted;

@end
