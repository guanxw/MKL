//
//  MessangerViewController.m
//  MakerOnly
//
//  Created by Jared on 16/7/15.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "MessangerViewController.h"

#import "RecentViewController.h"
#import "ContactsViewController.h"

@interface MessangerViewController ()
@property (nonatomic, strong) UISegmentedControl *segmentCtr;
@property (nonatomic, strong) RecentViewController *rVC;
@property (nonatomic, strong) ContactsViewController *cVC;
@end

@implementation MessangerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    self.title = @"Messanger";
    
    [self setUpSegmented];
}

- (void)setUpSegmented{
    _segmentCtr = [[UISegmentedControl alloc] initWithItems:@[@"Recent", @"Contacts"]];
    _segmentCtr.frame = CGRectMake(0, 0, VIEWFRAME/1.5, 30);
    self.navigationItem.titleView = _segmentCtr;
    _segmentCtr.selectedSegmentIndex = 0;
    _segmentCtr.tintColor = [UIColor orangeColor];
    [_segmentCtr addTarget:self action:@selector(changeSegment:) forControlEvents:(UIControlEventValueChanged)];
    
    [self.view addSubview:_rVC.view];
}

- (void)changeSegment:(UISegmentedControl *)segmentCtr{
    
    switch (segmentCtr.selectedSegmentIndex) {
        case 0:
            
            break;
        case 1:
            
            break;
        default:
            break;
    }
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
