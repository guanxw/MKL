//
//  CommonRequestHeaderGenerate.m
//  Taoxiaoxian
//
//  Created by tangjie on 15/5/25.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import "CommonRequestHeaderGenerate.h"
#import "SFHFKeychainUtils.h"
#import "SignUtil.h"
#import "Globe.h"

/**----------------------------------------------- 请求header内键值对 ----------------------------------------------- */

NSString * const ACCEPT_KEY = @"Accept";
NSString * const ACCEPT_VALUE = @"application/vnd.zonggonghui.v1+json";
NSString * const ACCESS_KEY = @"Access-Key";
NSString * const USER_AGENT_KEY = @"User-Agent";
NSString * const EXPIRES_KEY = @"Expires";
NSString * const OS = @"iOS";
NSString * const APP_PROJECT_NAME = @"TradeUnion";
NSString * const AUTHORIZATION = @"Authorization";

/**----------------------------------------------- end -----------------------------------------------*/

@implementation CommonRequestHeaderGenerate

+ (NSMutableDictionary *)generateRequestHeader:(NSString *)httpVerb
                                params:(NSDictionary *)params
                           isNeedSigned:(BOOL)isNeedSigned
                        urlAppendParams:(NSString *)urlAppendParams{
    
    if (isNeedSigned) {
        return [self generateSignedRequestHeader:params httpVerb:httpVerb urlAppendParams:urlAppendParams];
    }else{
        return [self generateCommonRequestHeader];
    }
    
}
+ (NSMutableDictionary *)generateRequestImageHeader:(NSString *)httpVerb
                                        params:(NSDictionary *)params
                                  isNeedSigned:(BOOL)isNeedSigned
                               urlAppendParams:(NSString *)urlAppendParams
                               urlPath:(NSString *)urlPath{
    
    if (isNeedSigned) {
//        urlAppendParams = [NSString stringWithFormat:@"%@?extravalue=\"%@\"",urlAppendParams,urlPath];
        return [self generateSignedRequestHeader:params httpVerb:httpVerb urlAppendParams:urlAppendParams];
    }else{
        return [self generateCommonRequestHeader];
    }
    
}
+ (NSMutableDictionary *)generateCommonRequestHeader{
    
    NSMutableDictionary *headers = [NSMutableDictionary dictionary];
    
    [headers setValue:ACCEPT_VALUE forKey:ACCEPT_KEY];
    [headers setValue:[self generateUserAgent] forKey:USER_AGENT_KEY];
    [headers setValue:@"application/json" forKey:@"Content-Type"];
    [headers setValue:@"" forKey:EXPIRES_KEY];
    [headers setValue:@"" forKey:AUTHORIZATION];
    //所有请求带上Access-Key 暂时只有首页晒单列表必须带上
    NSString *accessKey = [[Globe sharedSingleton] loginAccessKey];
    if (accessKey.length > 0) {
        [headers setValue:accessKey forKey:ACCESS_KEY];
    }
    
    return headers;
}

+ (NSMutableDictionary *)generateSignedRequestHeader:(NSDictionary *)params
                                     httpVerb:(NSString *)httpVerb
                              urlAppendParams:(NSString *)urlAppendParams{
    
    NSMutableDictionary *headers = [NSMutableDictionary dictionary];
    
    [headers setValue:ACCEPT_VALUE forKey:ACCEPT_KEY];
    [headers setValue:[self generateUserAgent] forKey:USER_AGENT_KEY];
     [headers setValue:@"application/json" forKey:@"Content-Type"];
    NSDate *now = [NSDate date];
    NSTimeZone *currentZone = [NSTimeZone systemTimeZone];
    NSInteger diffInterval = [currentZone secondsFromGMTForDate: now];
    NSDate *gmtDate = [now dateByAddingTimeInterval: (- diffInterval - [Globe sharedSingleton].serverDateOffsetToLocal + 5*60)];
    NSDateFormatter *sdf = [[NSDateFormatter alloc] init];
    [sdf setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss 'GMT'"];
    [sdf setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    NSString *expires = [sdf stringFromDate:gmtDate];
//    expires = @"Thu, 14 Jan 2016 10:20:28 GMT";
    [headers setValue:expires forKey:EXPIRES_KEY];
    
    NSString *accessKey = [[Globe sharedSingleton] loginAccessKey];
    NSString *secretKey = [[Globe sharedSingleton] loginSecretKey];
    if (accessKey.length > 0 && secretKey.length > 0) {

        NSMutableString *stringToSign = [NSMutableString string];
        
        [stringToSign appendFormat:@"%@%@", httpVerb, @"\n"];
        
//        if (params && [params count] > 0) {
//            [stringToSign appendString:CONTENT_TYPE];
//        }
        [stringToSign appendString:CONTENT_TYPE];
        [stringToSign appendString:@"\n"];
        
        [stringToSign appendFormat:@"%@%@", expires, @"\n"];
        [stringToSign appendString:urlAppendParams];
        NSLog(@"***********%@",stringToSign);
        NSString *ssig = [SignUtil genAuthorizationValue:stringToSign secretKey:secretKey];
         NSLog(@"**************%@",ssig);
        [headers setValue:[NSString stringWithFormat:@"%@:%@",accessKey, ssig] forKey:AUTHORIZATION];
    }

    return headers;
}

+ (NSString *)generateUserAgent{
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    
    NSString *accessKey = [[Globe sharedSingleton] loginAccessKey];

    return [NSString stringWithFormat:@"%@/%@ (%@; %@; %@) %@",
     APP_PROJECT_NAME,
     [infoDictionary objectForKey:@"CFBundleShortVersionString"],//versionName
     OS,
     [[UIDevice currentDevice] model],
     [[UIDevice currentDevice] systemVersion],
     (accessKey.length == 0 ? @"-" : accessKey)];    
}

@end
