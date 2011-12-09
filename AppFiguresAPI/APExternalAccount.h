//
//  APExternalAccount.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-05.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const APExternalAccountTypeITC;
extern NSString * const APExternalAccountTypeAndroidMarket;
extern NSString * const APExternalAccountTypeGoogleCheckout;

typedef NSString * APExternalAccountType;

@interface APExternalAccount : NSObject
- (id)initWithResponse:(NSDictionary *)response;

@property (readonly) NSUInteger appFiguresID;
@property (readonly) NSUInteger accountID;
@property (readonly) NSString *nickname;
@property (readonly) NSString *username;
@property (readonly) BOOL autoImports;
@property (readonly) BOOL hasiAds;
@property (readonly) NSUInteger typeID;
@property (readonly) APExternalAccountType type;

@end
