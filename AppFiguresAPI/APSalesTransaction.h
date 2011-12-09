//
//  APSalesTransaction.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-29.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APTransaction.h"
#import "APSalesReport.h"

@class APSalesTransaction;
@class APDateRange;

typedef void (^APSalesTransactionCompleted)(APSalesTransaction *transaction, NSDictionary *results);

@interface APSalesTransaction : APTransaction <APRequestDelegate>
@property (nonatomic, copy) APSalesDataSource dataSource;
@property (nonatomic, copy) APSalesType type;
@property (nonatomic, strong) APDateRange *dateRange;
@property (nonatomic, strong) NSArray *products;
@property (nonatomic, strong) NSString *countryISO;

@property (nonatomic, copy) APSalesTransactionCompleted transactionCompleted;

- (void)beginTransaction;

@end
