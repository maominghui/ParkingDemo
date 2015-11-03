//
//  SearchViewController.h
//  RRTCC
//
//  Created by 鹿永超 on 15/7/27.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationViewController.h"

@interface SearchViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) UITableView *myTableView;
@property (nonatomic, retain) NSMutableArray *dataArray;

@property (nonatomic, retain) NSString *passCode;

@end
