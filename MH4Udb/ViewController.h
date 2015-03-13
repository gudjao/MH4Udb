//
//  ViewController.h
//  MH4Udb
//
//  Created by Yukai on 3/6/15.
//  Copyright (c) 2015 whitehills. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDB.h"

@interface ViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) NSArray *homeMenu;

@end

