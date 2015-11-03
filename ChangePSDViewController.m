//
//  ChangePSDViewController.m
//  RRTCC
//
//  Created by 鹿永超 on 15/7/21.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "ChangePSDViewController.h"

@interface ChangePSDViewController ()

@end

@implementation ChangePSDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNavgiBar];
    [self.navigationItem setTitle:@"修改密码"];
    
    //防止通知栏UINavigationBar遮挡view
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
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
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}



@end
