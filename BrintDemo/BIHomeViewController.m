//
//  BIHomeViewController.m
//  BrintDemo
//
//  Created by Tabrez on 10/06/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BIHomeViewController.h"
#import "HomePageController.h"
#import "BDCollectionInfo.h"
#import "BDCollectionView.h"

@interface BIHomeViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *collectionsScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *collectionsImageView;
@property (weak, nonatomic) IBOutlet UILabel *collectionLable;
@property (strong, nonatomic) NSMutableArray *corouselDataSource;

@end


@implementation BIHomeViewController


@synthesize containerView;
@synthesize homeInfoView;
@synthesize offersInfoView;
@synthesize collectionsInfoView;
@synthesize corouselDataSource;


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
    
    self.containerView.backgroundColor = BLACK_COLOR;
    
    self.corouselDataSource = [NSMutableArray array];
    
    for (int i = 0; i < 10; i++) {
        BDCollectionInfo *info = [[BDCollectionInfo alloc] init];
        [self.corouselDataSource addObject:info];
    }
    
    [self addGradientColourToInfoViews];
    [self backgroundImageAnimation];
}

- (void)backgroundImageAnimation
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSMutableArray *emmaImagesArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"banner1.png"],[UIImage imageNamed:@"banner2.png"],[UIImage imageNamed:@"banner3.png"],[UIImage imageNamed:@"banner4.png"],[UIImage imageNamed:@"banner5.png"],[UIImage imageNamed:@"banner6.png"], nil];
        self.collectionsImageView.animationImages = emmaImagesArray;
        self.collectionsImageView.animationDuration = 10.0;
        self.collectionsImageView.animationRepeatCount = 0;
        
        CATransition *transition = [CATransition animation];
        transition.duration = 4.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        transition.type = kCATransitionReveal;
        
        [self.collectionsScrollView.layer addAnimation:transition forKey:nil];
        [self.collectionsImageView startAnimating];
    });
}

- (void)addGradientColourToInfoViews
{
    CAGradientLayer *homeInfoLayer = [CAGradientLayer layer];
    homeInfoLayer.frame = self.homeInfoView.bounds;
    
    homeInfoLayer.colors = [NSArray arrayWithObjects:(id)[AUTUMN1 CGColor], (id)[AUTUMN2 CGColor], nil];
    [self.homeInfoView.layer insertSublayer:homeInfoLayer atIndex:0];
    
//    self.homeInfoView.backgroundColor = [self.homeInfoView.backgroundColor colorWithAlphaComponent:0.6f];

    
    CAGradientLayer *offersLayer = [CAGradientLayer layer];
    offersLayer.frame = self.offersInfoView.bounds;
    
    offersLayer.colors = [NSArray arrayWithObjects:(id)[SUMMER1 CGColor], (id)[SUMMER2 CGColor], nil];
    [self.offersInfoView.layer insertSublayer:offersLayer atIndex:0];

    self.collectionsInfoView.backgroundColor = [UIColor blackColor];
    
//    CAGradientLayer *collectionsLayer = [CAGradientLayer layer];
//    collectionsLayer.frame = self.collectionsInfoView.bounds;
//    
//    collectionsLayer.colors = [NSArray arrayWithObjects:(id)[WINTER1 CGColor], (id)[WINTER2 CGColor], nil];
//    [self.collectionsInfoView.layer insertSublayer:collectionsLayer atIndex:0];
}


/*
 
 case ThemeAutumn:
 colorArray = [NSArray arrayWithObjects:(id)[AUTUMN1 CGColor], (id)[AUTUMN2 CGColor], nil];
 break;
 
 case ThemeOceanDepths:
 colorArray = [NSArray arrayWithObjects:(id)[OCEANDEPTHS1 CGColor], (id)[OCEANDEPTHS2 CGColor], nil];
 break;
 
 case ThemePinkPanther:
 colorArray = [NSArray arrayWithObjects:(id)[PINKPANTHER1 CGColor], (id)[PINKPANTHER2 CGColor], nil];
 break;
 
 case ThemeSpring:
 colorArray = [NSArray arrayWithObjects:(id)[SPRING1 CGColor], (id)[SPRING2 CGColor], nil];
 break;
 
 case ThemeSummer:
 colorArray = [NSArray arrayWithObjects:(id)[SUMMER1 CGColor], (id)[SUMMER2 CGColor], nil];
 break;
 
 case ThemeWinter:
 colorArray = [NSArray arrayWithObjects:(id)[WINTER1 CGColor], (id)[WINTER2 CGColor], nil];
 break;
 
 */


#pragma mark - iCarousel delegate and data source methods..

#pragma mark -
#pragma mark iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [corouselDataSource count];
}


- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        //don't do anything specific to the index within
        //this `if (view == nil) {...}` statement because the view will be
        //recycled and used with other index values later
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
        ((UIImageView *)view).image = [UIImage imageNamed:@"page.png"];
        view.contentMode = UIViewContentModeCenter;
        view.backgroundColor = [UIColor yellowColor];
        
        label = [[UILabel alloc] initWithFrame:view.bounds];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [label.font fontWithSize:50];
        label.tag = 1;
        [view addSubview:label];
    }
    else
    {
        //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    label.text = @"1";
    
    return view;
    
    
    BDCollectionView *collecttionView = (BDCollectionView *)view;
     
    //UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (collecttionView == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"BDCollectionView" owner:nil options:nil];
        collecttionView = (BDCollectionView *)[nib objectAtIndex:0];
    }
    else {
        //get a reference to the label in the recycled view
    }
    
    
    if (index % 2) {
        collecttionView.backgroundColor = [UIColor redColor];
    }
    else {
        collecttionView.backgroundColor = [UIColor purpleColor];
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    
    //label.text = [items[index] stringValue];
    
    
    return collecttionView;
}


- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
    //note: placeholder views are only displayed on some carousels if wrapping is disabled
    return 2;
}


- (UIView *)carousel:(iCarousel *)carousel placeholderViewAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        //don't do anything specific to the index within
        //this `if (view == nil) {...}` statement because the view will be
        //recycled and used with other index values later
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
        ((UIImageView *)view).image = [UIImage imageNamed:@"page.png"];
        view.contentMode = UIViewContentModeCenter;
        view.backgroundColor = [UIColor yellowColor];
        
        label = [[UILabel alloc] initWithFrame:view.bounds];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [label.font fontWithSize:50];
        label.tag = 1;
        [view addSubview:label];
    }
    else
    {
        //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    label.text = @"12";
    
    return view;
    
     
    BDCollectionView *collecttionView = (BDCollectionView *)view;
    
    //UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (collecttionView == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"BDCollectionView" owner:nil options:nil];
        collecttionView = (BDCollectionView *)[nib objectAtIndex:0];
    }
    else {
        //get a reference to the label in the recycled view
    }
    
    
    if (index % 2) {
        collecttionView.backgroundColor = [UIColor redColor];
    }
    else {
        collecttionView.backgroundColor = [UIColor purpleColor];
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    
    //label.text = [items[index] stringValue];
    
    
    return collecttionView;
}


//- (CATransform3D)carousel:(iCarousel *)_carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
//{
//    //implement 'flip3D' style carousel
//    transform = CATransform3DRotate(transform, M_PI / 8.0f, 0.0f, 1.0f, 0.0f);
//    return CATransform3DTranslate(transform, 0.0f, 0.0f, offset * collectionsCarouselView.itemWidth);
//}



- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionSpacing)
    {
        return value * 1.1f;
    }
    return value;
}





/*
 
- (CGFloat)carousel:(iCarousel *)_carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    //customize carousel display
    switch (option)
    {
        case iCarouselOptionWrap: {
            //normally you would hard-code this to YES or NO
            return YES;
        }
        case iCarouselOptionSpacing: {
            //add a bit of spacing between the item views
            return value * 1.05f;
        }
        case iCarouselOptionFadeMax: {
            if (collectionsCarouselView.type == iCarouselTypeCustom) {
                //set opacity based on distance from camera
                return 0.0f;
            }
            return 0.0f;
        }
        case iCarouselOptionFadeMin: {
            return 0.0f;
        }
        default:
        {
            return value;
        }
    }
}

 */

#pragma mark -
#pragma mark iCarousel taps

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    NSNumber *item = (self.corouselDataSource)[index];
    NSLog(@"Tapped view number: %@", item);
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc
{
    //it's a good idea to set these to nil here to avoid
    //sending messages to a deallocated viewcontroller
}



@end
