//
//  FactoryProfileViewController.m
//  MakerOnly
//
//  Created by Jared on 16/8/11.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "FactoryProfileViewController.h"

@interface FactoryProfileViewController ()

@end

@implementation FactoryProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageNamed:@"icon"];
    self.brandNameLabel.text = @"SINOTRUK";
    self.annualLabel.text = @"US$18000000.00";
    self.dataLabel.text = @"2001-01-10";
    self.numberLabel.text = @"2000 persons";
    self.mainPrductsLabel.text = @"Dump truck, Tractor truck";
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
