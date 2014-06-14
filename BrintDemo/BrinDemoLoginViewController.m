//
//  BrinDemoLoginViewController.m
//  BrintDemo
//
//  Created by Pradeep on 23/05/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BrinDemoLoginViewController.h"
#import "BrinDemoAppDelegate.h"

@interface BrinDemoLoginViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *loginScrollView;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIImageView *scrollViewImageView;

@end

@implementation BrinDemoLoginViewController

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
    self.navigationController.navigationBarHidden = NO;
    self.loginScrollView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mod.png"]];
    self.loginView.layer.cornerRadius = 10.0f;
    self.loginView.backgroundColor = [self.loginView.backgroundColor colorWithAlphaComponent:0.8f];

    [self backgroundImageAnimation];
}

- (IBAction)loginBtnClicked:(id)sender
{
    ;
}

- (void)backgroundImageAnimation
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSMutableArray *emmaImagesArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"mod.png"],[UIImage imageNamed:@"model2.png"],[UIImage imageNamed:@"LoginRingBg.png"], nil];
        self.scrollViewImageView.animationImages = emmaImagesArray;
        self.scrollViewImageView.animationDuration = 10.0;
        self.scrollViewImageView.animationRepeatCount = 0;
        
        CATransition *transition = [CATransition animation];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionFade;
        
        [self.scrollViewImageView.layer addAnimation:transition forKey:nil];
        [self.scrollViewImageView startAnimating];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonClicked:(id)sender
{
    BrinDemoAppDelegate *appDelegate = (BrinDemoAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate showHomeView];
}

@end
