//
//  APAuthentication.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-29.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APAuthentication : NSObject
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;

+ (APAuthentication *)authWithUsername:(NSString *)username password:(NSString *)password;
- (id)initWithUsername:(NSString *)username password:(NSString *)password;

@end
