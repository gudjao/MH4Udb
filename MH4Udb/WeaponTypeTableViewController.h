//
//  WeaponTypeTableViewController.h
//  MH4Udb
//
//  Created by Yukai on 3/12/15.
//  Copyright (c) 2015 whitehills. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeaponTypeTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) NSArray *weaponType;

@end
