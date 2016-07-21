//
//  ResultCodeUtil.m
//  Taoxiaoxian
//
//  Created by tangjie on 15/5/26.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import "ResultCodeUtil.h"

@implementation ResultCodeUtil

//---------------通用异常

NSString * const BAD_REQUEST_UNKNOWN = @"400"; //code
NSString * const BAD_REQUEST_TYPE_UNKNOWN = @"type_unknown"; //type
NSString * const BAD_REQUEST_RESOURCE_UNKNOWN = @"resource_unknown"; //resource

NSString * const BAD_REQUEST_40001 = @"40001"; //参数无效或缺少必要参数
NSString * const BAD_REQUEST_40002 = @"40002"; //请求头缺少user-agent
NSString * const BAD_REQUEST_40003 = @"40003"; //请求头缺少accept
NSString * const BAD_REQUEST_40004 = @"40004"; //请求头expires过期(expires对应的过期时间小于服务器当前时间)
NSString * const BAD_REQUEST_40005 = @"40005"; //错误的Method
NSString * const BAD_REQUEST_40006 = @"40006"; //无效的Body，可能是JSON异常，或Query数据异常
NSString * const BAD_REQUEST_40007 = @"40007"; //待定
NSString * const BAD_REQUEST_40101 = @"40101"; //签名信息无效或缺少签名信息
NSString * const BAD_REQUEST_40401 = @"40401"; //请求资源不存在
NSString * const BAD_REQUEST_40402 = @"40402"; //优惠券冻结失败

NSString * const BAD_REQUEST_50001 = @"50001"; //服务器端开小差了，暂时不能提供服务
NSString * const BAD_REQUEST_50002 = @"50002"; //当前用户的帐户异常，Client 或将提示用户“再试/帐户异常/联系工作人员”
NSString * const BAD_REQUEST_50003 = @"50003"; //当前用户信息异常
NSString * const BAD_REQUEST_50101 = @"50101"; //用户余额不足以支付/秒杀/取现
NSString * const BAD_REQUEST_50102 = @"50102"; //秒杀商品，售罄/暂停出售
NSString * const BAD_REQUEST_50103 = @"50103"; //用户已经参与过秒杀
NSString * const BAD_REQUEST_50104 = @"50104"; //秒杀未开始
NSString * const BAD_REQUEST_50105 = @"50105"; //秒杀已结束

+ (NSString *)proccessResultCode:(CommonResponseHeader *)responseHeader {
    
    NSString *result = responseHeader.resultCode;
    
    if ([SUCCESS isEqualToString:result]) {
        return SUCCESS;
    }else if ([BAD_REQUEST_40001 isEqualToString:result]) {
        return BAD_REQUEST_40001;
    }else if ([BAD_REQUEST_40002 isEqualToString:result]) {
        return BAD_REQUEST_40002;
    }else if ([BAD_REQUEST_40003 isEqualToString:result]) {
        return BAD_REQUEST_40003;
    }else if ([BAD_REQUEST_40004 isEqualToString:result]) {
        return BAD_REQUEST_40004;
    }else if ([BAD_REQUEST_40005 isEqualToString:result]) {
        return BAD_REQUEST_40005;
    }else if ([BAD_REQUEST_40006 isEqualToString:result]) {
        return BAD_REQUEST_40006;
    }else if ([BAD_REQUEST_40007 isEqualToString:result]) {
        return BAD_REQUEST_40007;
    }else if ([BAD_REQUEST_40101 isEqualToString:result]) {
        return BAD_REQUEST_40101;
    }else if ([BAD_REQUEST_40401 isEqualToString:result]) {
        return BAD_REQUEST_40401;
    }else if ([BAD_REQUEST_40402 isEqualToString:result]) {
        return BAD_REQUEST_40402;
    }else if ([BAD_REQUEST_50001 isEqualToString:result]) {
        return BAD_REQUEST_50001;
    }else if ([BAD_REQUEST_50002 isEqualToString:result]) {
        return BAD_REQUEST_50002;
    }else if ([BAD_REQUEST_50003 isEqualToString:result]) {
        return BAD_REQUEST_50003;
    }else if ([BAD_REQUEST_50101 isEqualToString:result]) {
        return BAD_REQUEST_50101;
    }else if ([BAD_REQUEST_50102 isEqualToString:result]) {
        return BAD_REQUEST_50102;
    }else if ([BAD_REQUEST_50103 isEqualToString:result]) {
        return BAD_REQUEST_50103;
    }else if ([BAD_REQUEST_50104 isEqualToString:result]) {
        return BAD_REQUEST_50104;
    }else if ([BAD_REQUEST_50105 isEqualToString:result]) {
        return BAD_REQUEST_50105;
    }
    
    return @"请求失败";
}

@end
