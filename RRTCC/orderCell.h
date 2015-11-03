//
//  orderCell.h
//  RRTCC
//
//  Created by 鹿永超 on 15/7/29.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyInfoModel.h"
#import "MyOrderVC.h"

@interface orderCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *lblTime;        //时间标签
@property (strong, nonatomic) IBOutlet UILabel *lblFinish;      //完成标签
@property (strong, nonatomic) IBOutlet UILabel *lblLocation;    //地点标签


/**
 设置cell
 */
-(void)setupCell:(MyInfoModel *)model;


@end
