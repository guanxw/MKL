//
//  CommonListRequestWrap.m
//  Taoxiaoxian
//
//  Created by tangjie on 15/5/27.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import "CommonListRequestWrap.h"

#import "RequestCilent.h"
#import "CommonRequestHeaderGenerate.h"
#import "InterfaceResultParser.h"
#import "ResultCodeUtil.h"

@interface CommonListRequestWrap()

@property (nonatomic, retain) NSString *reqType;
@property (nonatomic, retain) NSDictionary *reqParams; // get 方式作为url后面参数  post/put 方式作为body
@property (nonatomic, assign) BOOL isNeedSigned;

@end

@implementation CommonListRequestWrap

- (CommonListRequestWrap *)initWithReqType:(NSString *)reqType
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

- (void)getSuccess:(void (^)(CommonResponseBody *resultBody))success
           failure:(void (^)(CommonResponseBean *result))failure{
    
    NSRange containBaseUrlRange = [_reqType rangeOfString:BASE_DATA_INTERFACE_URL];
    
    if (containBaseUrlRange.location != NSNotFound) {
        self.reqType = [_reqType substringFromIndex:(containBaseUrlRange.location + containBaseUrlRange.length)];
    }
    
    NSDictionary *headers = [CommonRequestHeaderGenerate generateRequestHeader:REQUEST_TYPE_GET
                                                                        params:nil
                                                                  isNeedSigned:_isNeedSigned
                                                               urlAppendParams:_reqType];
    [RequestCilent get:_reqType
                params:_reqParams
               headers:headers
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
    
    CommonResponseBody *responseBody = [InterfaceResultParser getResponseBodyWithListDataFromJson:_reqType
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



@end
