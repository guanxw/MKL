//
//  CommonErrorResultParser.h
//  Taoxiaoxian
//
//  Created by tangjie on 15/5/26.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonErrorResultParser : NSObject

+ (id)parseResult:(NSDictionary *)jsonDic;

@end
