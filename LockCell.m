//
//  LockCell.m
//  RRTCC
//
//  Created by 鹿永超 on 15/7/17.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "LockCell.h"

@implementation LockCell
@synthesize nameLabel;
@synthesize headImageView;
@synthesize locationLabel;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
