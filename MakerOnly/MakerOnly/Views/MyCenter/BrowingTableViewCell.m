//
//  BrowingTableViewCell.m
//  MakerOnly
//
//  Created by Jared on 16/8/3.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "BrowingTableViewCell.h"

@implementation BrowingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpCell];
    }
    return self;
}

- (void)setUpCell{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
