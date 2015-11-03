//
//  WeatherViewController.m
//  RRTCC
//
//  Created by 鹿永超 on 15/7/17.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "WeatherViewController.h"
#import "MBProgressHUD.h"

@interface WeatherViewController ()

@end
@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNavgiBar];
    
    [self.navigationItem setTitle:@"天气"];

    
    // 加载进度条
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://yuntu.amap.com/share/yeUbum"]];
    [self.webView loadRequest:request];

    /*
     *   请求完成后进行的操作
     *   隐藏进度条
     */
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    
   
       // 定期处理缓存
       //    if (缓存没有达到7天) {
       //        request.cachePolicy = NSURLRequestReturnCacheDataElseLoad;
       //    }
       // 获得全局的缓存对象
       NSURLCache *cache = [NSURLCache sharedURLCache];
       //    if (缓存达到7天) {
       //        [cache removeCachedResponseForRequest:request];
       //    }
     
       // lastCacheDate = 2014-06-30 11:04:30
     
       NSCachedURLResponse *response = [cache cachedResponseForRequest:request];
       if (response) {
       NSLog(@"---这个请求已经存在缓存");
       } else {
       NSLog(@"---这个请求没有缓存");
       }
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma - 导航条

-(void)createNavgiBar
{
    
    UIButton *leftButn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    leftButn.frame = CGRectMake(15, 15, 18, 25);
    [leftButn setBackgroundImage:[UIImage imageNamed:@"返回键.png"] forState:UIControlStateNormal];
    [leftButn addTarget:self action:@selector(leftKey) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButn];
    self.navigationItem.leftBarButtonItem =  leftItem;
    
}

-(void)leftKey
{
    [self.navigationController dismissViewControllerAnimated:NO completion:nil];
}



@end
