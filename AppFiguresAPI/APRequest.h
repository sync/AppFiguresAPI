//
//  APRequest.h
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-29.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APAuthentication.h"

extern NSString * const APHTTPMethodGet;
extern NSString * const APHTTPMethodPost;
extern NSString * const APHTTPMethodPut;
extern NSString * const APHTTPMethodDelete;

typedef NSString * APHTTPMethod;

@class APRequest;

@protocol APRequestDelegate <NSObject>
@optional
- (void)request:(APRequest *)request didCompleteWithResults:(NSDictionary *)results;
- (void)request:(APRequest *)request didFailWithError:(NSError *)error;
@end

@interface APRequest : NSObject <NSURLConnectionDataDelegate, NSURLConnectionDelegate> {
    struct {
        BOOL respondsToComplete;
        BOOL respondsToFail;
    } _flags;
}

@property (nonatomic, strong) APAuthentication *auth;
@property (nonatomic, strong) NSURL *URL;
@property (nonatomic, copy) APHTTPMethod method;
@property (nonatomic, strong) NSDictionary *arguments;
@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, weak) id<APRequestDelegate> delegate;
@property (nonatomic, strong) NSHTTPURLResponse *response;

- (id)initWithURL:(NSURL *)URL method:(APHTTPMethod)method;
- (id)initWithURL:(NSURL *)URL method:(APHTTPMethod)method delegate:(id<APRequestDelegate>)delegate;
- (NSURLConnection *)start;
- (void)cancel;

@end