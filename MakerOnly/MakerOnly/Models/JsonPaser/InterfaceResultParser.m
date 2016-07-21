//
//  InterfaceResultParser.m
//  Taoxiaoxian
//
//  Created by tangjie on 15/5/26.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import "InterfaceResultParser.h"
#import "CommonResponseBody.h"
#import "Globe.h"


#import "CommonResultParser.h"
#import "CommonErrorResultParser.h"
#import "ResultCodeUtil.h"




@implementation InterfaceResultParser

+ (id)getResponseBodyWithListDataFromJson:(NSString *)requestType
                                  headers:(NSDictionary *)headers
                                  resJson:(id)resJson{
    
    CommonResponseBody *responseBody = [[CommonResponseBody alloc] init];
    
    NSDictionary *jsonAllDic = (NSDictionary *)resJson;
    CommonResponseBean *resultBean = [[CommonResponseBean alloc] init];
    
    resultBean.code = nilOrJSONObjectForKey(jsonAllDic, @"code");
    if ([resultBean.code isEqualToString:@"200"]) {
        resultBean.message = nilOrJSONObjectForKey(jsonAllDic, @"message");
        id responseContent = nil;
        id responseData = nilOrJSONObjectForKey(jsonAllDic, @"data");
        NSArray *jsonArr = (NSArray *)responseData;
        
        NSLog(@"%@ \n %@",requestType,jsonArr);
        /*
        //判断条件
        if ([requestType rangeOfString:@"^/notification/getallnotification(\\?offset\\=\\d+&range\\=\\d+)?$" options:NSRegularExpressionSearch].location != NSNotFound) {
            //获取通知公告列表
            responseContent = [InterfaceNoticeUrlResultPaser paserResult:jsonArr];
        }else if ([requestType rangeOfString:@"^/notification/keynotification(\\?key\\=)" options:NSRegularExpressionSearch].location != NSNotFound){
            //通过关键字获取通知公告列表
            responseContent = [InterfaceNoticeUrlResultPaser paserResult:jsonArr];
        }else if ( [requestType isEqualToString:ADDRESSBOOK]){
            //获取用户通讯录接口
            responseContent = [InterfaceAddressUrlReslutPaser paserRuslut:jsonArr];
        }
         */
        
        
        
        if (responseContent) {
            resultBean.data = responseContent;
            responseBody.responseBean = resultBean;
        }

    }
    else
    {
        CommonResponseBean *errorBean = [self generateErrorBean];
        responseBody.responseBean = errorBean;
    }
    
    return responseBody;
    
}

+ (id)getResponseBodyFromJson:(NSString *)requestType
                      headers:(NSDictionary *)headers
                      resJson:(id)resJson{
    

    
    CommonResponseBody *responseBody = [[CommonResponseBody alloc] init];
    
    NSDictionary *jsonAllDic = (NSDictionary *)resJson;
    CommonResponseBean *resultBean = [[CommonResponseBean alloc] init];
    
    resultBean.code = nilOrJSONObjectForKey(jsonAllDic, @"code");
    if ([resultBean.code isEqualToString:@"200"]) {
        resultBean.message = nilOrJSONObjectForKey(jsonAllDic, @"message");
        id responseContent = nil;
        id responseData = nilOrJSONObjectForKey(jsonAllDic, @"data");
        NSDictionary *jsonDic = (NSDictionary *)responseData;
        
        NSLog(@"%@ \n %@",requestType,jsonDic);
        
        /*
        if ([requestType isEqualToString:@"/user/sendmessage"]) {
            //通知公告中发送信息
            responseContent = [InterfaceNoticeMessageUrlResultPaser paserResult:jsonDic];
        }
        else if ([requestType isEqualToString:USER_LOGIN])
        {
            //登录
            responseContent = [InterfaceUserUrlResultPaser paserRusult:jsonDic];
        }else if ([requestType isEqualToString:@"/user/changepassword"]){
            //修改密码
            responseContent = [NSDictionary dictionaryWithDictionary:jsonDic];
        }else if ([requestType isEqualToString:@"/user/getuserinfo"]){
            //获取个人信息
            responseContent = [InterfacePersonUrlResultPaser paserResult:jsonDic];
        }else if ([requestType isEqualToString:@"/user/sendvercode"]){
            //下发验证码
            responseContent = [NSDictionary dictionaryWithDictionary:jsonDic];
        }else if ([requestType isEqualToString:@"/user/changepassword"]){
            //修改密码
            responseContent = [NSDictionary dictionaryWithDictionary:jsonDic];
        }else if ([responseContent isEqualToString:@"/user/changephone"]){
            //修改手机号
            responseContent = [NSDictionary dictionaryWithDictionary:jsonDic];
        }else if ([requestType isEqualToString:@"/user/sendadvice"]){
            //提交意见
            responseContent = [NSDictionary dictionaryWithDictionary:jsonDic];
        }else if ([requestType isEqualToString:@"/system/refresh"]){
            //检查更新
            responseContent = [NSDictionary dictionaryWithDictionary:jsonDic];
        }else if ([requestType isEqualToString:@"/files/image"]){
            //图片上传
            responseContent = [NSDictionary dictionaryWithDictionary:jsonDic];
        }else if ([requestType isEqualToString:@"/files/image"]){
            //图片上传
            responseContent = [NSDictionary dictionaryWithDictionary:jsonDic];
        }else if ([requestType rangeOfString:NOTICE_ID options:NSRegularExpressionSearch].location != NSNotFound){
            //通过id获取通知
            responseContent = [InterfaceNoticeIdUrlResultPaser paserRusult:jsonDic];
        }else if ([requestType isEqualToString:@"/user/signout"]){
            responseContent = [NSDictionary dictionaryWithDictionary:jsonDic];
        }

        else
        {
            //其他
            responseContent = [NSDictionary dictionaryWithDictionary:jsonDic];
        }
         */
        
        
        if (responseContent) {
            resultBean.data = responseContent;
            responseBody.responseBean = resultBean;
        }
        return responseBody;
    }
    else
    {
        CommonResponseBean *errorBean = [self generateErrorBean];
        errorBean.message = nilOrJSONObjectForKey(jsonAllDic, @"message");
        responseBody.responseBean = errorBean;
    }
    
    return responseBody;
}

+ (CommonResponseHeader *)parserResponseHeader:(NSDictionary *)headers{
    
    if (headers && [headers count] > 0) {
        
        CommonResponseHeader *responseHeader = [[CommonResponseHeader alloc] init];
        
        for (NSString *headerKey in headers) {
            
            if ([HEADER_RESULT_CODE isEqualToString:headerKey]) {
                responseHeader.resultCode = [headers objectForKey:headerKey];
            }else if ([HEADER_DATE isEqualToString:headerKey]) {
                
                responseHeader.date = [headers objectForKey:headerKey];
                [[Globe sharedSingleton] setServerDateString:responseHeader.date];
                
            }else if ([HEADER_LINK isEqualToString:headerKey]) {
                
                NSString *originalLink = [headers objectForKey:headerKey];

                NSRange start = [originalLink rangeOfString:@"<"];
                NSRange end = [originalLink rangeOfString:@">"];
                
                if (start.location != NSNotFound && end.location != NSNotFound  ) {
                    
                    NSString *needLink;
                    needLink = [originalLink substringFromIndex:start.location + start.length];
                    needLink = [needLink substringToIndex:end.location - end.length];
                    
                    responseHeader.Link = needLink;
                }
            }
            
        }
        
        return responseHeader;
    }
    return nil;
}

+ (CommonResponseBean *)generateErrorBean{
    
    CommonResponseBean *errorBean = [[CommonResponseBean alloc] init];
    errorBean.code = @"400";
    errorBean.message = errorBean.message;
    errorBean.data = @"data_unknown";
    
    return errorBean;
}

@end
