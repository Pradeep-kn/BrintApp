//
//  BrinDemoTabbarController.m
//  BrintDemo
//
//  Created by Tabrez on 13/06/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BrinDemoTabbarController.h"
#import "BrinDemoDiamondSplitViewController.h"
#import "BrinDemoGoldSplitViewController.h"
#import "BrinDemoSettingsViewController.h"
#import "BrinDemoPlatinumSplitViewController.h"
#import "BrinDemoSilverSplitViewController.h"
#import "BIHomeViewController.h"


@interface BrinDemoTabbarController ()

@end


@implementation BrinDemoTabbarController


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
	// Do any additional setup after loading the view.
    
    BIHomeViewController *homeVC = (BIHomeViewController *)[[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateInitialViewController];
    
    BrinDemoGoldSplitViewController *goldSplitVC = (BrinDemoGoldSplitViewController *)[[UIStoryboard storyboardWithName:@"Gold" bundle:nil] instantiateInitialViewController];
    
    BrinDemoDiamondSplitViewController *diamondSplitVC = (BrinDemoDiamondSplitViewController *)[[UIStoryboard storyboardWithName:@"Diamond" bundle:nil] instantiateInitialViewController];
    
    BrinDemoPlatinumSplitViewController *platinumSplitVC = (BrinDemoPlatinumSplitViewController *)[[UIStoryboard storyboardWithName:@"Platinum" bundle:nil] instantiateInitialViewController];
    
    BrinDemoSilverSplitViewController *silverSplitVC = (BrinDemoSilverSplitViewController *)[[UIStoryboard storyboardWithName:@"Silver" bundle:nil] instantiateInitialViewController];
    
    BrinDemoSettingsViewController *settingsVC = (BrinDemoSettingsViewController *)[[UIStoryboard storyboardWithName:@"Settings" bundle:nil] instantiateInitialViewController];
    
    self.viewControllers = [NSArray arrayWithObjects:homeVC, goldSplitVC, diamondSplitVC, platinumSplitVC, silverSplitVC, settingsVC,  nil];
    
    NSArray *barButtonItems = self.tabBar.items;
    
    [[barButtonItems objectAtIndex:0] setTitle:@"HOME"];
    [[barButtonItems objectAtIndex:1] setTitle:@"GOLD"];
    [[barButtonItems objectAtIndex:2] setTitle:@"DIAMOND"];
    [[barButtonItems objectAtIndex:3] setTitle:@"PLATINUM"];
    [[barButtonItems objectAtIndex:4] setTitle:@"SILVER"];
    [[barButtonItems objectAtIndex:5] setTitle:@"SETTINGS"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
