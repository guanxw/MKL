//
//  base64.h
//  Taoxiaoxian
//
//  Created by evil on 15/4/9.
//  Copyright (c) 2015年 taoxiaoxian. All rights reserved.
//

#import <Foundation/Foundation.h>

extern size_t EstimateBas64EncodedDataSize(size_t inDataSize);
extern size_t EstimateBas64DecodedDataSize(size_t inDataSize);

extern bool Base64EncodeData(const void *inInputData, size_t inInputDataSize, char *outOutputData, size_t *ioOutputDataSize, BOOL wrapped);
extern bool Base64DecodeData(const void *inInputData, size_t inInputDataSize, void *ioOutputData, size_t *ioOutputDataSize);

