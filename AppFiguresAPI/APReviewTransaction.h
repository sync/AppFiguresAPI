//
//  APReviewTransaction.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-04.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "APTransaction.h"
#import "APStoreRating.h"

@class APReviewTransaction;

extern NSString * const APFetchReviewsCountryMajor;
extern NSString * const APFetchReviewsCountryMinor;
extern NSString * const APFetchReviewsCountryList;

typedef NSString * APFetchReviewsCountry;

typedef void (^APReviewTransactionCompleted)(APReviewTransaction *transaction, NSArray *storeRatings);

@interface APReviewTransaction : APTransaction <APRequestDelegate>

- (void)beginTransaction;

@property (nonatomic, assign) NSUInteger productID;
@property (nonatomic, copy) APFetchReviewsCountry countryFetchType;
@property (nonatomic, strong) NSArray *countryList;
@property (nonatomic, assign) NSUInteger pageNumber;
@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) APReviewTransactionCompleted transactionCompleted;

@end
