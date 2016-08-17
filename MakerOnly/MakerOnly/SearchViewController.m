//
//  SearchViewController.m
//  MakerOnly
//
//  Created by 王一 on 16/8/16.
//  Copyright © 2016年 WinnerChao. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.view.backgroundColor = [UIColor yellowColor];
    /**
     * 设置返回按钮图片以及返回的事件
     */
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImage:@"back_black" heighImage:nil target:self action:@selector(tagClick)];
    
    self.navigationItem.title = @"Search Goods";
    
//    
    [self createSearchView];
}
//pop返回到上一控制器
-(void)tagClick{

    [self.navigationController popViewControllerAnimated:YES];


}

//创建搜索视图
-(void)createSearchView{

    UITextField *search = [[UITextField alloc]initWithFrame:CGRectMake(50, 80, 300, 30)];
    
    search.backgroundColor = [UIColor yellowColor];
    
    search.borderStyle = UITextBorderStyleRoundedRect;
    
    
    search.textAlignment = NSTextAlignmentCenter;
    
    search.placeholder = @"Search Goods";
    
    search.autocapitalizationType = UITextFieldViewModeWhileEditing;
    
    [self.view addSubview:search];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
