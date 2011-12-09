//
//  APUserTransaction.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-05.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "APTransaction.h"
#import "APUser.h"
#import "APAccount.h"
#import "APExternalAccount.h"
#import "APProduct.h"

@class APUserTransaction;

extern NSString * const APUserTransactionTypeDefault;
extern NSString * const APUserTransactionTypeProducts;
extern NSString * const APUserTransactionTypeExternalAccounts;

typedef NSString * APUserTransactionType;

typedef void (^APUserTransactionCompleted)(APUserTransaction *transaction, NSArray *results);

@interface APUserTransaction : APTransaction <APRequestDelegate>

- (void)beginTransaction;
- (void)beginTransactionWithType:(APUserTransactionType)type;

@property (nonatomic, copy) APUserTransactionCompleted transactionCompleted;
@property (nonatomic, copy) APUserTransactionType transactionType;
@property (nonatomic, copy) NSString *email;

@end
