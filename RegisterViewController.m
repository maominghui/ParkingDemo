//
//  RegisterViewController.m
//  RRTCC
//
//  Created by 鹿永超 on 15/7/16.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "RegisterViewController.h"
#import "MBProgressHUD.h"

@interface RegisterViewController ()
{
    IBOutlet UIButton *l_timeButton;
}

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"注册"];
    
    //加载导航条
    [self createNavgiBar];
    
    // 获取验证码倒计时
    [l_timeButton addTarget:self action:@selector(startTime) forControlEvents:UIControlEventTouchUpInside];
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


- (IBAction)setPsd:(UIButton *)sender {
    SetPasswordViewController *setPsd = [[SetPasswordViewController alloc]initWithNibName:@"SetPasswordViewController" bundle:nil];
    UINavigationController *setP = [[UINavigationController alloc]initWithRootViewController:setPsd];
    [self.navigationController presentViewController:setP animated:NO completion:nil];
}
- (IBAction)next:(UIButton *)sender {
    // 提示用户输入失败
    
    if (_registerPhone.text.length == 0 || _number.text.length == 0 ) {
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"手机号码或验证码不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            //在此处填写点击取消按钮后执行的方法
            self.registerPhone.text = @"";
            self.number.text = @"";
        }];
        [alertView addAction:cancelButton];
        [self presentViewController:alertView animated:YES completion:Nil];
    }
    else if (_registerPhone.text.length > 12 || _number < 0)
    {
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"请重新输入你的号码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            //在此处填写点击取消按钮后执行的方法
            self.registerPhone.text = @"";
            self.number.text = @"";
        }];
        [alertView addAction:cancelButton];
        [self presentViewController:alertView animated:YES completion:Nil];
    }
    else
    {
        // 加载进度条
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        /*
         *   请求完成后进行的操作
         *   隐藏进度条
         */
        [MBProgressHUD hideHUDForView:self.view animated:YES];
//        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"登录成功" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//        }];
//        [alertView addAction:cancelButton];
//        [self presentViewController:alertView animated:YES completion:Nil];
        
    }

}

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
