//
//  FourViewController.h
//  RRTC
//
//  Created by 鹿永超 on 15/7/16.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "KeyBoardViewController.h"
#import "AddCarViewController.h"
#import "OrderViewController.h"
#import "ChangePSDViewController.h"
#import "SuggestViewController.h"

@interface FourViewController : KeyBoardViewController<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    
    IBOutlet UITableView *tableViewList;
    NSMutableArray *dataItems;
    NSMutableArray *iconItems;
    
    //绑定车辆
    AddCarViewController *addcar;
    
    //意见反馈
    SuggestViewController *suggset;
    
    //我的订单
    OrderViewController *order;
    
    //修改密码
    ChangePSDViewController *change;
}

@end
