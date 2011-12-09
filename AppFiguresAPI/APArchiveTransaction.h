//
//  APArchiveTransaction.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-04.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "APTransaction.h"
#import "APArchive.h"

@class APArchiveTransaction;

extern NSString * const APArchiveTransactionTypeDefault;
extern NSString * const APArchiveTransactionTypeLatest;
extern NSString * const APArchiveTransactionTypeDate;
extern NSString * const APArchiveTransactionTypeRaw;

typedef NSString * APArchiveTransactionType;

typedef void (^APArchiveTransactionCompleted)(APArchiveTransaction *transaction, NSArray *archives);

@interface APArchiveTransaction : APTransaction <APRequestDelegate>

- (void)beginTransaction;
- (void)beginTransactionWithType:(APArchiveTransactionType)type;

@property (nonatomic, copy) APArchiveTransactionCompleted transactionCompleted;
@property (nonatomic, copy) APArchiveTransactionType transactionType;

// All types but APArchiveTransactionTypeRaw
@property (nonatomic, copy) APArchiveType archiveType;

// APArchiveTransactionTypeDate
@property (nonatomic, strong) NSDate *date;

// APArchiveTransactionTypeRaw
@property (nonatomic, assign) NSUInteger archiveID;

@end
