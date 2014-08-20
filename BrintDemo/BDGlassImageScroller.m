//
//  BDGlassImageScroller.m
//  BrintDemo
//
//  Created by Tabrez on 17/08/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BDGlassImageScroller.h"

@interface BDGlassImageScroller ()

@property (nonatomic) NSInteger currentPage;
@property (nonatomic) CGRect initialScrollFrame;

@end


@implementation BDGlassImageScroller

@synthesize baseScrollView;
@synthesize dataSourceArray;
@synthesize imagesArray;
@synthesize currentPage;
@synthesize initialScrollFrame;

#define kInitialOffset 199

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
    // Do any additional setup after loading the view from its nib.
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.view.backgroundColor = [UIColor blackColor];
    
    CGFloat blackSideBarWidth = 2;
    self.initialScrollFrame = self.baseScrollView.frame;
    
    self.baseScrollView.frame = CGRectMake(0, 0, self.baseScrollView.frame.size.width + imagesArray.count * blackSideBarWidth, self.baseScrollView.frame.size.height) ;
    
    self.imagesArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"g37.png"],[UIImage imageNamed:@"j4.png"],[UIImage imageNamed:@"j5.png"],[UIImage imageNamed:@"j6.png"],[UIImage imageNamed:@"j7.png"],[UIImage imageNamed:@"j8.png"],[UIImage imageNamed:@"j9.png"], [UIImage imageNamed:@"g37.png"],[UIImage imageNamed:@"j4.png"],[UIImage imageNamed:@"j5.png"], nil];
    
    [self reloadScrollView];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    int page = currentPage;
    // resize scrollview can cause setContentOffset off for no reason and screw things up
    
    CGFloat blackSideBarWidth = 2;
    [baseScrollView setFrame:CGRectMake(0, 0, self.view.frame.size.width + 2 * blackSideBarWidth, self.view.frame.size.height)];

    [baseScrollView setContentSize:CGSizeMake(imagesArray.count * baseScrollView.frame.size.width, self.view.frame.size.height)];
    
    [baseScrollView setContentOffset:CGPointMake(page * baseScrollView.frame.size.width, baseScrollView.contentOffset.y)];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    currentPage = 0;
    
    [baseScrollView setContentSize:CGSizeMake(imagesArray.count * baseScrollView.frame.size.width, baseScrollView.frame.size.height)];
}


- (void)viewWillLayoutSubviews
{
    // Use this if your base scroll view starts form 0.0.. it'll add padding to scrollview subview till navigation basr..
    
//    for (int index = 0; index < imagesArray.count; index++) {
//        BTGlassScrollView *glassView = [self glassScrollViewForIndex:index];
//        [glassView setTopLayoutGuideLength:[self.topLayoutGuide length]];
//    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)clearScrollView
{
    NSArray *subViews = [baseScrollView subviews];
    
    for (id view in subViews) {
        [view removeFromSuperview];
    }
}


- (void)reloadScrollView
{
    [self clearScrollView];
    
    for (int index = 0; index < imagesArray.count; index++) {
        UIImage *image = [imagesArray objectAtIndex:index];
        
        CGRect frame = baseScrollView.bounds;
        frame.origin.x = index * frame.size.width;
        frame.origin.y = 0;
        
        BTGlassScrollView *glassScrollView = [[BTGlassScrollView alloc] initWithFrame:frame BackgroundImage:image blurredImage:nil viewDistanceFromBottom:120 foregroundView:[self customView:index]];
        glassScrollView.tag = kInitialOffset + index;
        
        [baseScrollView addSubview:glassScrollView];
    }
}


- (UIView *)customView:(NSInteger)index
{
    CGFloat width = initialScrollFrame.size.width;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 720)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, width - 20, 120)];
    [label setText:[NSString stringWithFormat:@"%i℉",arc4random_uniform(20) + 60]];
    [label setTextColor:[UIColor whiteColor]];
    [label setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:120]];
    [label setShadowColor:[UIColor blackColor]];
    [label setShadowOffset:CGSizeMake(1, 1)];
    [label setTextAlignment:NSTextAlignmentCenter];
    [view addSubview:label];
    
    UIView *box1 = [[UIView alloc] initWithFrame:CGRectMake(10, 140, width - 20, 125)];
    box1.layer.cornerRadius = 3;
    box1.backgroundColor = [UIColor colorWithWhite:0 alpha:.15];
    [view addSubview:box1];
    
    UIView *box2 = [[UIView alloc] initWithFrame:CGRectMake(10, 270, width - 20, 300)];
    box2.layer.cornerRadius = 3;
    box2.backgroundColor = [UIColor colorWithWhite:0 alpha:.15];
    [view addSubview:box2];
    
    UIView *box3 = [[UIView alloc] initWithFrame:CGRectMake(10, 575, width - 20, 125)];
    box3.layer.cornerRadius = 3;
    box3.backgroundColor = [UIColor colorWithWhite:0 alpha:.15];
    [view addSubview:box3];
    
    return view;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat ratio = scrollView.contentOffset.x/scrollView.frame.size.width;
    currentPage = (int)floor(ratio);
    if (currentPage < 0) {
        currentPage = 0;
    }
    NSLog(@"%i",currentPage);
    
    BTGlassScrollView *glassView = [self glassScrollViewForIndex:currentPage];
    
    [glassView scrollHorizontalRatio:-ratio + currentPage];
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    CGFloat ratio = scrollView.contentOffset.x/scrollView.frame.size.width;
    NSInteger page = (int)floor(ratio);
    if (page < 0) {
        page = 0;
    }
    
    BTGlassScrollView *glassView = [self glassScrollViewForIndex:page];
    
    for (int index = 0; index < imagesArray.count; index ++) {
        BTGlassScrollView *glassScrollView = [self glassScrollViewForIndex:index];
        [glassScrollView scrollVerticallyToOffset:glassView.foregroundScrollView.contentOffset.y];
    }
}


- (BTGlassScrollView *)glassScrollViewForIndex:(NSInteger)index
{
    BTGlassScrollView *glassScrollView = nil;
    
    NSArray *subViews = [baseScrollView subviews];
    
    for (id view in subViews) {
        if ([view isKindOfClass:[BTGlassScrollView class]]) {
            
            BTGlassScrollView *glassView = (BTGlassScrollView *)view;
            
            if (glassView.tag == (kInitialOffset + index)) {
                glassScrollView = glassView;
                break;
            }
        }
    }
    
    return glassScrollView;
}


@end
