//
//  RegisterViewController.m
//  MakerOnly
//
//  Created by Jared on 16/7/20.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Create Account";
    JaredButton *backBtn = [JaredButton shareButton];
    self.navigationItem.leftBarButtonItem = [backBtn setBarButtonItemWithBackButton:backBtn imageName:@"back_black"];
    // 返回按钮事件
    [backBtn addTarget:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

//导航栏返回按钮
- (void)backBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
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
