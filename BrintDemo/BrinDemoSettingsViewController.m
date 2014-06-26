//
//  BrinDemoSettingsViewController.m
//  BrintDemo
//
//  Created by Pradeep on 24/05/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BrinDemoSettingsViewController.h"

@interface BrinDemoSettingsViewController ()

@end

@implementation BrinDemoSettingsViewController

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg2.png"]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
