//
//  BrinDemoMasterCell.h
//  BrintDemo
//
//  Created by Pradeep on 07/06/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrinDemoMasterCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLable;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLable;

@end
