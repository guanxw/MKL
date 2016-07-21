//
//  Globe.h
//
//  Created by evil on 15/4/10.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Globe : NSObject

@property (nonatomic, strong) NSString *loginAccessKey;
@property (nonatomic, strong) NSString *loginSecretKey;

@property (nonatomic, strong) NSString *shiminwangLogin;
@property (nonatomic, strong) NSString *shiminwangPWD;

@property (nonatomic, strong) NSString *shiminwangToken;

@property (nonatomic, assign) BOOL isLoginView;//是否经过登录界面

@property (nonatomic, assign) long serverDateOffsetToLocal;//服务器时间与本地时间偏移量
-(void)setServerDateString:(NSString *)serverDateStr;

+ (Globe *)sharedSingleton;

-(void)clearUserInfo;

-(NSString *)genUserAgent;

-(void)setPhoneNum:(NSString *)phoneNum;

-(NSString *)phoneNum;

//-(void)setDeviceUUID;
//
//-(NSString *)getDeviceUUid;


@end
