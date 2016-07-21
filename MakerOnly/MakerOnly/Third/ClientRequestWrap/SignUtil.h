//
//  SignUtil.h
//  Taoxiaoxian
//  签名工具
//  Created by evil on 15/4/9.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SignUtil : NSObject

+ (NSString *) genAuthorizationValue:(NSString *)stringToSign secretKey:(NSString *)secretKey;

@end
