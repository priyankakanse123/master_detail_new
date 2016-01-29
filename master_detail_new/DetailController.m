//
//  DetailController.m
//  master_detail_new
//
//  Created by BridgeLabz on 17/12/15.
//  Copyright © 2015 BridgeLabz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailController.h"
@implementation DetailController

- (void)setProduct:(ProductData *)product {
    _product = product;
    
    NSLog(@"Displaying product: %@", product.name);
    
        [self synchronizeWithData];
    
}

- (void)synchronizeWithData {
    if (self.product == nil) {
        // Nothing to display, so disable everything
        [self.nameTextField setEnabled:NO];
        [self.priceTextField setEnabled:NO];
        [self.imageView setEnabled:NO];
        [self.imageView setEditable:NO];
        [self.editImageButton setEnabled:NO];
        [self.makeSaleButton setEnabled:NO];
        
        self.nameTextField.stringValue = @"";
        self.priceTextField.stringValue = @"";
        self.imageView.image = nil;
        self.numberOfSalesTextField.stringValue = @"";
        return;
    }
    
    // Make sure everything is enabled
    [self.nameTextField setEnabled:YES];
    [self.priceTextField setEnabled:YES];
    [self.imageView setEnabled:YES];
    [self.imageView setEditable:YES];
    [self.editImageButton setEnabled:YES];
    [self.makeSaleButton setEnabled:YES];
    
    
    // Display everything
    self.nameTextField.stringValue = self.product.name;
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    self.priceTextField.stringValue = [formatter stringFromNumber:self.product.price];
    
    self.imageView.image = self.product.image;
    self.numberOfSalesTextField.stringValue = [NSString stringWithFormat:@"Sales: %ld",
                                               self.product.numberOfSales];
}
- (void)awakeFromNib {
    [self synchronizeWithData];
}

- (IBAction)changeName:(id)sender {
    self.product.name = self.nameTextField.stringValue;
    [self synchronizeWithData];
}

- (IBAction)changePrice:(id)sender {
    // String dollar sign
    NSString *priceAsString = [self.priceTextField.stringValue stringByReplacingOccurrencesOfString:@"$"
                                                                                         withString:@""];
    self.product.price = [NSDecimalNumber decimalNumberWithString:priceAsString];
    [self synchronizeWithData];
}

- (IBAction)changeImage:(id)sender {
    self.product.image = self.imageView.image;
    [self synchronizeWithData];
}

- (IBAction)makeSale:(id)sender {
    self.product.numberOfSales++;
    [self synchronizeWithData];
}
@end