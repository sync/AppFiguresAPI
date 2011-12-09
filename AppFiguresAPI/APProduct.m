//
//  APProduct.m
//  AppFiguresAPI
//
//  Created by Kyle Hickinson on 11-11-29.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "APProduct.h"

@interface APProduct ()
@property (nonatomic, strong) NSDictionary *data;
@end

@implementation APProduct
@synthesize data;

- (id)initWithResponse:(NSDictionary *)response
{
    if ((self = [super init])) {
        self.data = response;
    }
    return self;
}

- (NSArray *)inAppIDs
{
    return [self.data objectForKey:@"in_apps"];
}

- (APProductType)type
{
    static APProductType _type = -1;
    if (_type == -1) {
        NSString *_str = [self.data objectForKey:@"product_type"];
        if ([_str isEqualToString:@"app"]) {
            _type = APProductTypeApp;
        } else if ([_str isEqualToString:@"in_app"]) {
            _type = APProductTypeInApp;
        } else if ([_str isEqualToString:@"book"]) {
            _type = APProductTypeBook;
        }
    }
    return _type;
}

- (NSString *)timestamp
{
    return [self.data objectForKey:@"added_timestamp"];
}

- (NSString *)name
{
    return [self.data objectForKey:@"name"];
}

- (NSUInteger)productID
{
    return [[self.data objectForKey:@"id"] unsignedIntegerValue];
}

- (NSURL *)iconURL
{
    return [NSURL URLWithString:[self.data objectForKey:@"icon"]];
}

- (BOOL)active
{
    return [[self.data objectForKey:@"active"] boolValue];
}

- (BOOL)hidden
{
    return [[self.data objectForKey:@"hidden"] boolValue];
}

- (NSString *)sku
{
    return [self.data objectForKey:@"sku"];
}

- (NSUInteger)storeID
{
    return [[self.data objectForKey:@"store_id"] unsignedIntegerValue];
}

- (NSString *)storeName
{
    return [self.data objectForKey:@"store_name"];
}

- (NSInteger)refNumber
{
    return [[self.data objectForKey:@"ref_no"] integerValue];
}

- (NSArray *)addOns
{
    return [self.data objectForKey:@"addons"];
}

@end
