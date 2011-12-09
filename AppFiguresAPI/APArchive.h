//
//  APArchive.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-12-04.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const APArchiveTypeDaily;
extern NSString * const APArchiveTypeWeekly;
extern NSString * const APArchiveTypeFinancial;
extern NSString * const APArchiveTypePayment;
extern NSString * const APArchiveTypeAll;

typedef NSString * APArchiveType;

@interface APArchive : NSObject

- (id)initWithResponse:(NSDictionary *)response;

@property (readonly) NSUInteger archiveID;
@property (readonly) APArchiveType type;
@property (readonly) NSUInteger itcID;
@property (readonly) NSString *reportTimestamp;
@property (readonly) NSString *importTimestamp;
@property (readonly) NSString *importMethod;
@property (readonly) NSString *region;

@end
