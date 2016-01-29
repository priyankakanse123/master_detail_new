//
//  ProductData.m
//  master_detail_new
//
//  Created by BridgeLabz on 17/12/15.
//  Copyright © 2015 BridgeLabz. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ProductData.h"
@implementation ProductData

- (id)initWithName:(NSString *)name price:(NSDecimalNumber *)price {
    self = [super init];
    if (self) {
        _name = name;
        _price = price;
    }
    return self;
}
@end