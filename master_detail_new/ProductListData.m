//
//  ProductListData.m
//  master_detail_new
//
//  Created by BridgeLabz on 17/12/15.
//  Copyright © 2015 BridgeLabz. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "ProductListData.h"

@implementation ProductListData {
    NSMutableArray *_products;
}

- (id)init {
    self = [super init];
    if (self) {
        _products = [NSMutableArray array];
    }
    return self;
}

- (NSUInteger)countOfProducts {
    return [_products count];
}

- (id)objectInProductsAtIndex:(NSUInteger)index {
    return _products[index];
}

- (void)insertObject:(id)object inProductsAtIndex:(NSUInteger)index {
    [_products insertObject:object atIndex:index];
}

- (void)removeObjectFromProductsAtIndex:(NSUInteger)index {
    [_products removeObjectAtIndex:index];
}

- (NSInteger)indexOfObjectInProducts:(id)product {
    return [_products indexOfObject:product];
}

@end
