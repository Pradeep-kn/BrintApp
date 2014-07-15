//
//  BrinDemoCollectionViewController.m
//  BrintDemo
//
//  Created by Pradeep on 04/07/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BrinDemoCollectionViewController.h"
#import "BDCollectionCell.h"
#import "BDCollectionFlowLayout.h"
#import "BDCollectionHeaderView.h"
#import "CSStickyHeaderFlowLayout.h"
#import "CSSearchBarHeader.h"


@interface BrinDemoCollectionViewController ()

@end


NSString *const CSSearchBarHeaderIdentifier = @"CSSearchBarHeader";


@implementation BrinDemoCollectionViewController

@synthesize collectionView;


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
    
    [self initializeCollectionView];
}


- (void)initializeCollectionView
{
    // Allocate and configure the layout.
    
    // Register reusable items
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BDCollectionCell class]) bundle:nil]
     forCellWithReuseIdentifier:NSStringFromClass([BDCollectionCell class])];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BDCollectionHeaderView class]) bundle:nil]
     forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
            withReuseIdentifier:NSStringFromClass([BDCollectionHeaderView class])];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CSSearchBarHeader class]) bundle:nil]
          forSupplementaryViewOfKind:CSSearchBarHeaderIdentifier
                 withReuseIdentifier:NSStringFromClass([CSSearchBarHeader class])];
    
    self.collectionView.backgroundColor = [UIColor purpleColor];
    
    [self reloadCollectionView];
}


- (void)reloadCollectionView
{
    [self.collectionView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    BDCollectionHeaderView *view = nil;
    CSSearchBarHeader *searchHeaderView = nil;
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        view = (BDCollectionHeaderView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"BDCollectionHeaderView" forIndexPath:indexPath];
        
        view.backgroundColor = [UIColor orangeColor];
        
        view.titleLabel.text = [NSString stringWithFormat:@"Section = %d", indexPath.section];
        
        return view;
    }
    else if ([kind isEqualToString:CSSearchBarHeaderIdentifier]) {
        searchHeaderView = (CSSearchBarHeader *)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:CSSearchBarHeaderIdentifier forIndexPath:indexPath];
        
        return searchHeaderView;
    }

    return nil;
}



#pragma mark -

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"BDCollectionCell";
    
    BDCollectionCell *cell = (BDCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = BLACK_HALF_TRANSPARENT;
    
//    UIColor *color = nil;
//    
//    if (indexPath.row % 2) {
//        color = [UIColor redColor];
//    }
//    else {
//        color = [UIColor greenColor];
//    }
//    
//    cell.imageView.backgroundColor = color;
    
    cell.imageView.backgroundColor = WHITE_LIGHT;
    
    cell.imageView.image = [UIImage imageNamed:@"j6.png"];
    
   
    return cell;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 50;
}


//-(UICollectionViewController*)nextViewControllerAtPoint:(CGPoint)p
//{
//    return nil;
//}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(215 , 215);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    id object = [pendingImages objectAtIndex:indexPath.row];
//    if ([selectedArray containsObject:object]) {
//        [selectedArray removeObject:object];
//    }else
//    {
//        [selectedArray addObject:object];
//    }
//    
//    [collectionView reloadItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];
//    NSInteger count = pendingImages.count - selectedArray.count;
//    [self.uploadCountButton setTitle:[NSString stringWithFormat:@"%@ (%ld) %@",NSLocalizedString(@"upload", @""),(long)count,NSLocalizedString(@"images", @"")] forState:UIControlStateNormal];
}


//- (UICollectionViewTransitionLayout *)collectionView:(UICollectionView *)collectionView
//                        transitionLayoutForOldLayout:(UICollectionViewLayout *)fromLayout newLayout:(UICollectionViewLayout *)toLayout
//{
//    UICollectionViewTransitionLayout *transitionLayout = [[UICollectionViewTransitionLayout alloc] initWithCurrentLayout:fromLayout nextLayout:toLayout];
//    return transitionLayout;
//}



@end
