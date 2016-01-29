//
//  MasterController.h
//  master_detail_new
//
//  Created by BridgeLabz on 17/12/15.
//  Copyright © 2015 BridgeLabz. All rights reserved.
//

#ifndef MasterController_h
#define MasterController_h

#import <Cocoa/Cocoa.h>
#import "ProductListData.h"
#import "DetailController.h"

@interface MasterController : NSObject <NSTableViewDataSource, NSTableViewDelegate>

@property (nonatomic) ProductListData *productList;
@property (weak) IBOutlet NSTableView *tableView;

- (IBAction)insertNewProduct:(id)sender;
- (IBAction)removeSelectedProduct:(id)sender;
@property (weak) IBOutlet DetailController *detailController;

@end


#endif /* MasterController_h */
