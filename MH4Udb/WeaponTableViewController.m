//
//  WeaponTableViewController.m
//  MH4Udb
//
//  Created by Yukai on 3/12/15.
//  Copyright (c) 2015 whitehills. All rights reserved.
//

#import "WeaponTableViewController.h"

@interface weaponCellTest : UITableViewCell

@end

@implementation weaponCellTest

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"weaponCellTest"];
    if (self) {
        // Initialization code
        self.textLabel.textColor =  [UIColor colorWithWhite:0.15 alpha:1.0];
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


@interface WeaponTableViewController ()

@end

@implementation WeaponTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.weaponList = [NSMutableArray new];
    self.weaponItemList = [NSMutableArray new];
    
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController setTitle:self.weaponType];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[weaponCellTest class] forCellReuseIdentifier:@"weaponCellTest"];

}

- (void)viewDidAppear:(BOOL)animated {
    NSString *databasePath = [[NSBundle mainBundle] pathForResource:@"mh4u" ofType:@"db"];
    FMDatabase *db = [FMDatabase databaseWithPath:databasePath];
    [db open];
    
    FMResultSet *item = [db executeQueryWithFormat:@"SELECT * FROM items WHERE sub_type = %@", self.weaponType];
    while ([item next]) {
        NSMutableDictionary *weaponItemDetail = [NSMutableDictionary new];
        NSString *name = [item stringForColumn:@"name"];
        int weaponID = [item intForColumn:@"_id"];
        NSLog(@"Weapon Name: %@", name);
        [weaponItemDetail setValue:[NSNumber numberWithInt:weaponID] forKey:@"id"];
        [weaponItemDetail setValue:name forKey:@"name"];
        [self.weaponItemList addObject:weaponItemDetail];
    }
    
    FMResultSet *weapon = [db executeQueryWithFormat:@"SELECT * FROM weapons WHERE wtype = %@", self.weaponType];
    while ([weapon next]) {
        NSMutableDictionary *weaponDetail = [NSMutableDictionary new];
        NSString *name = [weapon stringForColumn:@"name"];
        int weaponID = [weapon intForColumn:@"_id"];
        int parentID = [weapon intForColumn:@"parent_id"];
        NSLog(@"Weapon Name: %@", name);
        [weaponDetail setValue:[NSNumber numberWithInt:weaponID] forKey:@"weaponID"];
        [weaponDetail setValue:[NSNumber numberWithInt:parentID] forKey:@"parentID"];
        [weaponDetail setValue:name forKey:@"name"];
        [self.weaponList addObject:weaponDetail];
    }
    
    [db close];
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.weaponList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    weaponCellTest *cell =  [tableView dequeueReusableCellWithIdentifier:@"weaponCellTest"
                                                            forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (cell == nil) {
        cell = [[weaponCellTest alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"weaponTypeCell"];
    }
    
    cell.textLabel.text = [self.weaponList objectAtIndex:indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end