//
//  APAuthentication.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-29.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import "APAuthentication.h"

@implementation APAuthentication

+ (APAuthentication *)authWithUsername:(NSString *)username password:(NSString *)password
{
    return [[APAuthentication alloc] initWithUsername:username password:password];
}

- (id)initWithUsername:(NSString *)username password:(NSString *)password
{
    if ((self = [super init])) {
        self.username = username;
        self.password = password;
    }
    return self;
}

@end
