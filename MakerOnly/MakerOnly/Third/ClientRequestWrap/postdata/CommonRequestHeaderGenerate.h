//
//  CommonRequestHeaderGenerate.h
//  Taoxiaoxian
//
//  Created by tangjie on 15/5/25.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const REQUEST_TYPE_GET = @"GET";
static NSString * const REQUEST_TYPE_POST = @"POST";
static NSString * const REQUEST_TYPE_PUT = @"PUT";
static NSString * const REQUEST_TYPE_DELETE = @"DELETE";

static NSString * const CONTENT_TYPE_KEY = @"Content-Type";
static NSString * const CONTENT_TYPE = @"application/json";

@interface CommonRequestHeaderGenerate : NSObject

+ (NSDictionary *)generateRequestHeader:(NSString *)httpVerb
                                params:(NSDictionary *)params
                           isNeedSigned:(BOOL)isNeedSigned
                        urlAppendParams:(NSString *)urlAppendParams;
+ (NSMutableDictionary *)generateRequestImageHeader:(NSString *)httpVerb
                                             params:(NSDictionary *)params
                                       isNeedSigned:(BOOL)isNeedSigned
                                    urlAppendParams:(NSString *)urlAppendParams
                                            urlPath:(NSString *)urlPath;
+ (NSMutableDictionary *)generateCommonRequestHeader;

@end
