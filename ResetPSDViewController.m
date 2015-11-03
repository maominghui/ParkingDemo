//
//  ResetPSDViewController.m
//  RRTCC
//
//  Created by 鹿永超 on 15/7/22.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "ResetPSDViewController.h"

@interface ResetPSDViewController ()

@end

@implementation ResetPSDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationItem setTitle:@"重置密码"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
