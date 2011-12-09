//
//  APTransaction.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-29.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APRequest.h"

@class APTransaction;

typedef void (^APTransactionFailed)(APTransaction *transaction, NSError *error);

@interface APTransaction : NSObject
@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSURL *URL;
@property (nonatomic, copy) APHTTPMethod method;
@property (nonatomic, strong) APRequest *request;
@property (nonatomic, strong) APAuthentication *auth; 
@property (nonatomic, copy) APTransactionFailed transactionFailed;

+ (APTransaction *)transactionWithURL:(NSURL *)URL method:(APHTTPMethod)method;
- (void)beginTransactionWithURL:(NSURL *)URL method:(APHTTPMethod)method;
- (void)commitTransaction;

@end
