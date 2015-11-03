//
//  BreakViewController.m
//  RRTCC
//
//  Created by 鹿永超 on 15/7/24.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "BreakViewController.h"
#import "MBProgressHUD.h"

@interface BreakViewController ()

@end

@implementation BreakViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // Do any additional setup after loading the view from its nib.
    [self.navigationItem setTitle:@"违章"];
    [self createNavgiBar];
    // 加载进度条
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://wap.bjjtgl.gov.cn"]];
    /*
     *   请求完成后进行的操作
     *   隐藏进度条
     */
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [self.illegal loadRequest:request];

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
