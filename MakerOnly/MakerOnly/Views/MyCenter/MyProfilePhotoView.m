//
//  MyProfilePhotoView.m
//  MakerOnly
//
//  Created by Jared on 16/7/19.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "MyProfilePhotoView.h"

@implementation MyProfilePhotoView

- (void)initViews{
    
    self.iconImageView.layer.cornerRadius = self.iconImageView.frame.size.width/2;
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.image = [UIImage imageNamed:@"icon.png"];
}

@end
