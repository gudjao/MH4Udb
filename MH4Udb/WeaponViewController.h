//
//  WeaponViewController.h
//  MH4Udb
//
//  Created by Yukai on 3/12/15.
//  Copyright (c) 2015 whitehills. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FMDB.h>
#import <RATreeView.h>
#import "WeaponObject.h"

@interface WeaponViewController : UIViewController <RATreeViewDataSource, RATreeViewDelegate>

@property (weak, nonatomic) RATreeView *treeView;

@property(nonatomic, strong) NSMutableArray *weaponList;
@property(nonatomic, strong) NSMutableArray *weaponItemList;
@property(nonatomic, strong) NSString *weaponType;

@property (strong, nonatomic) NSMutableArray *weaponTopList;

@end
