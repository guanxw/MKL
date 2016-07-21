//
//  CommonResponseBean.h
//  EveryOneHospital
//
//  Created by Apple on 16/4/25.
//  Copyright © 2016年 wangyanjiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonResponseBean : NSObject
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) id data;
@end
