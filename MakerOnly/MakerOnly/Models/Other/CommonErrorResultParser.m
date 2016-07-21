//
//  CommonErrorResultParser.m
//  Taoxiaoxian
//
//  Created by tangjie on 15/5/26.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import "CommonErrorResultParser.h"
#import "CommonResponseErrorBean.h"

@implementation CommonErrorResultParser

+ (id)parseResult:(NSDictionary *)jsonDic{
    
    CommonResponseErrorBean *errorBean = [[CommonResponseErrorBean alloc] init];
    
    errorBean.code = nilOrJSONObjectForKey(jsonDic, @"code");
    errorBean.message = nilOrJSONObjectForKey(jsonDic, @"message");
    errorBean.data = nilOrJSONObjectForKey(jsonDic, @"data");
    
    return errorBean;
}

@end
