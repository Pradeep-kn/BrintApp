//
//  BrinDemoHomePageViewController.m
//  BrintDemo
//
//  Created by Pradeep on 17/07/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BrinDemoHomePageViewController.h"
#import "HomeScreenApi.h"
#import "WebService.h"

@interface BrinDemoHomePageViewController ()

@end

@implementation BrinDemoHomePageViewController
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
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg4.png"]];
    self.navigationController.navigationBarHidden = YES;

    self.homeDetailView.layer.cornerRadius = 6.0f;
    self.offersView.layer.cornerRadius = 6.0f;
    
    self.carousel.type = iCarouselTypeCylinder;
    [self callHomeScreensApi];
    [[BDUtility sharedInstance] addShadowToView:self.costBgView];
    [[BDUtility sharedInstance] addShadowToView:self.homeDetailView];
    [[BDUtility sharedInstance] addShadowToView:self.offersView];

	// Do any additional setup after loading the view.
}

- (void)callHomeScreensApi
{
    HomeScreenApi *homeScreensApi = [[HomeScreenApi alloc] init];
    _imagesArray = [[NSMutableArray alloc] init];
    [[WebService sharedInstance] getRequest:homeScreensApi andCallback:^(APIBase *apiObject, id JSON, NSError *error) {
        for (HomeScreenDetails *homeScreensDetails in homeScreensApi.homeScreenArray) {
            //            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:offersDetails.offer_image]]];
            [_imagesArray addObject:homeScreensDetails];
        }
        //        [self offersImageAnimationWithImages:_imagesArray];
    }];
}


//- (void)callOffersApi
//{
//    OffersApi *offersApi = [[OffersApi alloc] init];
//    _imagesArray = [[NSMutableArray alloc] init];
//    [[WebService sharedInstance] getRequest:offersApi andCallback:^(APIBase *apiObject, id JSON, NSError *error) {
//        for (OffersDetails *offersDetails in offersApi.offersArray) {
////            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:offersDetails.offer_image]]];
//            [_imagesArray addObject:offersDetails.offer_image];
//        }
////        [self offersImageAnimationWithImages:_imagesArray];
//    }];
//}

- (void)offersImageAnimationWithImages:(NSMutableArray *)imagesArray
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.offersImageView.animationImages = imagesArray;
        self.offersImageView.animationDuration = 10.0;
        self.offersImageView.animationRepeatCount = 0;
        self.offersImageView.contentMode = UIViewContentModeScaleAspectFit;

        CATransition *transition = [CATransition animation];
        transition.duration = 4.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        transition.type = kCATransitionReveal;
        
        [self.offersView.layer addAnimation:transition forKey:nil];
        [self.offersImageView startAnimating];
    });
}


- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    self.arrayOfImages = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"banner1.png"],[UIImage imageNamed:@"banner2.png"],[UIImage imageNamed:@"banner3.png"],[UIImage imageNamed:@"banner4.png"],[UIImage imageNamed:@"banner5.png"],[UIImage imageNamed:@"banner6.png"], nil];

    return [self.arrayOfImages count];
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"Index == %li",(long)index);
}

- (void)carouselDidEndDecelerating:(iCarousel *)carousel{
    NSLog(@"carousel currentItemAt Index = %li",(long)carousel.currentItemIndex);
}
- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel{
    NSLog(@"carousel currentItemAt Index = %li",(long)carousel.currentItemIndex);
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    //create new view if no view is available for recycling
    if (view == nil)
    {
        FXImageView *imageView = [[FXImageView alloc] initWithFrame:CGRectMake(self.carousel.frame.origin.x, self.carousel.frame.origin.y, self.carousel.frame.size.width, self.carousel.frame.size.height - 70)];
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
    
    return view;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateBtnClicked:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Gold price" message:[NSString stringWithFormat:@"Selected gold price is"] delegate:self cancelButtonTitle:[NSString stringWithFormat:@"OK"] otherButtonTitles: nil];
    [alertView show];
}
@end
