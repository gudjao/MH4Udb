//
//  WeaponsTableViewController.m
//  MH4Udb
//
//  Created by Yukai on 3/6/15.
//  Copyright (c) 2015 whitehills. All rights reserved.
//

#import "WeaponTypeTableViewController.h"
#import "WeaponTableViewController.h"

@interface weaponTypeCell : UITableViewCell

@end

@implementation weaponTypeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"weaponTypeCell"];
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

@interface WeaponTypeTableViewController ()

@end

@implementation WeaponTypeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationController.navigationBarHidden = NO;
    
    self.weaponType = @[@"Great Sword", @"Long Sword", @"Sword and Shield", @"Dual Blades", @"Hammer" , @"Hunting Horn" , @"Lance", @"Gun Lance", @"Switch Axe", @"Charge Blade", @"Insect Glaive", @"Light Bowgun", @"Heavy Bowgun", @"Bow"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[weaponTypeCell class] forCellReuseIdentifier:@"weaponTypeCell"];
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
    return self.weaponType.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    weaponTypeCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"weaponTypeCell"
                                                            forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (cell == nil) {
        cell = [[weaponTypeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"weaponTypeCell"];
    }
    
    cell.textLabel.text = [self.weaponType objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle:nil];
    WeaponTableViewController *weaponView = [mainStoryboard instantiateViewControllerWithIdentifier:@"weaponView"];
    weaponView.weaponType = [self.weaponType objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:weaponView animated:YES];
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
