//
//  BrinDemoDiamondMasterViewController.m
//  BrintDemo
//
//  Created by Pradeep on 05/06/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BrinDemoDiamondMasterViewController.h"

@interface BrinDemoDiamondMasterViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BrinDemoDiamondMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    //    CGFloat topLayoutGuide = self.topLayoutGuide.length + self.tabBarController.navigationController.navigationBar.frame.size.height;
    //    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.tableView.layer.borderWidth = 2.0f;
    self.tableView.layer.borderColor = [UIColor blackColor].CGColor;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"HomeBg.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"BrinDemoMasterCell";
    BrinDemoMasterCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"BrinDemoMasterCell" owner:self options:nil][0];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"HomeBg.png"]];
    //For transparent background view//
    //    cell.contentView.backgroundColor = [cell.contentView.backgroundColor colorWithAlphaComponent:0.6f];
    
    cell.titleLable.text = [NSString stringWithFormat:@"Gold Item = %d", indexPath.row];
    cell.subTitleLable.text = [NSString stringWithFormat:@"22 kr"];
    cell.descriptionLable.text = [NSString stringWithFormat:@"Making charge = %d%%, wastage = 2.3%%", indexPath.row];
    cell.descriptionLable.numberOfLines = 0;
    [cell.descriptionLable sizeToFit];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
