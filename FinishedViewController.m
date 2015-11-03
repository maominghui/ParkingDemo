//
//  FinishedViewController.m
//  RRTCC
//
//  Created by 鹿永超 on 15/7/21.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "FinishedViewController.h"
#import "AppDelegate.h"
#import "FourViewController.h"

@interface FinishedViewController ()

@end

@implementation FinishedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationItem setTitle:@"完成订单"];
    [self createNavgiBar];
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
