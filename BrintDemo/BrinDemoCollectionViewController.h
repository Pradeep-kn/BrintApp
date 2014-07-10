//
//  BrinDemoCollectionViewController.h
//  BrintDemo
//
//  Created by Pradeep on 04/07/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrinDemoCollectionViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
//@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
