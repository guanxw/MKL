//
//  CommonResponseBody.h
//  Taoxiaoxian
//
//  Created by tangjie on 15/5/24.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonResponseHeader.h"
#import "CommonResponseBean.h"

@interface CommonResponseBody : NSObject

@property (nonatomic, retain) CommonResponseHeader *responseHeader;
@property (nonatomic, retain) CommonResponseBean *responseBean;

@end
