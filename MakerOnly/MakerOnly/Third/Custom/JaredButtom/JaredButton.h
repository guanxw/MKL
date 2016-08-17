//
//  JaredButton.h
//  JaredButton
//
//  Created by Jared on 16/7/26.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^JaredButtonBlock) (void);

@interface JaredButton : UIButton

@property (nonatomic, strong) JaredButtonBlock block;

+ (instancetype)shareButton;

- (void)addTarget:(JaredButtonBlock)block;

#pragma mark -- 封装导航栏返回按钮
- (UIBarButtonItem *)setBarButtonItemWithBackButton:(JaredButton *)button
                                          imageName:(NSString *)imageName;

@end
