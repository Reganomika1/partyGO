//
//  SideBarTableViewCell.h
//  MyParty
//
//  Created by Zakhar on 7/17/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideBarTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellTextLabel;
@property (weak, nonatomic) IBOutlet UIView *selectedCellView;


@end
