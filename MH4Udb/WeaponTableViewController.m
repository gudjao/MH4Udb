//
//  WeaponTableViewController.m
//  MH4Udb
//
//  Created by Yukai on 3/12/15.
//  Copyright (c) 2015 whitehills. All rights reserved.
//

#import "WeaponTableViewController.h"

@interface weaponCellTest : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *detailedLabel;
@property (strong, nonatomic) IBOutlet UILabel *attackLabel;
@property (strong, nonatomic) IBOutlet UIView *pointLine;
@property (strong, nonatomic) IBOutlet UIView *treeLine;
@property (strong, nonatomic) IBOutlet UIView *treeLine0;
@property (strong, nonatomic) IBOutlet UIView *treeLine1;

@end

@implementation weaponCellTest

@synthesize detailedLabel = _detailedLabel, attackLabel = _attackLabel;
@synthesize pointLine = _pointLine;
@synthesize treeLine = _treeLine;
@synthesize treeLine0 = _treeLine0, treeLine1 = _treeLine1;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"weaponCellTest"];
    if (self) {
        // Initialization code
        self.textLabel.textColor =  [UIColor colorWithWhite:0.15 alpha:1.0];
        
        _detailedLabel = [UILabel new];
        _detailedLabel.font = [UIFont systemFontOfSize:16.0f];
        
        _attackLabel = [UILabel new];
        _attackLabel.font = [UIFont systemFontOfSize:12.0f];
        
        _pointLine = [UIView new];
        _treeLine = [UIView new];
        _treeLine0 = [UIView new];
        _treeLine1 = [UIView new];
        
        [self.contentView addSubview:_detailedLabel];
        [self.contentView addSubview:_attackLabel];
        [self.contentView addSubview:_treeLine];
        [self.contentView addSubview:_treeLine0];
        [self.contentView addSubview:_treeLine1];
        [self.contentView addSubview:_pointLine];
        
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

CGFloat previousDepth = 0;

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
    
    previousDepth = 0;
}

- (void)viewDidAppear:(BOOL)animated {
    
    // DB DB DB
    NSString *databasePath = [[NSBundle mainBundle] pathForResource:@"mh4u" ofType:@"db"];
    FMDatabase *db = [FMDatabase databaseWithPath:databasePath];
    [db open];
    
    FMResultSet *item = [db executeQueryWithFormat:@"SELECT * FROM items WHERE sub_type = %@", self.weaponType];
    while ([item next]) {
        NSMutableDictionary *weaponItemDetail = [NSMutableDictionary new];
        NSString *name = [item stringForColumn:@"name"];
        int weaponID = [item intForColumn:@"_id"];
        int rarity = [item intForColumn:@"rarity"];
        NSLog(@"Weapon Name: %@", name);
        [weaponItemDetail setValue:[NSNumber numberWithInt:weaponID] forKey:@"itemID"];
        [weaponItemDetail setValue:name forKey:@"name"];
        [weaponItemDetail setValue:[NSNumber numberWithInt:rarity] forKey:@"rarity"];
        [self.weaponItemList addObject:weaponItemDetail];
    }
    
    FMResultSet *weapon = [db executeQueryWithFormat:@"SELECT * FROM weapons WHERE wtype = %@", self.weaponType];
    while ([weapon next]) {
        NSMutableDictionary *weaponDetail = [NSMutableDictionary new];
        int weaponID = [weapon intForColumn:@"_id"];
        int parentID = [weapon intForColumn:@"parent_id"];
        int final = [weapon intForColumn:@"final"];
        int treeDepth = [weapon intForColumn:@"tree_depth"];
        int weaponAttack = [weapon intForColumn:@"attack"];
        [weaponDetail setValue:[NSNumber numberWithInt:weaponID] forKey:@"weaponID"];
        [weaponDetail setValue:[NSNumber numberWithInt:parentID] forKey:@"parentID"];
        [weaponDetail setValue:[NSNumber numberWithInt:final] forKey:@"final"];
        [weaponDetail setValue:[NSNumber numberWithInt:treeDepth] forKey:@"treeDepth"];
        [weaponDetail setValue:[NSNumber numberWithInt:weaponAttack] forKey:@"weaponAttack"];
        for(NSDictionary *weaponItem in self.weaponItemList) {
            if([[weaponItem objectForKey:@"itemID"] isEqualToNumber:[NSNumber numberWithInt:weaponID]]) {
                [weaponDetail setValue:[weaponItem objectForKey:@"name"] forKey:@"weaponName"];
                [weaponDetail setValue:[weaponItem objectForKey:@"rarity"] forKey:@"weaponRarity"];
            }
        }
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 88.0f;
}

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
        cell = [[weaponCellTest alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"weaponCellTest"];
    }
    
    CGFloat floatDepth = [[self.weaponList objectAtIndex:indexPath.row][@"treeDepth"] floatValue];
    int floatRarity = [[self.weaponList objectAtIndex:indexPath.row][@"weaponRarity"] floatValue];
    
    cell.detailedLabel.frame = CGRectMake(4.0, 2.0, cell.frame.size.width, 52.0f);
    cell.attackLabel.frame = CGRectMake(4.0, 42.0f, cell.frame.size.width, 32.0f);
    cell.treeLine.frame = CGRectMake(4.0, 0.0, 4.0f, 88.0f);
    
    CGFloat left = 10 + (8 * floatDepth);
    CGRect detailsFrame = cell.detailedLabel.frame;
    detailsFrame.origin.x = left;
    cell.detailedLabel.frame = detailsFrame;
    cell.detailedLabel.text = [self.weaponList objectAtIndex:indexPath.row][@"weaponName"];
    
    CGFloat attackLeft = 10 + (8 * floatDepth);
    CGRect attackFrame = cell.attackLabel.frame;
    attackFrame.origin.x = attackLeft;
    cell.attackLabel.frame = attackFrame;
    cell.attackLabel.text = [NSString stringWithFormat:@"DMG: %@", [self.weaponList objectAtIndex:indexPath.row][@"weaponAttack"]];
    
    CGFloat leftLine = 2 + (8 * floatDepth);
    CGRect treeLineFrame = cell.treeLine.frame;
    treeLineFrame.origin.x = leftLine;
    cell.treeLine.frame = treeLineFrame;
    cell.treeLine.backgroundColor = [self rarityColor:floatRarity];
    
    cell.pointLine.frame = CGRectZero;
    cell.pointLine.hidden = YES;
    
    cell.treeLine0.frame = CGRectZero;
    cell.treeLine0.hidden = YES;
    
    cell.treeLine1.frame = CGRectZero;
    cell.treeLine1.hidden = YES;
    
    /*
    if(floatDepth != 0) {
        cell.treeLine0.frame = CGRectMake(6.0, -1.0, 2.0f, 45.0f);
        cell.treeLine0.hidden = NO;
        CGFloat leftLine0 = 5 + (10 * 0);
        CGRect treeLineFrame0 = cell.treeLine0.frame;
        treeLineFrame0.origin.x = leftLine0;
        cell.treeLine0.frame = treeLineFrame0;
        
        cell.treeLine0.backgroundColor = [UIColor colorWithRed:(((0 / 1.5) + 1.5) * 42)/255.0f green:(((0 / 1.5) + 1) * 28)/255.0f blue:(((0 / 1.5) + 0.5) * 20)/255.0f alpha:0.50];
    }
    
    if(floatDepth > 1) {
        cell.treeLine1.frame = CGRectMake(6.0, -1.0, 2.0f, 45.0f);
        cell.treeLine1.hidden = NO;
        CGFloat leftLine1 = 5 + (10 * 1);
        CGRect treeLineFrame1 = cell.treeLine1.frame;
        treeLineFrame1.origin.x = leftLine1;
        cell.treeLine1.frame = treeLineFrame1;
        
        cell.treeLine1.backgroundColor = [UIColor colorWithRed:(((1 / 1.5) + 1.5) * 42)/255.0f green:(((1 / 1.5) + 1) * 28)/255.0f blue:(((1 / 1.5) + 0.5) * 20)/255.0f alpha:0.50];
    }
    
    if(previousDepth == 0) {
        previousDepth = 1;
    } else {
        if(previousDepth == (floatDepth - 1)) {
            previousDepth = floatDepth;
            
            cell.pointLine.frame = CGRectMake(6.0, 20.0, 10.0f, 2.0f);
            cell.pointLine.hidden = NO;
            CGFloat leftPointLine = 6 + (10 * (floatDepth -1));
            CGRect pointLineFrame = cell.pointLine.frame;
            pointLineFrame.origin.x = leftPointLine;
            cell.pointLine.frame = pointLineFrame;
            
            cell.pointLine.backgroundColor = [UIColor colorWithRed:(((floatDepth / 1.5) + 1.5) * 42)/255.0f green:(((floatDepth / 1.5) + 1) * 28)/255.0f blue:(((floatDepth / 1.5) + 0.5) * 20)/255.0f alpha:0.50];
        }
    }

    */
    
    return cell;
}

- (UIColor *)rarityColor:(int)rarity {
    int x = rarity - 1;
    switch (x) {
        case 0:
            return [UIColor colorWithRed:192/255.0f green:192/255.0f blue:192/255.0f alpha:1.0f];
            break;
        case 1:
            return [UIColor colorWithRed:150/255.0f green:79/255.0f blue:172/255.0f alpha:1.0f];
            break;
        case 2:
            return [UIColor colorWithRed:222/255.0f green:186/255.0f blue:78/255.0f alpha:1.0f];
            break;
        case 3:
            return [UIColor colorWithRed:208/255.0f green:129/255.0f blue:143/255.0f alpha:1.0f];
            break;
        case 4:
            return [UIColor colorWithRed:100/255.0f green:179/255.0f blue:122/255.0f alpha:1.0f];
            break;
        case 5:
            return [UIColor colorWithRed:100/255.0f green:114/255.0f blue:223/255.0f alpha:1.0f];
            break;
        case 6:
            return [UIColor colorWithRed:222/255.0f green:79/255.0f blue:79/255.0f alpha:1.0f];
            break;
        case 7:
            return [UIColor colorWithRed:137/255.0f green:183/255.0f blue:228/255.0f alpha:1.0f];
            break;
        case 8:
            return [UIColor colorWithRed:222/255.0f green:136/255.0f blue:79/255.0f alpha:1.0f];
            break;
        case 9:
            return [UIColor colorWithRed:228/255.0f green:46/255.0f blue:228/255.0f alpha:1.0f];
            break;
        default:
            return [UIColor colorWithWhite:1.0 alpha:1.0];
            break;
    }
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