//
//  DetailController.h
//  master_detail_new
//
//  Created by BridgeLabz on 17/12/15.
//  Copyright © 2015 BridgeLabz. All rights reserved.
//

#ifndef DetailController_h
#define DetailController_h

#import <Cocoa/Cocoa.h>
#import "ProductData.h"

@interface DetailController : NSObject

@property (nonatomic) ProductData *product;

@property (weak) IBOutlet NSTextField *nameTextField;
@property (weak) IBOutlet NSTextField *priceTextField;
@property (weak) IBOutlet NSImageView *imageView;
@property (weak) IBOutlet NSButton *editImageButton;
@property (weak) IBOutlet NSTextField *numberOfSalesTextField;
@property (weak) IBOutlet NSButton *makeSaleButton;

- (IBAction)changeName:(id)sender;
- (IBAction)changePrice:(id)sender;
- (IBAction)changeImage:(id)sender;
- (IBAction)makeSale:(id)sender;


@end

#endif /* DetailController_h */
