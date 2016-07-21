//
//  SignUtil.m
//  Taoxiaoxian
//
//  Created by evil on 15/4/9.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import "SignUtil.h"

#import "HmacSha1Util.h"

@implementation SignUtil

+ (NSString *) genAuthorizationValue:(NSString *)stringToSign secretKey:(NSString *)secretKey{
    //NSLog(@"string2Sign-------%@",stringToSign);
    NSString *signature = [HmacSha1Util hmacsha1:stringToSign key:secretKey];
    NSLog(@"string2Sign-------%@",signature);
    if (signature.length >= 15) {
        //NSLog(@"---1----%@",signature);
        signature = [signature substringWithRange:NSMakeRange(5, 10)];

        NSLog(@"---2----%@",signature);
        return signature;
    }
    //NSLog(@"---!!!!!!!!----%@",signature);
    return nil;
}

@end
