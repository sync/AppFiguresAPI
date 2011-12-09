//
//  APArchiveTransaction.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-04.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "APArchiveTransaction.h"

NSString * const APArchiveTransactionTypeAll = @"";
NSString * const APArchiveTransactionTypeLatest = @"latest";
NSString * const APArchiveTransactionTypeDate = @"date";
NSString * const APArchiveTransactionTypeRaw = @"raw";

@implementation APArchiveTransaction
@synthesize transactionCompleted;
@synthesize transactionType;
@synthesize archiveID;
@synthesize archiveType;
@synthesize date;

- (id)init
{
    if ((self = [super init])) {
        [self beginTransaction];
    }
    return self;
}

- (void)beginTransaction
{
    [self beginTransactionWithType:APArchiveTransactionTypeAll];
}

- (void)beginTransactionWithType:(APArchiveTransactionType)type
{
    [super beginTransactionWithURL:nil method:APHTTPMethodGet];
    self.request.delegate = self;
    self.transactionType = type;
}

- (void)commitTransaction
{
    //
    // GET /archive/?type={type}
    // GET /archive/latest/?type={type}
    // GET /archive/{report_date}/?type={type}
    // GET /archive/raw/{id}/
    // 
    
    NSMutableString *_url = [[NSMutableString alloc] initWithString:@"archive/"];
    if ([self.transactionType isEqualToString:APArchiveTransactionTypeDate]) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        [_url appendFormat:@"%@/?type=%@", [formatter stringFromDate:self.date], self.archiveType];
    } else if ([self.transactionType isEqualToString:APArchiveTransactionTypeRaw]) {
        [_url appendFormat:@"%@/%d/", self.transactionType, self.archiveID];
    } else {
        if ([self.transactionType length] > 0) {
            [_url appendFormat:@"%@/", self.transactionType];
        }
        [_url appendFormat:@"?type=%@", self.archiveType];
    }
    
    self.URL = [NSURL URLWithString:_url];
    
    [super commitTransaction];
}

- (void)request:(APRequest *)request didCompleteWithResults:(NSDictionary *)results
{
    NSMutableArray *_archives = [[NSMutableArray alloc] init];
    for (NSString *idKey in results) {
        [_archives addObject:[[APArchive alloc] initWithResponse:[results objectForKey:idKey]]];
    }
    
    if (self.transactionCompleted) {
        self.transactionCompleted(self, _archives);
    }
}

- (void)request:(APRequest *)request didFailWithError:(NSError *)error
{
    if (self.transactionFailed) {
        self.transactionFailed(self, error);
    }
}

@end
