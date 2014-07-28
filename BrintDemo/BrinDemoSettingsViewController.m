//
//  BrinDemoSettingsViewController.m
//  BrintDemo
//
//  Created by Pradeep on 24/05/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BrinDemoSettingsViewController.h"
#include "FXImageView.h"

@interface BrinDemoSettingsViewController ()

@property (strong, nonatomic) NSMutableArray *arrayOfImages;
@property (strong, nonatomic) NSMutableArray *arrayOfImagesNames;

@end

@implementation BrinDemoSettingsViewController
@synthesize arrayOfImages;

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
    self.iCarouselView.type = iCarouselTypeCoverFlow;
    [[BDUtility sharedInstance] addShadowToView:self.calculatorView];
    self.calculatorView.backgroundColor = WHITE_HALF_TRANSPARENT;
    [[BDUtility sharedInstance] addShadowToView:self.enlargedImageBgView];
    [[BDUtility sharedInstance] addShadowToView:self.enlargedImageView];
    self.enlargedImageBgView.backgroundColor = WHITE_LIGHT;

    self.enlargedImageBgView.layer.cornerRadius = 20.0f;
    self.enlargedImageView.layer.cornerRadius = 20.0f;
    self.enlargedImageBgView.hidden = YES;
}


- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    self.arrayOfImages = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"banner1.png"],[UIImage imageNamed:@"banner2.png"],[UIImage imageNamed:@"banner3.png"],[UIImage imageNamed:@"banner4.png"],[UIImage imageNamed:@"banner5.png"],[UIImage imageNamed:@"banner6.png"], nil];
    self.arrayOfImagesNames = [[NSMutableArray alloc] initWithObjects:@"banner 1",@"banner 2",@"banner 3",@"banner 4",@"banner 5",@"banner 6", nil];

    return [self.arrayOfImages count];
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"Index == %li",(long)index);
    self.enlargedImageView.image = [self.arrayOfImages objectAtIndex:index];
    [UIView animateWithDuration:1.0f delay:0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.enlargedImageBgView.hidden = NO;
    } completion:^(BOOL finished) {
        ;
    }];
}

- (void)carouselDidEndDecelerating:(iCarousel *)carousel{
    NSLog(@"carousel currentItemAt Index = %li",(long)carousel.currentItemIndex);
    self.itemLable.text  = [NSString stringWithFormat:@"%@",[self.arrayOfImagesNames objectAtIndex:(long)carousel.currentItemIndex]];
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel{
    NSLog(@"carousel currentItemAt Index = %li",(long)carousel.currentItemIndex);
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    //create new view if no view is available for recycling
    if (view == nil)
    {
        FXImageView *imageView = [[FXImageView alloc] initWithFrame:CGRectMake(self.iCarouselView.frame.origin.x, self.iCarouselView.frame.origin.y, self.iCarouselView.frame.size.width, self.iCarouselView.frame.size.height - 70)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.asynchronous = YES;
        imageView.reflectionScale = 0.5f;
        imageView.reflectionAlpha = 0.25f;
        imageView.reflectionGap = 10.0f;
        imageView.shadowOffset = CGSizeMake(0.0f, 2.0f);
        imageView.shadowBlur = 5.0f;
        imageView.cornerRadius = 5.0f;
        view = imageView;
    }
    
    //show placeholder
    ((FXImageView *)view).processedImage = [UIImage imageNamed:@"placeholder.png"];
    
    //set image
    ((FXImageView *)view).image = arrayOfImages[index];
    self.itemLable.text  = [NSString stringWithFormat:@"%@",[self.arrayOfImagesNames objectAtIndex:0]];

    return view;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)closeButtonClicked:(id)sender {
    [UIView animateWithDuration:1.0f delay:0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.enlargedImageBgView.hidden = YES;
    } completion:^(BOOL finished) {
        ;
    }];
}
@end
