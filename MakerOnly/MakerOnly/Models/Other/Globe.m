//
//  Globe.m
//
//  Created by evil on 15/4/10.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import "Globe.h"

#import "SFHFKeychainUtils.h"

#import "DeviceUtil.h"

@implementation Globe

+ (Globe *)sharedSingleton{
    static Globe *sharedSingleton=nil;
    
    @synchronized(self)
    {
        if (!sharedSingleton)
        {
            sharedSingleton = [[Globe alloc] init];
            sharedSingleton.isLoginView = NO;
        }
        
        return sharedSingleton;
    }
}

-(NSDate *)serverDate{
    NSDate *now = [NSDate date];
    //    NSTimeZone *currentZone = [NSTimeZone systemTimeZone];
    //    NSInteger diffInterval = [currentZone secondsFromGMTForDate: now];
    NSDate *gmtDate = [now dateByAddingTimeInterval: (- self.serverDateOffsetToLocal)];
    return  gmtDate;
}

-(void)setServerDateString:(NSString *)serverDateStr{
    if (!serverDateStr) {
        return;
    }
    NSLog(@"[%@]",serverDateStr);
    NSDateFormatter *sdf = [[NSDateFormatter alloc] init];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [sdf setLocale:locale];
    [sdf setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss zzz"];
    NSDate *serverDate = [sdf dateFromString:serverDateStr];

    //    NSTimeZone *currentZone = [NSTimeZone systemTimeZone];
    NSDate *localDate = [NSDate date];
    //    NSInteger diffInterval = [currentZone secondsFromGMTForDate: localDate];
    //    NSDate *localGMTDate = [localDate dateByAddingTimeInterval: diffInterval];
    
    self.serverDateOffsetToLocal = localDate.timeIntervalSince1970 - serverDate.timeIntervalSince1970;

}


-(void)setLoginAccessKey:(NSString *)loginAccessKey{

    if (loginAccessKey) {
        
        [[NSUserDefaults standardUserDefaults] setObject:loginAccessKey forKey:kAccessKeyInKeychain];
    }
}

-(NSString *)loginAccessKey{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kAccessKeyInKeychain];
}
-(NSString *)loginRealName{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kRealNameInKeychain];
}
-(void)setLoginRealName:(NSString *)loginRealName{
    
    if (loginRealName) {
        
        [[NSUserDefaults standardUserDefaults] setObject:loginRealName forKey:kRealNameInKeychain];
    }
}
-(void)setLoginSecretKey:(NSString *)loginSecretKey{
    if (loginSecretKey) {
        [[NSUserDefaults standardUserDefaults] setObject:loginSecretKey forKey:kSecretKeyInKeychain];
    }
}

-(NSString *)loginSecretKey{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kSecretKeyInKeychain];
}




-(void)clearUserInfo{
   
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kAccessKeyInKeychain];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kSecretKeyInKeychain];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kLoginName];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kLoginPsw];
}





//-(NSString *)genUserAgent{
//    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//    return userAgentValue([infoDictionary objectForKey:@"CFBundleShortVersionString"],
//                          [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemVersion], self.loginAccessKey==nil?@"-":self.loginAccessKey);
//    
//}

#pragma mark - private method

/*
 * plist读写操作
 */
-(NSMutableDictionary *)readPlistFile:(NSString *)fileName{
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
                      stringByAppendingPathComponent:fileName];
    NSMutableDictionary *payResultDict = [[NSMutableDictionary alloc]initWithContentsOfFile:path];
    
    return [payResultDict mutableCopy];
}

-(BOOL)writePlist:(NSDictionary *)dict toFileName:(NSString *)fileName{
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
                      stringByAppendingPathComponent:fileName];
    
    return [dict writeToFile:path atomically:YES];
}

-(void)setDeviceUUID{
    if ([self getDeviceUUid].length == 0){
        NSString *uuid = [DeviceUtil uuid];
        uuid = [uuid stringByReplacingOccurrencesOfString:@"-" withString:@""];
        [SFHFKeychainUtils storeUsername:kDeviceUUIDInKeychain
                             andPassword:uuid
                          forServiceName:kKeychainServiceName
                          updateExisting:YES
                                   error:nil];
    }
}

-(NSString *)getDeviceUUid{
    return [SFHFKeychainUtils getPasswordForUsername:kDeviceUUIDInKeychain
                                      andServiceName:kKeychainServiceName
                                               error:nil];
}

@end
