//
//  LoginViewController.m
//  MakerOnly
//
//  Created by Jared on 16/7/20.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "LoginViewController.h"

#import "RegisterViewController.h"
#import "ForgotPSWViewController.h"
#import "MainViewController.h"
#import "AppDelegate.h"
@interface LoginViewController ()<UIScrollViewDelegate>

@end

@implementation LoginViewController

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self
                                                   name:UIKeyboardWillShowNotification
                                                 object:nil];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self
                                                   name:UIKeyboardWillHideNotification
                                                 object:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardDidShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardWillHideNotification object:nil];
    UITapGestureRecognizer *hideKeyboardTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide)];
    [self.view addGestureRecognizer:hideKeyboardTap];
    
    [self initViews];
    
}

- (void)initViews{
    self.scrollView.contentSize = self.view.frame.size;
//    self.scrollView.delegate = self;
    self.loginBtn.layer.cornerRadius = 5;
    self.loginBtn.layer.masksToBounds = YES;
    
    self.passwordField.secureTextEntry = YES;
    
    [self.loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    [self.registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    [self.fortgotPWDBtn addTarget:self action:@selector(fortgotPWDBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
}

//登录按钮事件
- (void)loginBtnClick{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    MainViewController *mVC = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    appDelegate.window.rootViewController = mVC;
    
}

//注册按钮事件
- (void)registerBtnClick{
    RegisterViewController *rVC = [[RegisterViewController alloc] initWithNibName:@"RegisterViewController" bundle:nil];
    UINavigationController *nVC = [[UINavigationController alloc] initWithRootViewController:rVC];
    [self presentViewController:nVC animated:YES completion:nil];
}

// 忘记密码事件
- (void)fortgotPWDBtnClick{
    ForgotPSWViewController *forgotPWSVC = [[ForgotPSWViewController alloc] initWithNibName:@"ForgotPSWViewController" bundle:nil];
    UINavigationController *nVC = [[UINavigationController alloc] initWithRootViewController:forgotPWSVC];
    
    [self presentViewController:nVC animated:YES completion:nil];
}

- (void)keyBoardDidShow:(NSNotification *)notification{
    NSDictionary *userInfo = [notification userInfo];
    CGSize keyboardSize = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    UIEdgeInsets contectInset = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0);
    self.scrollView.contentInset = contectInset;
    self.scrollView.scrollIndicatorInsets = contectInset;
}

- (void)keyboardDidHide:(NSNotification *)notification{
    UIEdgeInsets contentInset = UIEdgeInsetsZero;
    self.scrollView.contentInset = UIEdgeInsetsZero;
    self.scrollView.scrollIndicatorInsets = contentInset;
}

- (void)keyboardHide{
    [self.userNameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
