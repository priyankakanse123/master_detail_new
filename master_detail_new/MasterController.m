//
//  MasterController.m
//  master_detail_new
//
//  Created by BridgeLabz on 17/12/15.
//  Copyright © 2015 BridgeLabz. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MasterController.h"
#import "ProductData.h"

@implementation MasterController

- (id)init {
    self = [super init];
    if (self) {
        // Create a new product list
        _productList = [[ProductListData alloc] init];
        
        // Add some dummy data
        [_productList insertObject:[[ProductData alloc] initWithName:@"Coffee"
                                                               price:[NSDecimalNumber decimalNumberWithString:@"1.99"]] inProductsAtIndex:0];
        [_productList insertObject:[[ProductData alloc] initWithName:@"Latte"
                                                               price:[NSDecimalNumber decimalNumberWithString:@"3.49"]] inProductsAtIndex:1];
        [_productList insertObject:[[ProductData alloc] initWithName:@"Flat White"
                                                               price:[NSDecimalNumber decimalNumberWithString:@"3.99"]] inProductsAtIndex:2];
        NSLog(@"output");
    }
    return self;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.productList countOfProducts];
}

- (NSView *)tableView:(NSTableView *)tableView
   viewForTableColumn:(NSTableColumn *)tableColumn
                  row:(NSInteger)row {
    // Request a view for the cell
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:@"ProductNameCell"
                                                            owner:nil];
    // Configure the view for the specified row
    ProductData *product = [self.productList objectInProductsAtIndex:row];
    cellView.textField.stringValue = product.name;
    
    // Return the cell
    return cellView;
}
- (void)tableViewSelectionDidChange:(NSNotification *)notification {
    if (self.tableView.selectedRow > -1) {
        self.detailController.product = [self.productList objectInProductsAtIndex:self.tableView.selectedRow];
    } else {
        self.detailController.product = nil;
    }
}
- (void)awakeFromNib {
    [self.tableView selectRowIndexes:[NSIndexSet indexSetWithIndex:1]
                byExtendingSelection:NO];
    [self.productList addObserver:self forKeyPath:@"products" options:0 context:NULL];
}


- (IBAction)insertNewProduct:(id)sender {
    // Create the new product data
    ProductData *product = [[ProductData alloc] initWithName:@"New Product"
                                                       price:[NSDecimalNumber decimalNumberWithString:@"1.99"]];
    
    // Figure out the index to insert into (TODO)
    NSInteger index = self.tableView.selectedRow;
    if (index == -1) {
        // No selection, so insert at top of list
        index = 0;
    }
    
    // Insert it into the model layer
    [self.productList insertObject:product inProductsAtIndex:index];
    
    
    // (Removed table view updating code)
    
    
    // Select the new row
    [self.tableView selectRowIndexes:[NSIndexSet indexSetWithIndex:index]
                byExtendingSelection:NO];
}

- (IBAction)removeSelectedProduct:(id)sender {
    NSInteger index = self.tableView.selectedRow;
    if (index == -1) {
        // No selection, so don't do anything
        return;
    }
    // Remove it from the model layer
    [self.productList removeObjectFromProductsAtIndex:index];
    
    
    // (Removed table view updating code)
    
    
    // Select a new row, if there are any left
    if ([self.productList countOfProducts] > 0) {
        NSInteger newIndex = index-1;
        if (newIndex < 0) {
            newIndex = 0;
        }
        [self.tableView selectRowIndexes:[NSIndexSet indexSetWithIndex:newIndex] byExtendingSelection:NO];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if (object == self.productList) {
        if ([keyPath isEqualToString:@"products"]) {
            
            // Figure out what kind of change occurred
            NSNumber *changeTypeAsNumber = change[NSKeyValueChangeKindKey];
            NSKeyValueChange changeType = [changeTypeAsNumber intValue];
            
            NSIndexSet *indexes = change[NSKeyValueChangeIndexesKey];
            NSInteger index = [indexes firstIndex];
            if (changeType == NSKeyValueChangeInsertion) {
                
                // Update the table view to match
                [self.tableView beginUpdates];
                [self.tableView insertRowsAtIndexes:[NSIndexSet indexSetWithIndex:index]
                                      withAnimation:NSTableViewAnimationSlideDown];
                [self.tableView scrollRowToVisible:index];
                [self.tableView endUpdates];
                
            } else if (changeType == NSKeyValueChangeRemoval) {
                
                // Update the table view to match
                [self.tableView beginUpdates];
                [self.tableView removeRowsAtIndexes:[NSIndexSet indexSetWithIndex:index]
                                      withAnimation:NSTableViewAnimationEffectFade];
                [self.tableView scrollRowToVisible:index];
                [self.tableView endUpdates];
            }
        }
    }
}
@end
   
