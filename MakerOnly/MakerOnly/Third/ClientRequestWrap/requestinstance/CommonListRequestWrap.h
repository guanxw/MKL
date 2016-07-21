//
//  CommonListRequestWrap.h
//  Taoxiaoxian
//
//  Created by tangjie on 15/5/27.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CommonResponseBody.h"

@interface CommonListRequestWrap : NSObject

- (CommonListRequestWrap *)initWithReqType:(NSString *)reqType
                                 reqParams:(NSDictionary *)reqParams
                              isNeedSigned:(BOOL)isNeedSigned;

- (void)getSuccess:(void (^)(CommonResponseBody *resultBody))success
           failure:(void (^)(CommonResponseBean *result))failure;

@end
