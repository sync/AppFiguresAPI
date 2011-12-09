//
//  APExternalAccountTransaction.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-05.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import "APTransaction.h"
#import "APExternalAccount.h"
#import "APAuthentication.h"

@class APExternalAccountTransaction;

extern NSString * const APExternalAccountTransactionTypeAll;
extern NSString * const APExternalAccountTransactionTypeLookup;
extern NSString * const APExternalAccountTransactionTypeCreate;
extern NSString * const APExternalAccountTransactionTypeUpdate;
extern NSString * const APExternalAccountTransactionTypeDelete;

typedef NSString * APExternalAccountTransactionType;
typedef void (^APExternalAccountTransactionCompleted)(APExternalAccountTransaction *transaction, NSArray *accounts);

@interface APExternalAccountTransaction : APTransaction <APRequestDelegate>

- (void)beginTransaction;
- (void)beginTransactionWithType:(APExternalAccountTransactionType)type;

@property (nonatomic, copy) APExternalAccountTransactionCompleted transactionCompleted;
@property (nonatomic, copy) APExternalAccountTransactionType transactionType;

// Lookup & Update
@property (nonatomic, assign) NSUInteger accountID;

// Create & Update
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, strong) APAuthentication *auth;
@property (nonatomic, assign) BOOL autoImport;

// Just Create
@property (nonatomic, copy) APExternalAccountType type;

@end
