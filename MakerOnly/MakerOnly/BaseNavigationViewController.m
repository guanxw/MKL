//
//  BaseNavigationViewController.m
//  MakerOnly
//
//  Created by 王一 on 16/8/16.
//  Copyright © 2016年 WinnerChao. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

+(void)initialize{
    
    // 当导航栏用在NavigationController中, appearance设置才会生效
    //    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:[self class], nil];
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}
/**
 *  可以在这个方法中拦截所有 push 进来的控制器
 */

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //判断 push 进来的是否是第一个控制器,若不是第一个则隐藏 TabBar
    if (self.childViewControllers.count>0) {
        //创建按钮,类型自定义
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        //设置按钮标题,和按钮属性
        [button setTitle:@"Back" forState:UIControlStateNormal];
        //设置按钮图片
        [button setImage:[UIImage imageNamed:@"back_black"] forState:UIControlStateNormal];
//        //设置按钮选中图片
//        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        //设置按钮大小
//        button.size = CGSizeMake(70, 30);
        //按钮内部内容全部左对齐
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //是按钮向左偏移10
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        //设置按钮标题字体的颜色
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //设置按钮被选中的高亮颜色
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        //添加按钮事件
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        //将所有的按钮标题都设置为返回(setTitle)
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
        //隐藏 TabBar
        viewController.hidesBottomBarWhenPushed = YES;
        
    }

    //若是第一个控制器,则直接 push 进来
    [super pushViewController:viewController animated:animated];

}
-(void)back{
    [self popViewControllerAnimated:YES];



}

@end
