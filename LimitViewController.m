//
//  LimitViewController.m
//  RRTCC
//
//  Created by 鹿永超 on 15/7/24.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "LimitViewController.h"
#import "MBProgressHUD.h"

@interface LimitViewController ()

@end

@implementation LimitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNavgiBar];
    // Do any additional setup after loading the view from its nib.
    [self.navigationItem setTitle:@"限行"];
    // 加载进度条
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];

    
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.bjjtgl.gov.cn/zhuanti/10weihao/index.html"]];
    /*
     *   请求完成后进行的操作
     *   隐藏进度条
     */
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [self.limit loadRequest:request];
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
