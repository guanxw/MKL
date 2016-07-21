//
//  ResultCodeUtil.h
//  Taoxiaoxian
//
//  Created by tangjie on 15/5/26.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonResponseHeader.h"

static NSString * const SUCCESS = @"200";// 处理正常

@interface ResultCodeUtil : NSObject

+ (NSString *)proccessResultCode:(CommonResponseHeader *)responseHeader;

@end
