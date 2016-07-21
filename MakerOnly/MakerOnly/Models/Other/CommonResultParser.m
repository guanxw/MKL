//
//  CommonResultParser.m
//  EveryOneHospital
//
//  Created by Apple on 16/4/25.
//  Copyright © 2016年 wangyanjiao. All rights reserved.
//

#import "CommonResultParser.h"
#import "CommonResponseBean.h"

@implementation CommonResultParser

+ (id)parseResult:(NSDictionary *)jsonDic{
    
    CommonResponseBean *resultBean = [[CommonResponseBean alloc] init];
    
    resultBean.code = nilOrJSONObjectForKey(jsonDic, @"code");
    resultBean.message = nilOrJSONObjectForKey(jsonDic, @"message");
    resultBean.data = nilOrJSONObjectForKey(jsonDic, @"data");
    
    return resultBean;
}
@end
