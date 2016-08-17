//
//  MainViewController.m
//  MakerOnly
//
//  Created by Jared on 16/7/15.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "MainViewController.h"

#import "HomeViewController.h"
#import "MessangerViewController.h"
#import "MyCenterViewController.h"
#import "SourceViewController.h"

#import "BaseNavigationViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    [self initNavController];
}

#pragma mark -封装UITabBarItem
- (UITabBarItem *)itemWithTitle:(NSString *)title
                          image:(UIImage *)image
                  selectedImage:(UIImage *)selectedImage{
    UITabBarItem *tabBarItem ;
    if (SYSTEM_VERSION_IOS >= 7.0) {
        image = [image imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        selectedImage = [selectedImage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:selectedImage];
    }else{
        tabBarItem = [[UITabBarItem alloc] init];
        [tabBarItem setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:image];
    }
    return tabBarItem;
}
#pragma mark -加载UINavigationController
- (void)initNavController{
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor darkGrayColor],NSForegroundColorAttributeName, nil] forState:UIControlStateHighlighted];
    
    HomeViewController *hVC = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    self.homeNav = [[BaseNavigationViewController alloc] initWithRootViewController:hVC];
    self.homeNav.tabBarItem = [self itemWithTitle:@"Home" image:[UIImage imageNamed:@"makeronly_home_n"] selectedImage:[UIImage imageNamed:@"makeronly_home_p"]];
    
    MessangerViewController *mVC = [[MessangerViewController alloc] initWithNibName:@"MessangerViewController" bundle:nil];
    self.messangerNav = [[BaseNavigationViewController alloc] initWithRootViewController:mVC];
    self.messangerNav.tabBarItem = [self itemWithTitle:@"Messanger" image:[UIImage imageNamed:@"makeronly_messenger_n"] selectedImage:[UIImage imageNamed:@"makeronly_messenger_p"]];
    
    MyCenterViewController *mcVC = [[MyCenterViewController alloc] initWithNibName:@"MyCenterViewController" bundle:nil];
    self.myCenterNav = [[BaseNavigationViewController alloc] initWithRootViewController:mcVC];
    self.myCenterNav.tabBarItem = [self itemWithTitle:@"Center" image:[UIImage imageNamed:@"makeronly_mymkl_n"] selectedImage:[UIImage imageNamed:@"makeronly_mymkl_p"]];
    
    SourceViewController *sVC = [[SourceViewController alloc] initWithNibName:@"SourceViewController" bundle:nil];
    self.sourceNav = [[BaseNavigationViewController alloc] initWithRootViewController:sVC];
    self.sourceNav.tabBarItem = [self itemWithTitle:@"Source" image:[UIImage imageNamed:@"makeronly_source_n"] selectedImage:[UIImage imageNamed:@"makeronly_source_p"]];
    
    self.viewControllers = [NSArray arrayWithObjects:self.homeNav,self.sourceNav,self.messangerNav,self.myCenterNav, nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
