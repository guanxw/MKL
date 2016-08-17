//
//  InquiryViewController.m
//  MakerOnly
//
//  Created by Jared on 16/8/5.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "InquiryViewController.h"

@interface InquiryViewController ()<UITextViewDelegate>

@end

@implementation InquiryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UITapGestureRecognizer *hideKeyBoardTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyBoard)];
    [self.view addGestureRecognizer:hideKeyBoardTap];
    
    //设置界面
    [self setUpView];
}

#pragma mark - 设置界面
- (void)setUpView{
    self.scorllView.contentSize = self.view.frame.size;
    self.sendBtn.layer.cornerRadius = 5;
    self.sendBtn.layer.masksToBounds = YES;
    [self.sendBtn addTarget:self action:@selector(sendBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.textView.layer.borderColor = JDRGBAColor(220, 220, 220, 1).CGColor;
    self.textView.layer.borderWidth = 1;
    self.textView.layer.cornerRadius = 5;
    self.textView.layer.masksToBounds = YES;
    
}

- (void)textViewDidChange:(UITextView *)textView{
    if (textView.text.length == 0) {
        self.hintLabel.text = @"请输入内容...";
    }else{
        self.hintLabel.text = @"";
    }
}

#pragma mark - 发送按钮点击事件
- (void)sendBtnClick{
    JDLog(@"发送询盘信息");
}



- (void)hideKeyBoard{
    [self.numberField endEditing:YES];
    [self.textView endEditing:YES];
    [self.emailField endEditing:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
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
