//NSData additions from colloquy project

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface NSData (NSDataAdditions)
+ (NSData *) dataWithBase64EncodedString:(NSString *) string;
- (id) initWithBase64EncodedString:(NSString *) string;

- (NSString *) base64Encoding;
- (NSString *) base64EncodingWithLineLength:(unsigned int) lineLength;

- (BOOL) hasPrefix:(NSData *) prefix;
- (BOOL) hasPrefixBytes:(void *) prefix length:(unsigned int) length;

//获取图片类型（返回扩展名）
- (NSString *)detectImageSuffix;
@end
