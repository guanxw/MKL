//
//  CenterHeaderView.h
//  MakerOnly
//
//  Created by Jared on 16/7/15.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CenterHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *setBtn;
@property (weak, nonatomic) IBOutlet UIView *productView;
@property (weak, nonatomic) IBOutlet UIView *companiesView;
@property (weak, nonatomic) IBOutlet UIView *browsingView;
@property (weak, nonatomic) IBOutlet UILabel *productNum;
@property (weak, nonatomic) IBOutlet UILabel *companiesNum;
@property (weak, nonatomic) IBOutlet UILabel *browsingNum;
- (void)initViews;

@end
