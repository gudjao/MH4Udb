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
@property (strong, nonatomic) IBOutlet UIImageView *elementImageView;
@property (strong, nonatomic) IBOutlet UILabel *elementAttackLabel;

@property (strong, nonatomic) IBOutlet UILabel *affinityLabel;

@property (strong, nonatomic) IBOutlet UIView *pointLine;
@property (strong, nonatomic) IBOutlet UIView *treeLine;
@property (strong, nonatomic) IBOutlet UIView *treeLine0;
@property (strong, nonatomic) IBOutlet UIView *treeLine1;

@property (strong, nonatomic) IBOutlet UIView *sharpnessBackground;
@property (strong, nonatomic) IBOutlet UIView *redSharpness;
@property (strong, nonatomic) IBOutlet UIView *orangeSharpness;
@property (strong, nonatomic) IBOutlet UIView *yellowSharpness;
@property (strong, nonatomic) IBOutlet UIView *greenSharpness;
@property (strong, nonatomic) IBOutlet UIView *blueSharpness;
@property (strong, nonatomic) IBOutlet UIView *whiteSharpness;
@property (strong, nonatomic) IBOutlet UIView *purpleSharpness;

@property (strong, nonatomic) IBOutlet UIView *sharpnessPlusBackground;
@property (strong, nonatomic) IBOutlet UIView *redSharpnessPlus;
@property (strong, nonatomic) IBOutlet UIView *orangeSharpnessPlus;
@property (strong, nonatomic) IBOutlet UIView *yellowSharpnessPlus;
@property (strong, nonatomic) IBOutlet UIView *greenSharpnessPlus;
@property (strong, nonatomic) IBOutlet UIView *blueSharpnessPlus;
@property (strong, nonatomic) IBOutlet UIView *whiteSharpnessPlus;
@property (strong, nonatomic) IBOutlet UIView *purpleSharpnessPlus;

@end

@implementation weaponCellTest

@synthesize detailedLabel = _detailedLabel, attackLabel = _attackLabel;
@synthesize elementImageView = _elementImageView, elementAttackLabel = _elementAttackLabel;
@synthesize affinityLabel = _affinityLabel;
@synthesize pointLine = _pointLine;
@synthesize treeLine = _treeLine;
@synthesize treeLine0 = _treeLine0, treeLine1 = _treeLine1;
@synthesize sharpnessBackground = _sharpnessBackground, sharpnessPlusBackground = _sharpnessPlusBackground;
@synthesize redSharpness = _redSharpness, orangeSharpness = _orangeSharpness, yellowSharpness = _yellowSharpness, greenSharpness = _greenSharpness, blueSharpness = _blueSharpness, whiteSharpness = _whiteSharpness, purpleSharpness = _purpleSharpness;
@synthesize redSharpnessPlus = _redSharpnessPlus, orangeSharpnessPlus = _orangeSharpnessPlus, yellowSharpnessPlus = _yellowSharpnessPlus, greenSharpnessPlus = _greenSharpnessPlus, blueSharpnessPlus = _blueSharpnessPlus, whiteSharpnessPlus = _whiteSharpnessPlus, purpleSharpnessPlus = _purpleSharpnessPlus;

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
        
        _elementImageView = [UIImageView new];
        _elementImageView.contentMode = UIViewContentModeScaleAspectFill;
        
        _elementAttackLabel = [UILabel new];
        _elementAttackLabel.font = [UIFont systemFontOfSize:12.0f];
        
        _affinityLabel = [UILabel new];
        _affinityLabel.font = [UIFont systemFontOfSize:12.0f];
        _affinityLabel.textAlignment = NSTextAlignmentRight;
        
        _pointLine = [UIView new];
        _treeLine = [UIView new];
        _treeLine0 = [UIView new];
        _treeLine1 = [UIView new];
        
        _sharpnessBackground = [UIView new];
        _sharpnessBackground.backgroundColor = [UIColor colorWithWhite:.80 alpha:1.0f];
        _redSharpness = [UIView new];
        _redSharpness.backgroundColor = [UIColor redColor];
        _orangeSharpness = [UIView new];
        _orangeSharpness.backgroundColor = [UIColor orangeColor];
        _yellowSharpness = [UIView new];
        _yellowSharpness.backgroundColor = [UIColor yellowColor];
        _greenSharpness = [UIView new];
        _greenSharpness.backgroundColor = [UIColor greenColor];
        _blueSharpness = [UIView new];
        _blueSharpness.backgroundColor = [UIColor blueColor];
        _whiteSharpness = [UIView new];
        _whiteSharpness.backgroundColor = [UIColor whiteColor];
        _purpleSharpness = [UIView new];
        _purpleSharpness.backgroundColor = [UIColor purpleColor];
    
        _sharpnessPlusBackground = [UIView new];
        _sharpnessPlusBackground.backgroundColor = [UIColor colorWithWhite:.80 alpha:1.0f];
        _redSharpnessPlus = [UIView new];
        _redSharpnessPlus.backgroundColor = [UIColor redColor];
        _orangeSharpnessPlus = [UIView new];
        _orangeSharpnessPlus.backgroundColor = [UIColor orangeColor];
        _yellowSharpnessPlus = [UIView new];
        _yellowSharpnessPlus.backgroundColor = [UIColor yellowColor];
        _greenSharpnessPlus = [UIView new];
        _greenSharpnessPlus.backgroundColor = [UIColor greenColor];
        _blueSharpnessPlus = [UIView new];
        _blueSharpnessPlus.backgroundColor = [UIColor blueColor];
        _whiteSharpnessPlus = [UIView new];
        _whiteSharpnessPlus.backgroundColor = [UIColor whiteColor];
        _purpleSharpnessPlus = [UIView new];
        _purpleSharpnessPlus.backgroundColor = [UIColor purpleColor];
        
        [self.contentView addSubview:_detailedLabel];
        [self.contentView addSubview:_attackLabel];
        
        [self.contentView addSubview:_elementImageView];
        [self.contentView addSubview:_elementAttackLabel];
        
        [self.contentView addSubview:_affinityLabel];
        
        [self.contentView addSubview:_treeLine];
        [self.contentView addSubview:_treeLine0];
        [self.contentView addSubview:_treeLine1];
        [self.contentView addSubview:_pointLine];
        
        [_sharpnessBackground addSubview:_redSharpness];
        [_sharpnessBackground addSubview:_orangeSharpness];
        [_sharpnessBackground addSubview:_yellowSharpness];
        [_sharpnessBackground addSubview:_greenSharpness];
        [_sharpnessBackground addSubview:_blueSharpness];
        [_sharpnessBackground addSubview:_whiteSharpness];
        [_sharpnessBackground addSubview:_purpleSharpness];
        [self.contentView addSubview:_sharpnessBackground];
        
        [_sharpnessPlusBackground addSubview:_redSharpnessPlus];
        [_sharpnessPlusBackground addSubview:_orangeSharpnessPlus];
        [_sharpnessPlusBackground addSubview:_yellowSharpnessPlus];
        [_sharpnessPlusBackground addSubview:_greenSharpnessPlus];
        [_sharpnessPlusBackground addSubview:_blueSharpnessPlus];
        [_sharpnessPlusBackground addSubview:_whiteSharpnessPlus];
        [_sharpnessPlusBackground addSubview:_purpleSharpnessPlus];
        [self.contentView addSubview:_sharpnessPlusBackground];

        
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
    self.tableView.backgroundColor = [UIColor colorWithWhite:0.975 alpha:1.0f];
    
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
        NSString *sharpness = [weapon stringForColumn:@"sharpness"];
        NSArray *sharpnessArray = [sharpness componentsSeparatedByString:@" "];
        NSArray *weaponSharpness = [sharpnessArray[0] componentsSeparatedByString:@"."];
        NSArray *weaponSharpnessPlus = [sharpnessArray[1] componentsSeparatedByString:@"."];
        NSString *element = [weapon stringForColumn:@"element"];
        NSString *elementAttack = [weapon stringForColumn:@"element_attack"];
        int weaponAffinity = [weapon intForColumn:@"affinity"];
        
        [weaponDetail setValue:[NSNumber numberWithInt:weaponID] forKey:@"weaponID"];
        [weaponDetail setValue:[NSNumber numberWithInt:parentID] forKey:@"parentID"];
        [weaponDetail setValue:[NSNumber numberWithInt:final] forKey:@"final"];
        [weaponDetail setValue:[NSNumber numberWithInt:treeDepth] forKey:@"treeDepth"];
        [weaponDetail setValue:[NSNumber numberWithInt:weaponAttack] forKey:@"weaponAttack"];
        [weaponDetail setValue:weaponSharpness forKey:@"weaponSharpness"];
        [weaponDetail setValue:weaponSharpnessPlus forKey:@"weaponSharpnessPlus"];
        [weaponDetail setValue:element forKey:@"weaponElement"];
        [weaponDetail setValue:elementAttack forKey:@"weaponElementAttack"];
        [weaponDetail setValue:[NSNumber numberWithInt:weaponAffinity] forKey:@"weaponAffinity"];
        
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
    return 90.0f;
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
    cell.backgroundColor = [UIColor clearColor];
    
    if (cell == nil) {
        cell = [[weaponCellTest alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"weaponCellTest"];
    }
    
    CGFloat floatDepth = [[self.weaponList objectAtIndex:indexPath.row][@"treeDepth"] floatValue];
    int floatRarity = [[self.weaponList objectAtIndex:indexPath.row][@"weaponRarity"] floatValue];
    
    cell.detailedLabel.frame = CGRectMake(4.0, 6.0, cell.frame.size.width, 28.0f);
    cell.attackLabel.frame = CGRectMake(4.0, 34.0, 0.0f, 24.0f);
    cell.treeLine.frame = CGRectMake(4.0, 0.0, 4.0f, 90.0f);
    
    // Separator Inset
    CGFloat leftInset = 10 + (8 * floatDepth);
    cell.separatorInset = UIEdgeInsetsMake(.0f, leftInset, .0f, .0f);
    
    // Sharpness
    NSArray *weaponSharpness = [self.weaponList objectAtIndex:indexPath.row][@"weaponSharpness"];

    cell.sharpnessBackground.frame = CGRectMake(4.0, 58.0f, 140.0f, 12.0f);
    CGFloat leftSharpness = 10 + (8 * floatDepth);
    CGRect sharpnessFrame = cell.sharpnessBackground.frame;
    sharpnessFrame.origin.x = leftSharpness;
    cell.sharpnessBackground.frame = sharpnessFrame;

    cell.redSharpness.frame = CGRectMake(0.0f, 1.0f, [weaponSharpness[0] floatValue] * 2, 10.0f);
    cell.orangeSharpness.frame = CGRectMake(cell.redSharpness.frame.origin.x + cell.redSharpness.frame.size.width, 1.0f, [weaponSharpness[1] floatValue] * 2, 10.0f);
    cell.yellowSharpness.frame = CGRectMake(cell.orangeSharpness.frame.origin.x + cell.orangeSharpness.frame.size.width, 1.0f, [weaponSharpness[2] floatValue] * 2, 10.0f);
    cell.greenSharpness.frame = CGRectMake(cell.yellowSharpness.frame.origin.x + cell.yellowSharpness.frame.size.width, 1.0f, [weaponSharpness[3] floatValue] * 2, 10.0f);
    cell.blueSharpness.frame = CGRectMake(cell.greenSharpness.frame.origin.x + cell.greenSharpness.frame.size.width, 1.0f, [weaponSharpness[4] floatValue] * 2, 10.0f);
    cell.whiteSharpness.frame = CGRectMake(cell.blueSharpness.frame.origin.x + cell.blueSharpness.frame.size.width, 1.0f, [weaponSharpness[5] floatValue] * 2, 10.0f);
    cell.purpleSharpness.frame = CGRectMake(cell.whiteSharpness.frame.origin.x + cell.whiteSharpness.frame.size.width, 1.0f, [weaponSharpness[6] floatValue] * 2, 10.0f);
    
    // Sharpness Plus
    NSArray *weaponSharpnessPlus = [self.weaponList objectAtIndex:indexPath.row][@"weaponSharpnessPlus"];
    
    cell.sharpnessPlusBackground.frame = CGRectMake(4.0, 72.0f, 140.0f, 12.0f);
    CGFloat leftSharpnessPlus = 10 + (8 * floatDepth);
    CGRect sharpnessPlusFrame = cell.sharpnessPlusBackground.frame;
    sharpnessPlusFrame.origin.x = leftSharpnessPlus;
    cell.sharpnessPlusBackground.frame = sharpnessPlusFrame;
    
    cell.redSharpnessPlus.frame = CGRectMake(0.0f, 1.0f, [weaponSharpnessPlus[0] floatValue] * 2, 10.0f);
    cell.orangeSharpnessPlus.frame = CGRectMake(cell.redSharpnessPlus.frame.origin.x + cell.redSharpnessPlus.frame.size.width, 1.0f, [weaponSharpnessPlus[1] floatValue] * 2, 10.0f);
    cell.yellowSharpnessPlus.frame = CGRectMake(cell.orangeSharpnessPlus.frame.origin.x + cell.orangeSharpnessPlus.frame.size.width, 1.0f, [weaponSharpnessPlus[2] floatValue] * 2, 10.0f);
    cell.greenSharpnessPlus.frame = CGRectMake(cell.yellowSharpnessPlus.frame.origin.x + cell.yellowSharpnessPlus.frame.size.width, 1.0f, [weaponSharpnessPlus[3] floatValue] * 2, 10.0f);
    cell.blueSharpnessPlus.frame = CGRectMake(cell.greenSharpnessPlus.frame.origin.x + cell.greenSharpnessPlus.frame.size.width, 1.0f, [weaponSharpnessPlus[4] floatValue] * 2, 10.0f);
    cell.whiteSharpnessPlus.frame = CGRectMake(cell.blueSharpnessPlus.frame.origin.x + cell.blueSharpnessPlus.frame.size.width, 1.0f, [weaponSharpnessPlus[5] floatValue] * 2, 10.0f);
    cell.purpleSharpnessPlus.frame = CGRectMake(cell.whiteSharpnessPlus.frame.origin.x + cell.whiteSharpnessPlus.frame.size.width, 1.0f, [weaponSharpnessPlus[6] floatValue] * 2, 10.0f);
    
    // Weapon Name
    CGFloat left = 10 + (8 * floatDepth);
    CGRect detailsFrame = cell.detailedLabel.frame;
    detailsFrame.origin.x = left;
    cell.detailedLabel.frame = detailsFrame;
    cell.detailedLabel.text = [self.weaponList objectAtIndex:indexPath.row][@"weaponName"];
    
    // Weapon Attack
    CGFloat attackLeft = 10 + (8 * floatDepth);
    CGRect attackFrame = cell.attackLabel.frame;
    attackFrame.origin.x = attackLeft;
    cell.attackLabel.frame = attackFrame;
    cell.attackLabel.text = [NSString stringWithFormat:@"DMG: %@", [self.weaponList objectAtIndex:indexPath.row][@"weaponAttack"]];
    [cell.attackLabel sizeToFit];
    
    // Element
    cell.elementImageView.frame = CGRectMake(cell.attackLabel.frame.origin.x + cell.attackLabel.frame.size.width + 3.0f, 32.0f, 16.0f, 16.0f);
    UIImage *elementImage = [self.weaponList objectAtIndex:indexPath.row][@"weaponElement"];
    cell.elementImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", elementImage]];

    // Element Attack
    cell.elementAttackLabel.frame = CGRectMake(cell.elementImageView.frame.origin.x + cell.elementImageView.frame.size.width + 1.0f, 34.0f, 0.0f, 24.0f);
    cell.elementAttackLabel.text = [self.weaponList objectAtIndex:indexPath.row][@"weaponElementAttack"];
    [cell.elementAttackLabel sizeToFit];
    
    // Weapon Affinity
    cell.affinityLabel.text = [NSString stringWithFormat:@"%d%%", [[self.weaponList objectAtIndex:indexPath.row][@"weaponAffinity"] intValue]];
    [cell.affinityLabel sizeToFit];
    
    CGFloat affinityLabelWidth = cell.frame.size.width - (cell.elementAttackLabel.frame.origin.x + cell.elementAttackLabel.frame.size.width);
    cell.affinityLabel.frame = CGRectMake(160.0f, 34.0f, affinityLabelWidth, 24.0f);
    cell.affinityLabel.backgroundColor = [UIColor brownColor];
    [cell.affinityLabel sizeToFit];
    
    // Rarity Line
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
            return [UIColor colorWithRed:184/255.0f green:184/255.0f blue:184/255.0f alpha:1.0f];
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