//
//  TradeShowViewCell.m
//  MakerOnly
//
//  Created by Jared on 16/8/6.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "TradeShowViewCell.h"

@implementation TradeShowViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageView.image = [UIImage imageNamed:@"tradeShow"];
}

@end
