//
//  WeaponTableViewController.h
//  MH4Udb
//
//  Created by Yukai on 3/12/15.
//  Copyright (c) 2015 whitehills. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDB.h"
#import <RATreeView.h>

@interface WeaponTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) NSMutableArray *weaponList;
@property(nonatomic, strong) NSMutableArray *weaponItemList;
@property(nonatomic, strong) NSString *weaponType;

@end
