//
//  LockCell.h
//  RRTCC
//
//  Created by 鹿永超 on 15/7/17.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LockCell : UITableViewCell<NSObject>

// 图片
@property (strong, nonatomic) IBOutlet UIImageView *headImageView;

// 小区名
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

// 位置名称
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;

// 地锁
@property (strong, nonatomic) IBOutlet UILabel *parkingLabel;


@end
