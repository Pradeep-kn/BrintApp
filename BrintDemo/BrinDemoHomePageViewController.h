//
//  BrinDemoHomePageViewController.h
//  BrintDemo
//
//  Created by Pradeep on 17/07/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "FXImageView.h"

@interface BrinDemoHomePageViewController : UIViewController<iCarouselDataSource, iCarouselDelegate>
@property (weak, nonatomic) IBOutlet iCarousel *carousel;
@property (weak, nonatomic) IBOutlet UIView *homeDetailView;
@property (weak, nonatomic) IBOutlet UIView *offersView;
@property (strong, nonatomic) NSMutableArray *arrayOfImages;
@property (weak, nonatomic) IBOutlet UIImageView *offersImageView;

@end
