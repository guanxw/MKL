//
//  CommonRequestWrap.m
//  Taoxiaoxian
//
//  Created by tangjie on 15/5/24.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import "CommonRequestWrap.h"
#import "RequestCilent.h"
#import "CommonRequestHeaderGenerate.h"
 #import "InterfaceResultParser.h"
#import "ResultCodeUtil.h"

@interface CommonRequestWrap()

@property (nonatomic, retain) NSString *reqType;
@property (nonatomic, retain) NSDictionary *reqParams; // get 方式作为url后面参数  post/put 方式作为body
@property (nonatomic, assign) BOOL isNeedSigned;

@end

@implementation CommonRequestWrap

- (CommonRequestWrap *)initWithReqType:(NSString *)reqType
                             reqParams:(NSDictionary *)reqParams
                          isNeedSigned:(BOOL)isNeedSigned{
    self = [super init];
    
    if (self) {
        
        self.reqType = reqType;
        self.reqParams = reqParams;
        self.isNeedSigned = isNeedSigned;
        
        return self;
    }
    return nil;
}

- (CommonRequestWrap *)initWithReqType:(NSString *)reqType
                             reqParams:(NSDictionary *)reqParams
                             imageData:(NSData *)imgData
                          isNeedSigned:(BOOL)isNeedSigned
                              imageUrl:(NSString*)imageUrl
{
    self.imgData = imgData;
    self.imgUrl = imageUrl;
    return [self initWithReqType:reqType
                       reqParams:reqParams
                    isNeedSigned:YES];
}

- (void)getSuccess:(void (^)(CommonResponseBody *resultBody))success
                  failure:(void (^)(CommonResponseBean *result))failure{
    
    NSString *urlAppendParams = [self generateReqUrlAppendContent];
    
    NSDictionary *headers = [CommonRequestHeaderGenerate generateRequestHeader:REQUEST_TYPE_GET
                                                                       params:nil
                                                                  isNeedSigned:_isNeedSigned
                                                               urlAppendParams:urlAppendParams]; 
    [RequestCilent get:_reqType
                params:_reqParams
               headers:headers
               success:^(AFHTTPRequestOperation *operation, id responseObject) {
                   [self handleSuccess:operation.response responseObject:responseObject success:success failure:failure];
               } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                   [self handleFailure:error failure:failure];
               }];
}

- (void)deleteSuccess:(void (^)(CommonResponseBody *resultBody))success
              failure:(void (^)(CommonResponseBean *result))failure{
    NSString *urlAppendParams = [self generateReqUrlAppendContent];
    
    NSDictionary *headers = [CommonRequestHeaderGenerate generateRequestHeader:REQUEST_TYPE_DELETE
                                                                        params:nil
                                                                  isNeedSigned:_isNeedSigned
                                                               urlAppendParams:urlAppendParams];
    [RequestCilent delete:_reqType
                params:_reqParams
               headers:headers
               success:^(AFHTTPRequestOperation *operation, id responseObject) {
                   [self handleSuccess:operation.response responseObject:responseObject success:success failure:failure];
               } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                   [self handleFailure:error failure:failure];
               }];
}

- (void)postSuccess:(void (^)(CommonResponseBody *))success
                   failure:(void (^)(CommonResponseBean *))failure{
    
    NSDictionary *headers = [CommonRequestHeaderGenerate generateRequestHeader:REQUEST_TYPE_POST
                                                                       params:_reqParams
                                                                  isNeedSigned:_isNeedSigned
                                                               urlAppendParams:_reqType];
    [RequestCilent post:_reqType
                 params:_reqParams
                headers:headers
                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                   [self handleSuccess:operation.response responseObject:responseObject success:success failure:failure];
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    [self handleFailure:error failure:failure];
                }];
}

- (void)putSuccess:(void (^)(CommonResponseBody *))success
                 failure:(void (^)(CommonResponseBean *))failure{

    NSDictionary *headers = [CommonRequestHeaderGenerate generateRequestHeader:REQUEST_TYPE_PUT
                                                                        params:_reqParams
                                                                  isNeedSigned:_isNeedSigned
                                                               urlAppendParams:_reqType];
    [RequestCilent put:_reqType
                 params:_reqParams
                headers:headers
                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    [self handleSuccess:operation.response responseObject:responseObject success:success failure:failure];
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    [self handleFailure:error failure:failure];
                }];
}

- (void)putImageDataSuccess:(void (^)(CommonResponseBody *))success
           failure:(void (^)(CommonResponseBean *))failure{
    
    NSDictionary *headers = [CommonRequestHeaderGenerate generateRequestImageHeader:REQUEST_TYPE_PUT
                                                                        params:_reqParams
                                                                  isNeedSigned:_isNeedSigned
                                                               urlAppendParams:_reqType
                                         urlPath:self.imgUrl];
    
    
    [RequestCilent put:_reqType
                params:_reqParams
               headers:headers
               imgData:self.imgData
     
               success:^(AFHTTPRequestOperation *operation, id responseObject) {
                   [self handleSuccess:operation.response responseObject:responseObject success:success failure:failure];
               } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                   [self handleFailure:error failure:failure];
               }];
}

- (void)handleSuccess:(NSHTTPURLResponse *)response
       responseObject:(id)responseObject
              success:(void (^)(CommonResponseBody *resultBody))success
              failure:(void (^)(CommonResponseBean *result))failure{
    
    CommonResponseBody *responseBody = [InterfaceResultParser getResponseBodyFromJson:_reqType
                                                                              headers:[response allHeaderFields]
                                                                              resJson:responseObject];
    if (responseBody) {
        
//        CommonResponseHeader *responseHeader = responseBody.responseHeader;
        
        
        NSString *resultCode = responseBody.responseBean.code;
        
        if ([SUCCESS isEqualToString:resultCode]) {
            if (success) {
                success(responseBody);
            }
        }else{
            if (failure) {
                failure(responseBody.responseBean);
            }
        }
        return;
    }
    
    if (failure) {
        failure([InterfaceResultParser generateErrorBean]);
    }
}

- (void)handleFailure:(NSError *)error failure:(void (^)(CommonResponseBean *result))failure{
    if (failure) {
        failure([InterfaceResultParser generateErrorBean]);
    }
}

/**
 
 只有get方式请求时，才调用
 生成根地址url后面的内容
 case http://api.taoxiaoxian.com(根url) + 此方法生成的字符串 /mian?page=1
 
 **/
- (NSString *)generateReqUrlAppendContent{
    
    if(_reqParams && [_reqParams count] > 0){
        
        NSMutableString *urlParams = [NSMutableString string];
        
        for (NSString *key in [_reqParams allKeys]) {
            [urlParams appendString:[NSString stringWithFormat:@"%@=%@&",key,[_reqParams valueForKey:key]]];
        }
        
        if (urlParams && urlParams.length > 0) {
            NSRange lastStrRange = [urlParams rangeOfString:@"&" options:NSBackwardsSearch];
            [urlParams deleteCharactersInRange:(lastStrRange)];
        }
        
        NSString *reqUrlAppendContent = [NSString stringWithFormat:@"%@?%@", _reqType, urlParams];
        
        return reqUrlAppendContent;
    }else{
        return _reqType;
    }
    
}



@end
