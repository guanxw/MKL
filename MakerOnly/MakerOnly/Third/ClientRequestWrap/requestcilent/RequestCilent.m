//
//  RequestCilent.m
//  Taoxiaoxian
//
//  Created by tangjie on 15/5/24.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import "RequestCilent.h"
#import "CommonRequestHeaderGenerate.h"
#import "NSData+Additions.h"

@implementation RequestCilent

+ (void)get:(NSString *)url
     params:(NSDictionary *)params
    headers:(NSDictionary *)headers
    success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    
    AFHTTPRequestOperationManager * manager = [self initRqeManagerWithHeaders:headers requestType:REQUEST_TYPE_GET requestParams:params];

    if (url.length != 0 && [url rangeOfString:@"http"].location == NSNotFound) {
        url = [self getRequestCompleteUrl:url];
    }
    
    [manager GET:url
      parameters:params
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
             if (success) {
                 success(operation, responseObject);
             }
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
             if (failure) {
                 failure(operation, error);
             }
         }];
}

+ (void)delete:(NSString *)url
     params:(NSDictionary *)params
    headers:(NSDictionary *)headers
    success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    
    AFHTTPRequestOperationManager * manager = [self initRqeManagerWithHeaders:headers requestType:REQUEST_TYPE_DELETE requestParams:params];
    
    if (url.length != 0 && [url rangeOfString:@"http"].location == NSNotFound) {
        url = [self getRequestCompleteUrl:url];
    }
    
    [manager DELETE:url
      parameters:params
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
             if (success) {
                 success(operation, responseObject);
             }
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
             if (failure) {
                 failure(operation, error);
             }
         }];
}

+ (void)post:(NSString *)url
      params:(NSDictionary *)params
     headers:(NSDictionary *)headers
     success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
     failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    
    AFHTTPRequestOperationManager * manager = [self initRqeManagerWithHeaders:headers requestType:REQUEST_TYPE_POST requestParams:params];
    
    [manager POST:[self getRequestCompleteUrl:url]
       parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              
              if (success) {
                  success(operation, responseObject);
              }
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              
              if (failure) {
                  failure(operation, error);
              }
          }];
    
}

+ (void)post:(NSString *)url
      params:(NSDictionary *)params
     headers:(NSDictionary *)headers
     imgData:(NSData *)imgData
     success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
     failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    
    AFHTTPRequestOperationManager * manager = [self initRqeManagerWithHeaders:headers requestType:REQUEST_TYPE_POST requestParams:params];
    
            [manager POST:url
               parameters:params
        constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            
            [formData appendPartWithFileData:imgData
                                        name:@"file"
                                    fileName:[NSString stringWithFormat:@"file%@",[imgData detectImageSuffix]]
                                    mimeType:@"multipart/form-data"];
            
        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (success) {
                success(operation, responseObject);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure) {
                failure(operation, error);
            }
        }];
}

+ (void)put:(NSString *)url
     params:(NSDictionary *)params
    headers:(NSDictionary *)headers
    success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    
    AFHTTPRequestOperationManager * manager = [self initRqeManagerWithHeaders:headers requestType:REQUEST_TYPE_PUT requestParams:params];
    
    [manager PUT:[self getRequestCompleteUrl:url]
      parameters:params
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
             if (success) {
                 success(operation, responseObject);
             }
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
             if (failure) {
                 failure(operation, error);
             }
         }];
    
}

+ (void)put:(NSString *)url
     params:(NSDictionary *)params
    headers:(NSDictionary *)headers
    imgData:(NSData *)imgData
    success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    
    AFHTTPRequestOperationManager * manager = [self initRqeManagerWithHeaders:headers requestType:REQUEST_TYPE_PUT requestParams:params];
    
    [manager.requestSerializer setValue:@"image/jpg" forHTTPHeaderField:CONTENT_TYPE_KEY];

    NSMutableURLRequest* request = [manager.requestSerializer requestWithMethod:@"PUT" URLString:[self getRequestCompleteUrl:url] parameters:params];
    [request setHTTPBody:imgData];
    
    AFHTTPRequestOperation *operation = [manager HTTPRequestOperationWithRequest:request
                                             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                 
                                                 if (success) {
                                                     success(operation, responseObject);
                                                 }
                                             }
                                             failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                         
                                                 if (failure) {
                                                     failure(operation, error);
                                                 }
                                             }];

    [manager.operationQueue addOperation:operation];
}

/**
 
 manager set custom header & contentType
 
 **/

+ (AFHTTPRequestOperationManager *)initRqeManagerWithHeaders:(NSDictionary *)reqHeaders
                                                 requestType:(NSString *)requestType
                                               requestParams:(NSDictionary *)params{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/vnd.dajiayigaun.v1+json"];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    if ([requestType isEqualToString:REQUEST_TYPE_GET]||[requestType isEqualToString:REQUEST_TYPE_DELETE]) {
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    }else{
        if (params && [params count] > 0) {
            manager.requestSerializer = [AFJSONRequestSerializer serializer]; //自动带Content-Type: application/json
//            [manager.requestSerializer setValue:CONTENT_TYPE forHTTPHeaderField:CONTENT_TYPE_KEY];
        }else{
            manager.requestSerializer = [AFHTTPRequestSerializer serializer]; //post / put 走 httpSerializer
        }
    }
    
    if (reqHeaders != nil && [reqHeaders count] > 0) {
        for (NSString *key in reqHeaders) {
            [manager.requestSerializer setValue:[reqHeaders objectForKey:key] forHTTPHeaderField:key];
        }
    }
    
    return manager;
}

+ (NSString *)getRequestCompleteUrl:(NSString *)reqType{
    if ([reqType isEqualToString:@"test"]) {
        return @"http://api.scity.cn/center_userservice/service/CW7002";
    }
    return [[NSString stringWithFormat:@"%@%@", BASE_DATA_INTERFACE_URL, reqType] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end
