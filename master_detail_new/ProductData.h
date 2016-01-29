//
//  ProductData.h
//  master_detail_new
//
//  Created by BridgeLabz on 17/12/15.
//  Copyright © 2015 BridgeLabz. All rights reserved.
//

#ifndef ProductData_h
#define ProductData_h

#import <Foundation/Foundation.h>

@interface ProductData : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSDecimalNumber *price;
@property (nonatomic) NSImage *image;
@property (nonatomic) NSInteger numberOfSales;

- (id)initWithName:(NSString *)name price:(NSDecimalNumber *)price;

@end
#endif /* ProductData_h */
