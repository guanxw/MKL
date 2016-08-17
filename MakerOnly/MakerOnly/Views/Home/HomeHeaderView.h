//
//  HomeHeaderView.h
//  MakerOnly
//
//  Created by Jared on 16/7/18.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIScrollView *headerScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *headerPageControl;

- (void)initViews;
@end
