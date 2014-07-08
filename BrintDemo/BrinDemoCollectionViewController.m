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
    
    self.collectionView.backgroundColor = [UIColor greenColor];
    
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


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BDCollectionCell" forIndexPath:indexPath];
    
    if (nil == cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"BDCollectionCell" owner:nil options:nil];
        cell = (BDCollectionCell *)[nib objectAtIndex:0];
    }
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *view;
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
        view.backgroundColor = [UIColor orangeColor];
    }
    else {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer" forIndexPath:indexPath];
        view.backgroundColor = [UIColor blueColor];
    }
    return view;
}




@end
