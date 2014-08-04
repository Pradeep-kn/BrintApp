//
//  BDImageScrollerVC.m
//  BrintDemo
//
//  Created by Tabrez on 03/08/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BDImageScrollerVC.h"
#import "BDScrollerCell.h"
#import "BDCollectionItemInfo.h"

@interface BDImageScrollerVC ()

@property (strong, nonatomic) NSMutableArray *imagesArray;

@end


@implementation BDImageScrollerVC

@synthesize dataSourceArray;
@synthesize imagesArray;


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
    
    [self.imageCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BDScrollerCell class]) bundle:nil]
              forCellWithReuseIdentifier:NSStringFromClass([BDScrollerCell class])];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.imagesArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"g37.png"],[UIImage imageNamed:@"j4.png"],[UIImage imageNamed:@"j5.png"],[UIImage imageNamed:@"j6.png"],[UIImage imageNamed:@"j7.png"],[UIImage imageNamed:@"j8.png"],[UIImage imageNamed:@"j9.png"], [UIImage imageNamed:@"g37.png"],[UIImage imageNamed:@"j4.png"],[UIImage imageNamed:@"j5.png"], nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    NSInteger sections = [self.dataSourceArray count];
    
    // Remove this once you get data source..
    sections = 1;
    
    DBLog(@"sections = %d",sections);
    
    return sections;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger items = 0;
    
    if (section < self.dataSourceArray.count) {
        NSMutableArray *sectionArray = [dataSourceArray objectAtIndex:section];
        items = [sectionArray count];
    }
    
    // Remove this once you get data source..
    items = imagesArray.count;

    return items;
}


- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BDScrollerCell *cell = nil;
    static NSString *cellIdentifier = @"BDScrollerCell";
    
    cell = (BDScrollerCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    BDCollectionItemInfo *info = [self.dataSourceArray objectAtIndex:indexPath.row];
    
    
    if (indexPath.row % 2) {
        cell.backgroundColor = [UIColor greenColor];
    }
    else {
        cell.backgroundColor = [UIColor yellowColor];
    }
    
    cell.imageView.image = [imagesArray objectAtIndex:indexPath.row];
    
//    [cell.imageView setImageWithURL:[NSURL imageUrlFromString:info.imageUrl] placeholderImage:nil success:^(UIImage *image, BOOL cached) {
//        DBLog(@"sucess = %@, cached = %d",image, cached);
//    } failure:^(NSError *error) {
//        DBLog(@"error = %@",[error localizedDescription]);
//    }];
    
    
    return cell;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(1023, 610);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.0f;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.0f;
}


#pragma mark - UICollectionView Delegate


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ;
}



@end
