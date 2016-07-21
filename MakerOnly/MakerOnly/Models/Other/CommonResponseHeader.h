//
//  CommonResponseHeader.h
//  Taoxiaoxian
//
//  Created by tangjie on 15/5/26.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Server: nginx
 * Date: Fri, 12 Oct 2012 23:33:14 GMT
 * Content-Type: application/json;
 * charset=utf-8
 * Connection: keep-alive
 * Result-Code: 200
 * X-Taoxiaoxian-Media-Type: taoxiaoxian.v1
 * Content-Length: 888
 * Link: <http://api.taoxiaoxian.com/guides?cid=1&page=1>; rel="next"
 */

static NSString * const HEADER_DATE = @"Date";
static NSString * const HEADER_RESULT_CODE = @"Result-Code";
static NSString * const HEADER_LINK = @"Link";

@interface CommonResponseHeader : NSObject

@property (nonatomic, retain) NSString *Link;
@property (nonatomic, retain) NSString *resultCode;
@property (nonatomic, retain) NSString *date;

@end
