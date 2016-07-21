//
//  CommonResultParser.h
//  EveryOneHospital
//
//  Created by Apple on 16/4/25.
//  Copyright © 2016年 wangyanjiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonResultParser : NSObject

+ (id)parseResult:(NSDictionary *)jsonDic;
@end
