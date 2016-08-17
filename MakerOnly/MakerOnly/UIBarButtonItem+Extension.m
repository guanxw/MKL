//
//  UIBarButtonItem+Extension.m
//  MakerOnly
//
//  Created by 王一 on 16/8/16.
//  Copyright © 2016年 WinnerChao. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIView+Extension.h"
@implementation UIBarButtonItem (Extension)
+(instancetype)initWithImage:(NSString *)image heighImage:(NSString *)heighImage target:(id)target action:(SEL)action{
    //设置按钮类型  自定义
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置按钮背景图片
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    //设置按钮被选中得图片 高亮图片
    [button setBackgroundImage:[UIImage imageNamed:heighImage ] forState:UIControlStateHighlighted];
    //设置按钮尺寸
    button.size = button.currentBackgroundImage.size;
    //设置按钮的点击事件
    [button addTarget:target   action:action forControlEvents:UIControlEventTouchUpInside];

    return [[self alloc]initWithCustomView:button];
}

@end
