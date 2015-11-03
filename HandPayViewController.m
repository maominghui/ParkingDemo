//
//  HandPayViewController.m
//  RRTCC
//
//  Created by 鹿永超 on 15/7/21.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "HandPayViewController.h"
#import "RechargeVC.h"


@interface HandPayViewController ()

@end

@implementation HandPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationItem setTitle:@"支付"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pay:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"是否确认本次支付" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [alert show];
}

#pragma - 隐藏TabBar
- (void)viewWillAppear:(BOOL)animated {
    if (self.navigationController.viewControllers.count > 1)
    {
        self.tabBarController.tabBar.hidden = YES;
    }
    else
    {
        self.tabBarController.tabBar.hidden = NO;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    if (self.navigationController.viewControllers.count > 1)
    {
        self.tabBarController.tabBar.hidden = NO;
    }
    else
    {
        self.tabBarController.tabBar.hidden = NO;
    }
    
}


- (IBAction)recharge:(id)sender {
    RechargeVC *recharge = [[RechargeVC alloc]initWithNibName:@"RechargeVC" bundle:nil];
    UINavigationController *charge = [[UINavigationController alloc]initWithRootViewController:recharge];
    [self.navigationController presentViewController:charge animated:NO completion:nil];
}

@end
