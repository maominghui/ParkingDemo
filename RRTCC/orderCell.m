//
//  orderCell.m
//  RRTCC
//
//  Created by 鹿永超 on 15/7/29.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "orderCell.h"

@implementation orderCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/**
 * 设置cell
 */

-(void)setupCell:(MyInfoModel *)model
{
    self.lblTime.text = model.carTime;
    self.lblFinish.text = model.carFinish;
    self.lblLocation.text = model.carLocation;
}



@end
