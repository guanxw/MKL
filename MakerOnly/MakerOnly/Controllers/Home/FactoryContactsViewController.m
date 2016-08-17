//
//  FactoryContactsViewController.m
//  MakerOnly
//
//  Created by Jared on 16/8/11.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "FactoryContactsViewController.h"

@interface FactoryContactsViewController ()

@end

@implementation FactoryContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageNamed:@"icon"];
    self.imageView.layer.cornerRadius = self.imageView.frame.size.width/2;
    self.imageView.layer.masksToBounds = YES;
    
    self.telephoneLabel.text = @"15805316868";
    self.MobilePhoneLabel.text = @"0531-8686868";
    self.emailLabel.text = @"makeronly_ios@makeronly.com";
    self.countryLabel.text = @"China";
    self.provinceLabel.text = @"ShanDong";
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
