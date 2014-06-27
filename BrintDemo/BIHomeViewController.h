//
//  BIHomeViewController.h
//  BrintDemo
//
//  Created by Tabrez on 10/06/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"


@interface BIHomeViewController : UIViewController < iCarouselDataSource, iCarouselDelegate >

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *homeInfoView;
@property (weak, nonatomic) IBOutlet UIView *offersInfoView;
@property (weak, nonatomic) IBOutlet UIView *collectionsInfoView;
@property (weak, nonatomic) IBOutlet UIView *costInfoView;
@property (weak, nonatomic) IBOutlet iCarousel *collectionsCarouselView;

@end
