//
//  CommonResponseErrorBean.h
//  Taoxiaoxian
//
//  Created by tangjie on 15/5/26.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 1.服务器返回code!=200,根据服务器返回信息自动填充CommonResponseErrorBean
 * 2.没有连上服务器也没有code返回,手动填充信息返回
 */

@interface CommonResponseErrorBean : NSObject

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) id data;

@end
