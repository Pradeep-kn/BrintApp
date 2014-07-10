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


@interface BrinDemoCollectionViewController ()

@end


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
    
    BDCollectionFlowLayout *layout = [[BDCollectionFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 20.f;
    layout.minimumLineSpacing = 20.f;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsMake(10.f, 20.f, 10.f, 20.f);
    
    // Bigger items for iPad
    layout.itemSize = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? CGSizeMake(120, 120) : CGSizeMake(80, 80);
    
    // uncomment this to see the default flow layout behavior
    //[layout makeBoring];
    
    
    // Allocate and configure a collection view
    
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.bounces = YES;
    collectionView.alwaysBounceVertical = YES;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    
    
    // Register reusable items
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BDCollectionCell class]) bundle:nil]
     forCellWithReuseIdentifier:NSStringFromClass([BDCollectionCell class])];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BDCollectionHeaderView class]) bundle:nil]
     forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
            withReuseIdentifier:NSStringFromClass([BDCollectionHeaderView class])];
    
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


//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    return 100;
//}
//
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    BDCollectionCell *cell = (BDCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"BDCollectionCell" forIndexPath:indexPath];
//    
//    if (nil == cell) {
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"BDCollectionCell" owner:nil options:nil];
//        cell = (BDCollectionCell *)[nib objectAtIndex:0];
//    }
//    
//    cell.backgroundColor = [UIColor redColor];
//    
//    return cell;
//}
//
//
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionReusableView *view;
//    
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
//        view.backgroundColor = [UIColor orangeColor];
//    }
//    else {
//        view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer" forIndexPath:indexPath];
//        view.backgroundColor = [UIColor blueColor];
//    }
//    return view;
//}



#pragma mark - UICollectionView Delegate


//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    // only the height component is used
//    return CGSizeMake(50, 50);
//}
//
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
//{
//    // only the height component is used
//    return CGSizeMake(50, 50);
//}
//
//
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
//    
//    // Upon tapping an item, delete it. If it's the last item (the add cell), add a new one
//}


#pragma mark -

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"BDCollectionCell";
    
    BDCollectionCell *cell = (BDCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    UIColor *color = nil;
    
    if (indexPath.row % 2) {
        color = [UIColor redColor];
    }
    else {
        color = [UIColor greenColor];
    }
    
    cell.imageView.backgroundColor = color;
    
   
    return cell;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


-(UICollectionViewController*)nextViewControllerAtPoint:(CGPoint)p
{
    return nil;
}


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


- (UICollectionViewTransitionLayout *)collectionView:(UICollectionView *)collectionView
                        transitionLayoutForOldLayout:(UICollectionViewLayout *)fromLayout newLayout:(UICollectionViewLayout *)toLayout
{
    UICollectionViewTransitionLayout *transitionLayout = [[UICollectionViewTransitionLayout alloc] initWithCurrentLayout:fromLayout nextLayout:toLayout];
    return transitionLayout;
}





@end
