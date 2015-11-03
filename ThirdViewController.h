//
//  ThirdViewController.h
//  RRTC
//
//  Created by 鹿永超 on 15/7/16.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyBoardViewController.h"
#import "WeatherViewController.h"
#import "LimitViewController.h"
#import "BreakViewController.h"

@interface ThirdViewController : KeyBoardViewController<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    IBOutlet UITableView *tableViewList;
    NSMutableArray *dataItems;
    NSMutableArray *iconItems;
    
    //天气页面
    WeatherViewController *weather;
    
    //限行
    LimitViewController *limit;
    
    //违章
    BreakViewController *illegal;
}
@end
