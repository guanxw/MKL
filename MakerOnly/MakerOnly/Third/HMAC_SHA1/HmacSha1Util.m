//
//  HmacSha1Util.m
//  Taoxiaoxian
//
//  Created by evil on 15/4/9.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import "HmacSha1Util.h"

#include <CommonCrypto/CommonDigest.h>
#include <CommonCrypto/CommonHMAC.h>

#include "base64.h"

@implementation HmacSha1Util

+ (NSString *)hmacsha1:(NSString *)text key:(NSString *)secret {
    NSLog(@"%@",secret);
    NSData *secretData = [secret dataUsingEncoding:NSUTF8StringEncoding];
    NSData *clearTextData = [text dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char result[20];
    CCHmac(kCCHmacAlgSHA1, [secretData bytes], [secretData length], [clearTextData bytes], [clearTextData length], result);
    char base64Result[32];
    size_t theResultLength = 32;
    Base64EncodeData(result, 20, base64Result, &theResultLength,YES);
    NSData *theData = [NSData dataWithBytes:base64Result length:theResultLength];
    NSString *base64EncodedResult = [[NSString alloc] initWithData:theData encoding:NSASCIIStringEncoding];
    return base64EncodedResult;
}

@end
