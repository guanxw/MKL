//
//  UIView+Extension.m
//  MakerOnly
//
//  Created by 王一 on 16/8/16.
//  Copyright © 2016年 WinnerChao. All rights reserved.
//

#import "UIView+Extension.h"
//extension 延展

@implementation UIView (Extension)
-(void)setSize:(CGSize)size{

    CGRect fram = self.frame;
    
    fram.size = size;
    //将尺寸赋值到 UIview上
    self.frame = fram;

}
-(CGSize)size{

    return self.frame.size;
}

-(void)setWidth:(CGFloat)width{
    
    CGRect fram = self.frame;
    
    fram.size.width = width;
    
    self.frame = fram;
    
}
-(CGFloat)width{

    return self.frame.size.width;
}
-(void)setHeigth:(CGFloat)heigth{
    
    CGRect fram = self.frame;
    
    fram.size.height = heigth;
    
    self.frame = fram;

}
-(CGFloat)heigth{

    return  self.frame.size.height;
}
-(void)setX:(CGFloat)x{
    
    CGRect fram = self.frame;
    
    fram.origin.x = x;
    
    self.frame = fram;
}
-(CGFloat)x{

    return  self.frame.origin.x;
}
-(void)setY:(CGFloat)y{

    CGRect fram = self.frame;
    
    fram.origin.y = y;
    
    self.frame = fram;

}
-(CGFloat)y{

    return  self.frame.origin.y;
}
@end
