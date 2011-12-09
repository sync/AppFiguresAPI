//
//  APEventTransaction.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-05.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import "APTransaction.h"
#import "APEvent.h"

@class APEventTransaction;

extern NSString * const APEventTransactionTypeGet;
extern NSString * const APEventTransactionTypeCreate;
extern NSString * const APEventTransactionTypeUpdate;
extern NSString * const APEventTransactionTypeDelete;

typedef NSString * APEventTransactionType;

typedef void (^APEventTransactionCompleted)(APEventTransaction *transaction, NSArray *events);

@interface APEventTransaction : APTransaction <APRequestDelegate>

- (void)beginTransactionWithType:(APEventTransactionType)type;

@property (nonatomic, copy) APEventTransactionCompleted transactionCompleted;
@property (nonatomic, copy) APEventTransactionType transactionType;

// Delete and Update
@property (nonatomic, assign) NSUInteger eventID;

// Create and Update
@property (nonatomic, copy) NSString *caption;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSArray *productIDs;

@end
