//
//  BIHomeViewController.m
//  BrintDemo
//
//  Created by Tabrez on 10/06/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BIHomeViewController.h"
#import "SVSegmentedControl.h"
#import "HomePageController.h"


@interface BIHomeViewController ()

@end

@implementation BIHomeViewController


@synthesize containerView;


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
    
    [self.navigationController.tabBarItem setTitle:@"HOME"];
    
    [self addSegmentControl];
}


- (void)addSegmentControl
{
    SVSegmentedControl *yellowRC = [[SVSegmentedControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:@"Home", @"Offers", @"Collections", @"Boutique", @"Media Room", @"Search", nil]];
    [yellowRC addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
	yellowRC.crossFadeLabelsOnDrag = YES;
	yellowRC.font = [UIFont fontWithName:@"Marker Felt" size:22];
	yellowRC.titleEdgeInsets = UIEdgeInsetsMake(0, 14, 0, 14);
	yellowRC.height = 70;
    [yellowRC setSelectedSegmentIndex:0 animated:NO];
	yellowRC.thumb.tintColor = [UIColor colorWithRed:0.999 green:0.889 blue:0.312 alpha:1.000];
	yellowRC.thumb.textColor = [UIColor blackColor];
	yellowRC.thumb.textShadowColor = [UIColor colorWithWhite:1 alpha:0.5];
	yellowRC.thumb.textShadowOffset = CGSizeMake(0, 1);
	
//    yellowRC.center = CGPointMake(self.view.frame.size.width/2, 110);
    
    int width = 800;
    
    yellowRC.frame = CGRectMake(110, 75, width, 70);
	
    [self.view addSubview:yellowRC];
    
    [yellowRC setSelectedSegmentIndex:0 animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)segmentedControlChangedValue:(SVSegmentedControl *)segmentedControl
{
    
    int selectedIndex = segmentedControl.selectedSegmentIndex;
    
    switch (selectedIndex) {
        case 0: {
            HomePageController *pageController = [[HomePageController alloc] init];
            [self.containerView addSubview:pageController.view];
            
            break;
        }
            
        default:
            break;
    }
    
    /*
    
    UIViewController *destinationController = self.destinationViewController;
    
    destinationController.navigationController.navigationBarHidden = YES;
    
    [self addChildViewController:destinationController];
    
    [self.containerView addSubview:destinationController.view]; // or something like this.
    
    [destinationController didMoveToParentViewController:self];
     
    */
}

@end
