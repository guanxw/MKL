//
//  BrowingTableViewCell.h
//  MakerOnly
//
//  Created by Jared on 16/8/3.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowingTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewCell;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *pruductOriginLabel;


@end
