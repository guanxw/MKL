//
//  InterfaceUrlDefine.h
//  Taoxiaoxian
//
//  Created by tangjie on 15/5/26.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//
#import <Foundation/Foundation.h>

#ifndef Taoxiaoxian_InterfaceUrlDefine_h
#define Taoxiaoxian_InterfaceUrlDefine_h


//static NSString * const BASE_DATA_INTERFACE_URL = @"http://192.168.99.103:8086/zghAppAdmin/rest";
static NSString * const BASE_DATA_INTERFACE_URL = @"http://60.217.72.30:8088/zghAppAdmin/rest";

// 通知
static NSString *const NOTICE = @"/notification/getallnotification";
//通过关键字搜索通告
static NSString *const NOTICE_KEY = @"/notification/keynotification";
// 通知公告中发送消息
static NSString *const NOTICE_SENDMESSAGE = @"/user/sendmessage";
// 通知公告中发送已读回执
static NSString *const NOTICE_HASREAD = @"/hasread";
//根据Id获取通知
static NSString *const NOTICE_ID = @"/notification/getsingle";


//登录
static NSString *const USER_LOGIN = @"/user/login";
//找回密码
static NSString *const USER_FINDPD = @"/user/findpassword";
//下发验证码
static NSString *const USER_SENDVERCODE = @"/user/sendvercode";
//获取个人信息
static NSString *const USER_INFO = @"/user/getuserinfo";
//修改密码
static NSString *const USER_CHANGEPD = @"/user/changepassword";
//修改手机号
static NSString *const USER_CHANGEPHONE = @"/user/changephone";
//提交反馈
static NSString *const USER_SENDADVICE = @"/user/sendadvice";
//检查更新
static NSString *const USER_REFRESH = @"/system/refresh";
// 图片文件上传接口
static NSString *const IMAGE = @"/files/image";
//修改姓名
static NSString *const USER_CHANGENAME  = @"/user/changename";
//regid
static NSString *const REGID = @"/user/pass";
//退出登录
static NSString *const LOGOUT = @"/user/signout";

//获取用户通讯录接口
static NSString *const ADDRESSBOOK = @"/phonebood/getallphonebook";
static NSString *const ADDRESSBOOK_SEARCH = @"/phonebood/getphonebook";

#endif
