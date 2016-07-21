//
//  RequestCilent.h
//  Taoxiaoxian
//
//  Created by tangjie on 15/5/24.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"



@interface RequestCilent : NSObject

+ (void)get:(NSString *)url
     params:(NSDictionary *)params
    headers:(NSDictionary *)headers
    success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

+ (void)delete:(NSString *)url
    params:(NSDictionary *)params
    headers:(NSDictionary *)headers
    success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

+ (void)post:(NSString *)url
      params:(NSDictionary *)params
     headers:(NSDictionary *)headers
     success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
     failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

+ (void)post:(NSString *)url
      params:(NSDictionary *)params
     headers:(NSDictionary *)headers
     imgData:(NSData *)imgData
     success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
     failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

+ (void)put:(NSString *)url
     params:(NSDictionary *)params
    headers:(NSDictionary *)headers
    success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

+ (void)put:(NSString *)url
     params:(NSDictionary *)params
    headers:(NSDictionary *)headers
    imgData:(NSData *)imgData
    success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
