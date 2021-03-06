//
//  APRequest.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-29.
//  Copyright (c) 2011 Kyle Hickinson. All rights reserved.
//

#import "APRequest.h"
#import "APConstants.h"

NSString * const APHTTPMethodGet = @"GET";
NSString * const APHTTPMethodPost = @"POST";
NSString * const APHTTPMethodPut = @"PUT";
NSString * const APHTTPMethodDelete = @"DELETE";

@interface APRequest ()
@property (nonatomic, strong) NSMutableData *data;
@end

@implementation APRequest

- (id)initWithURL:(NSURL *)URL method:(APHTTPMethod)method
{
    return [self initWithURL:URL method:method delegate:nil];
}

- (id)initWithURL:(NSURL *)URL method:(APHTTPMethod)method delegate:(id<APRequestDelegate>)delegate
{
    if ((self = [super init])) {
        self.URL = URL;
        self.method = method;
        self.delegate = delegate;
    }
    return self;
}

- (void)setDelegate:(id<APRequestDelegate>)delegate
{
    _delegate = delegate;
    if (delegate) {
        _flags.respondsToComplete = [self.delegate respondsToSelector:@selector(request:didCompleteWithResults:)];
        _flags.respondsToFail = [self.delegate respondsToSelector:@selector(request:didFailWithError:)];
    }
}

- (NSURLConnection *)start
{
    NSMutableURLRequest *_request = [[NSMutableURLRequest alloc] initWithURL:self.URL];
    [_request setHTTPMethod:self.method];
    [_request setValue:kAPUserAgent forHTTPHeaderField:@"User-Agent"];
    [_request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [_request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    NSString *uppercaseMethod = [self.method uppercaseString];
    if ([uppercaseMethod isEqualToString:APHTTPMethodPost] ||
        [uppercaseMethod isEqualToString:APHTTPMethodPut]) {
        
        [_request setHTTPBody:[NSJSONSerialization dataWithJSONObject:self.arguments options:kNilOptions error:nil]];
    }
    
    self.connection = [[NSURLConnection alloc] initWithRequest:_request delegate:self];
    [self.connection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    [self.connection start];
    
    return self.connection;
}

- (void)cancel
{
    [self.connection cancel];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if (_flags.respondsToFail) {
        [self.delegate request:self didFailWithError:error];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    if ([challenge previousFailureCount] == 0) {
        // Return credentials
		NSURLCredential *credential = [NSURLCredential credentialWithUser:[self.auth.username lowercaseString]
                                                                 password:self.auth.password
                                                              persistence:NSURLCredentialPersistenceNone];
		[[challenge sender] useCredential:credential forAuthenticationChallenge:challenge];
        
	} else {
        // Cancel challenge if it failed previously
		[[challenge sender] cancelAuthenticationChallenge:challenge];
	}
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.response = (NSHTTPURLResponse *)response;
    if (!self.data) {
        self.data = [[NSMutableData alloc] init];
    } else {
        [self.data setLength:0];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDictionary *results = [NSJSONSerialization JSONObjectWithData:self.data options:kNilOptions error:nil];
    
    if (_flags.respondsToComplete) {
        [self.delegate request:self didCompleteWithResults:results];
    }
}

@end
