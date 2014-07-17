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
    [self modifyUIElements];
    [self backgroundImageAnimation];
}

- (void)modifyUIElements
{
    self.loginView.layer.cornerRadius = 10.0f;
    self.signUpView.layer.cornerRadius = 10.0f;
    self.forgotPasswordView.layer.cornerRadius = 10.0f;
    
    [self addShadowToView:self.loginView];
    [self addShadowToView:self.signUpView];
    [self addShadowToView:self.forgotPasswordView];

    self.loginView.backgroundColor = [self.loginView.backgroundColor colorWithAlphaComponent:0.8f];
    self.signUpView.backgroundColor = [self.signUpView.backgroundColor colorWithAlphaComponent:0.8f];
    self.forgotPasswordView.backgroundColor = [self.forgotPasswordView.backgroundColor colorWithAlphaComponent:0.8f];
}
- (void)addShadowToView:(UIView *)view
{
    CALayer *layer = view.layer;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.masksToBounds = NO;
    layer.shadowOpacity = 0.80f;
    layer.shadowRadius = 10.0f;
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
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

- (IBAction)forgotPasswordSubmitBtnClicked:(id)sender {

    
}
- (IBAction)signUpSubmitBtnClicked:(id)sender {
}
- (IBAction)signUpBtnClicked:(id)sender {
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.loginView.hidden = YES;
        self.signUpView.hidden = NO;
    } completion:^(BOOL finished) {
        ;
    }];
}

- (IBAction)forgotPasswordBtnClicked:(id)sender {
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.loginView.hidden = YES;
        self.forgotPasswordView.hidden = NO;
    } completion:^(BOOL finished) {
        ;
    }];
}

- (IBAction)closeBtnClicked:(id)sender {
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.loginView.hidden = NO;
        self.forgotPasswordView.hidden = YES;
        self.signUpView.hidden = YES;
    } completion:^(BOOL finished) {
        ;
    }];
}
@end
