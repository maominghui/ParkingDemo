//
//  FindPasswordViewController.m
//  RRTCC
//
//  Created by 鹿永超 on 15/7/16.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "FindPasswordViewController.h"
#import "ResetPSDViewController.h"

@interface FindPasswordViewController ()
{
    IBOutlet UIButton *l_timeButton;
}

@end

@implementation FindPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationItem setTitle:@"找回密码"];
    // 获取验证码倒计时
    [l_timeButton addTarget:self action:@selector(startTime) forControlEvents:UIControlEventTouchUpInside];
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
- (IBAction)resetPsd:(UIButton *)sender {
    ResetPSDViewController *reset = [[ResetPSDViewController alloc]initWithNibName:@"ResetPSDViewController" bundle:nil];
    [self.navigationController pushViewController:reset animated:YES];
}

#pragma mark - 获取验证码
-(void)startTime{
    __block int timeout=60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [l_timeButton setTitle:@"发送验证码" forState:UIControlStateNormal];
                l_timeButton.userInteractionEnabled = YES;
            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                //NSLog(@"____%@",strTime);
                [l_timeButton setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                l_timeButton.userInteractionEnabled = NO;
                
            });
            timeout--;
            
        }
    });
    dispatch_resume(_timer);
    
}

@end
