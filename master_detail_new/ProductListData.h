//
//  ProductListData.h
//  master_detail_new
//
//  Created by BridgeLabz on 17/12/15.
//  Copyright © 2015 BridgeLabz. All rights reserved.
//

#ifndef ProductListData_h
#define ProductListData_h

#import <Foundation/Foundation.h>
#import "ProductData.h"

@interface ProductListData : NSObject

// KVO-enabling methods
- (NSUInteger)countOfProducts;
- (id)objectInProductsAtIndex:(NSUInteger)index;
- (void)insertObject:(id)object inProductsAtIndex:(NSUInteger)index;
- (void)removeObjectFromProductsAtIndex:(NSUInteger)index;

// Other useful methods
- (NSInteger)indexOfObjectInProducts:(id)product;


@end


#endif /* ProductListData_h */
