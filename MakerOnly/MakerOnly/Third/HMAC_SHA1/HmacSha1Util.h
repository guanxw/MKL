//
//  HmacSha1Util.h
//  Taoxiaoxian
//
//  Created by evil on 15/4/9.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HmacSha1Util : NSObject

+ (NSString *)hmacsha1:(NSString *)text key:(NSString *)secret;

@end
