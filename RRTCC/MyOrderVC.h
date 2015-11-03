//
//  MyOrderVC.h
//  RRTCC
//
//  Created by 鹿永超 on 15/7/29.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOrderVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
