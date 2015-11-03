//
//  OrderViewController.h
//  RRTCC
//
//  Created by 鹿永超 on 15/7/21.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UnfinishedViewController.h"
#import "FinishedViewController.h"
#import "MyOrderVC.h"

@interface OrderViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *tableViewList;
    NSMutableArray *dataItems;
    NSMutableArray *iconItems;
    
    //未完成订单
    UnfinishedViewController *unfinished;
    
    //已完成订单
    MyOrderVC *finished;
}

@end
