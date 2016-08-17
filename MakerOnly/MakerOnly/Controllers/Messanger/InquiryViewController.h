//
//  InquiryViewController.h
//  MakerOnly
//
//  Created by Jared on 16/8/5.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InquiryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scorllView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;
@property (weak, nonatomic) IBOutlet UILabel *hintLabel;

@end
