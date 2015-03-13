//
//  ViewController.m
//  MH4Udb
//
//  Created by Yukai on 3/6/15.
//  Copyright (c) 2015 whitehills. All rights reserved.
//

#import "ViewController.h"

@interface homeCell : UITableViewCell

@end

@implementation homeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"homeCell"];
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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBarHidden = NO;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[homeCell class] forCellReuseIdentifier:@"homeCell"];
    
    self.homeMenu = @[@"Weapons"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.homeMenu.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    homeCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"homeCell"
                                                         forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (cell == nil) {
        cell = [[homeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"homeCell"];
    }
    
    cell.textLabel.text = [self.homeMenu objectAtIndex:indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle:nil];
    UIViewController *vc;
    switch (indexPath.row) {
        case 0:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"weaponTypeView"];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
