//
//  CommonRequestWrap.h
//  Taoxiaoxian
//
//  Created by tangjie on 15/5/24.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonResponseBody.h"

@interface CommonRequestWrap : NSObject

@property (nonatomic, assign) NSData *imgData;
@property (nonatomic, assign) NSString *imgUrl;

- (CommonRequestWrap *)initWithReqType:(NSString *)reqType
                             reqParams:(NSDictionary *)reqParams
                          isNeedSigned:(BOOL)isNeedSigned;

- (CommonRequestWrap *)initWithReqType:(NSString *)reqType
                             reqParams:(NSDictionary *)reqParams
                             imageData:(NSData *)imgData
                          isNeedSigned:(BOOL)isNeedSigned
                              imageUrl:(NSString*)imageUrl;

- (void)getSuccess:(void (^)(CommonResponseBody *resultBody))success
           failure:(void (^)(CommonResponseBean *result))failure;

- (void)postSuccess:(void (^)(CommonResponseBody *resultBody))success
            failure:(void (^)(CommonResponseBean *result))failure;

- (void)putSuccess:(void (^)(CommonResponseBody *resultBody))success
           failure:(void (^)(CommonResponseBean *result))failure;

- (void)putImageDataSuccess:(void (^)(CommonResponseBody *))success
                    failure:(void (^)(CommonResponseBean *))failure;

- (void)deleteSuccess:(void (^)(CommonResponseBody *resultBody))success
           failure:(void (^)(CommonResponseBean *result))failure;

@end
