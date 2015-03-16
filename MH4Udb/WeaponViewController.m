//
//  WeaponViewController.m
//  MH4Udb
//
//  Created by Yukai on 3/12/15.
//  Copyright (c) 2015 whitehills. All rights reserved.
//

#import "WeaponViewController.h"

@interface weaponCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *detailedLabel;

@end

@implementation weaponCell

@synthesize detailedLabel = _detailedLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"weaponCell"];
    if (self) {
        // Initialization code
        self.textLabel.textColor =  [UIColor colorWithWhite:0.15 alpha:1.0];
        
        _detailedLabel = [UILabel new];
        //_detailedLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_detailedLabel];
        
        //NSDictionary *views = NSDictionaryOfVariableBindings(_detailedLabel);
        
        //[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_detailedLabel]|" options:0 metrics:nil views:views]];
        //[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_detailedLabel]|" options:0 metrics:nil views:views]];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    if(selected) {
        self.textLabel.textColor = [UIColor colorWithRed:0.950 green:0.210 blue:0.060 alpha:1.000];
    } else {
        self.textLabel.textColor = [UIColor colorWithWhite:0.15 alpha:1.0];
    }
}

@end

@interface WeaponViewController ()

@end

@implementation WeaponViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Init Data
    self.weaponList = [NSMutableArray new];
    self.weaponItemList = [NSMutableArray new];
    self.weaponTopList = [NSMutableArray new];
    
    // Navigation
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController setTitle:self.weaponType];
    
    // Tree Table View
    RATreeView *treeView = [[RATreeView alloc] initWithFrame:self.view.bounds];
    treeView.delegate = self;
    treeView.dataSource = self;
    treeView.separatorStyle = RATreeViewCellSeparatorStyleSingleLine;
    [treeView reloadData];
    
    self.treeView = treeView;
    [self.view insertSubview:treeView atIndex:0];
    
    [self.treeView registerClass:[weaponCell class] forCellReuseIdentifier:@"weaponCell"];
}

#pragma mark - Helpers

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    int systemVersion = [[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."][0] intValue];
    if (systemVersion >= 7 && systemVersion < 8) {
        CGRect statusBarViewRect = [[UIApplication sharedApplication] statusBarFrame];
        float heightPadding = statusBarViewRect.size.height+self.navigationController.navigationBar.frame.size.height;
        self.treeView.contentInset = UIEdgeInsetsMake(heightPadding, 0.0, 0.0, 0.0);
        self.treeView.contentOffset = CGPointMake(0.0, -heightPadding);
    }
    
    self.treeView.frame = self.view.bounds;
    
    // DB DB DB
    NSString *databasePath = [[NSBundle mainBundle] pathForResource:@"mh4u" ofType:@"db"];
    FMDatabase *db = [FMDatabase databaseWithPath:databasePath];
    [db open];
    
    FMResultSet *item = [db executeQueryWithFormat:@"SELECT * FROM items WHERE sub_type = %@", self.weaponType];
    while ([item next]) {
        NSMutableDictionary *weaponItemDetail = [NSMutableDictionary new];
        NSString *name = [item stringForColumn:@"name"];
        int weaponID = [item intForColumn:@"_id"];
        NSLog(@"Weapon Name: %@", name);
        [weaponItemDetail setValue:[NSNumber numberWithInt:weaponID] forKey:@"itemID"];
        [weaponItemDetail setValue:name forKey:@"name"];
        [self.weaponItemList addObject:weaponItemDetail];
    }
    
    FMResultSet *weapon = [db executeQueryWithFormat:@"SELECT * FROM weapons WHERE wtype = %@", self.weaponType];
    while ([weapon next]) {
        NSMutableDictionary *weaponDetail = [NSMutableDictionary new];
        int weaponID = [weapon intForColumn:@"_id"];
        int parentID = [weapon intForColumn:@"parent_id"];
        int final = [weapon intForColumn:@"final"];
        [weaponDetail setValue:[NSNumber numberWithInt:weaponID] forKey:@"weaponID"];
        [weaponDetail setValue:[NSNumber numberWithInt:parentID] forKey:@"parentID"];
        [weaponDetail setValue:[NSNumber numberWithInt:final] forKey:@"final"];
        for(NSDictionary *weaponItem in self.weaponItemList) {
            if([[weaponItem objectForKey:@"itemID"] isEqualToNumber:[NSNumber numberWithInt:weaponID]]) {
                [weaponDetail setValue:[weaponItem objectForKey:@"name"] forKey:@"weaponName"];
            }
        }
        [self.weaponList addObject:weaponDetail];
    }
    
    [db close];
    
    NSMutableDictionary *weaponDict = [NSMutableDictionary new];
    NSMutableArray *weaponTreeArray = [NSMutableArray new];
    int final = 0;
    
    for(NSDictionary *weaponDetail in self.weaponList) {
        //[weaponTreeArray addObject:weaponDetail];
        for(NSDictionary *weaponDetail2 in self.weaponList) {
            if([weaponDetail objectForKey:@"weaponID"] == [weaponDetail2 objectForKey:@"parentID"]) {
                if([[weaponDetail2 objectForKey:@"final"] isEqualToNumber:[NSNumber numberWithInt:1]]) {
                    [weaponTreeArray addObject:weaponDetail2];
                } else {
                    //[weaponTreeArray addObject:weaponDetail2];
                    //get tree
                    NSNumber *wepID = [weaponDetail objectForKey:@"weaponID"];
                    final = 0;
                    while (!final) {
                        for(NSDictionary *weaponDetail3 in self.weaponList) {
                            if(wepID == [weaponDetail3 objectForKey:@"parentID"]) {
                                if([[weaponDetail3 objectForKey:@"final"] isEqualToNumber:[NSNumber numberWithInt:1]]) {
                                    final = 1;
                                    [weaponTreeArray addObject:weaponDetail3];
                                } else {
                                    wepID = [weaponDetail3 objectForKey:@"weaponID"];
                                    [weaponTreeArray addObject:weaponDetail3];
                                }
                            } else  {
                                wepID = [weaponDetail3 objectForKey:@"weaponID"];
                            }
                        }
                    }
                }
            }
        }
        if([[weaponDetail objectForKey:@"parentID"] isEqualToNumber:[NSNumber numberWithInt:0]]) {
            NSArray *weaponTreeArrayFinal = [weaponTreeArray copy];
            [weaponDict setValue:weaponTreeArrayFinal forKey:[weaponDetail objectForKey:@"weaponName"]];
            [weaponTreeArray removeAllObjects];
        }
    }
    
    NSLog(@"WEAPON: %@", weaponDict);

    [self.treeView reloadData];
}

#pragma mark TreeView Delegate methods

- (CGFloat)treeView:(RATreeView *)treeView heightForRowForItem:(id)item
{
    return 44;
}

#pragma mark TreeView Data Source

- (NSInteger)treeView:(RATreeView *)treeView numberOfChildrenOfItem:(id)item
{
    if (item == nil) {
        return [self.weaponTopList count];
    }
    
    WeaponObject *data = item;
    return [data.children count];
}

- (id)treeView:(RATreeView *)treeView child:(NSInteger)index ofItem:(id)item
{
    WeaponObject *data = item;
    if (item == nil) {
        return [self.weaponTopList objectAtIndex:index];
    }
    
    return data.children[index];
}

- (UITableViewCell *)treeView:(RATreeView *)treeView cellForItem:(id)item {
    
    WeaponObject *dataObject = item;
    
    NSInteger level = [self.treeView levelForCellForItem:item];
    NSInteger numberOfChildren = [dataObject.children count];
    NSString *detailText = [NSString localizedStringWithFormat:@"Number of children %@", [@(numberOfChildren) stringValue]];
    BOOL expanded = [self.treeView isCellForItemExpanded:item];
    
    weaponCell *cell = [self.treeView dequeueReusableCellWithIdentifier:@"weaponCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (level == 0) {
        cell.detailTextLabel.textColor = [UIColor blackColor];
    }
    
    cell.detailedLabel.frame = CGRectMake(5.0, 2.0, cell.frame.size.width, 40.0f);
    
    CGFloat left = 11 + 20 * level;
    
    CGRect detailsFrame = cell.detailedLabel.frame;
    detailsFrame.origin.x = left;
    cell.detailedLabel.frame = detailsFrame;
    cell.detailedLabel.text = dataObject.name;
    
    NSLog(@"detailText: %@ level: %d", detailText, (int)level);
    //cell.textLabel.text = [self.weaponList objectAtIndex:level];
    //cell.textLabel.text = [self.weaponList objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
