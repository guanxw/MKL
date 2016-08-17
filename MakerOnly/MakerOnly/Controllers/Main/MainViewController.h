//
//  MainViewController.h
//  MakerOnly
//
//  Created by Jared on 16/7/15.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UITabBarController

@property (nonatomic, strong) UINavigationController *homeNav;
@property (nonatomic, strong) UINavigationController *sourceNav;
@property (nonatomic, strong) UINavigationController *messangerNav;
@property (nonatomic, strong) UINavigationController *myCenterNav;

@end
