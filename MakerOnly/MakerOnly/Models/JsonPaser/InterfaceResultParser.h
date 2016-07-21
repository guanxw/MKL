//
//  InterfaceResultParser.h
//  Taoxiaoxian
//
//  Created by tangjie on 15/5/26.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InterfaceResultParser : NSObject

/*
 
 解析列表接口数据
 
 */
+ (id)getResponseBodyWithListDataFromJson:(NSString *)requestType
                      headers:(NSDictionary *)headers
                      resJson:(id)resJson;

/*
 
 解析非列表接口
 
 */

+ (id)getResponseBodyFromJson:(NSString *)requestType
                      headers:(NSDictionary *)headers
                      resJson:(id)resJson;

+ (id)generateErrorBean;

@end
