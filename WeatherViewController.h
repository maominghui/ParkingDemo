//
//  WeatherViewController.h
//  RRTCC
//
//  Created by 鹿永超 on 15/7/17.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface WeatherViewController : UIViewController<UIWebViewDelegate>
{
    MBProgressHUD * mbProgressHUB ; //进度条
}
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
