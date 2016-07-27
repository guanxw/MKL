//
//  JaredButton.m
//  JaredButton
//
//  Created by Jared on 16/7/26.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "JaredButton.h"

@implementation JaredButton

+ (instancetype)shareButton{
    return [JaredButton buttonWithType:(UIButtonTypeCustom)];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        [self addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return self;
}

- (void)click:(JaredButton *)btn{
    if (self.block) {
        self.block();
    }
}

- (void)addTarget:(JaredButtonBlock)block{
    self.block = block;
}

#pragma mark -- 封装导航栏返回按钮
- (UIBarButtonItem *)setBarButtonItemWithBackButton:(JaredButton *)button
                                          imageName:(NSString *)imageName{
    JaredButton *backBtn = [[JaredButton alloc] init];
    backBtn = button;
    backBtn.frame = CGRectMake(0, 0, 30, 30);
    [backBtn setBackgroundImage:[UIImage imageNamed:imageName] forState:(UIControlStateNormal)];
    UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    return leftBarBtn;
}

@end
