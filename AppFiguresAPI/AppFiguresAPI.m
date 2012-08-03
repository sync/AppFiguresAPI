//
//  AppFiguresAPI.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-29.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import "AppFiguresAPI.h"

@implementation AppFiguresAPI

+ (AppFiguresAPI *)engine
{
    return [self engineWithUsername:nil password:nil];
}

+ (AppFiguresAPI *)engineWithUsername:(NSString *)username password:(NSString *)password
{
    static AppFiguresAPI *_engine = nil;
    if (!_engine) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _engine = [[AppFiguresAPI alloc] initWithUsername:username password:password];
        });
    }
    return _engine;
}

- (id)initWithUsername:(NSString *)username password:(NSString *)password
{
    if ((self = [super init])) {
        self.auth = [[APAuthentication alloc] initWithUsername:username password:password];
    }
    return self;
}

- (APSalesTransaction *)beginSalesTransaction
{
    APSalesTransaction *sales = [[APSalesTransaction alloc] init];
    sales.auth = self.auth;
    return sales;
}

- (APRankTransaction *)beginRankTransaction
{
    APRankTransaction *ranks = [[APRankTransaction alloc] init];
    ranks.auth = self.auth;
    return ranks;
}

- (APReviewTransaction *)beginReviewTransaction
{
    APReviewTransaction *reviews = [[APReviewTransaction alloc] init];
    reviews.auth = self.auth;
    return reviews;
}

- (APiAdTransaction *)beginiAdTransaction
{
    APiAdTransaction *iads = [[APiAdTransaction alloc] init];
    iads.auth = self.auth;
    return iads;
}

- (APArchiveTransaction *)beginArchiveTransaction
{
    APArchiveTransaction *archive = [[APArchiveTransaction alloc] init];
    archive.auth = self.auth;
    return archive;
}

- (APEventTransaction *)beginEventTransaction
{
    APEventTransaction *events = [[APEventTransaction alloc] init];
    events.auth = self.auth;
    return events;
}

- (APUserTransaction *)beginUserTransaction
{
    APUserTransaction *users = [[APUserTransaction alloc] init];
    users.auth = self.auth;
    return users;
}

@end
