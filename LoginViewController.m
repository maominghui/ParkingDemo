//
//  LoginViewController.m
//  RRTC
//
//  Created by 鹿永超 on 15/7/16.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "LoginViewController.h"
#import "MBProgressHUD.h"
#import "FourViewController.h"



@interface LoginViewController ()

#pragma mark - 用户账号
@property (strong, nonatomic) IBOutlet UITextField *userAccount;
#pragma mark - 用户密码
@property (strong, nonatomic) IBOutlet UITextField *userPassword;
#pragma - 登录按钮
@property (strong, nonatomic) IBOutlet UIButton *login;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNavgiBar];
    [self.navigationItem setTitle:@"登录"];
    
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
//    imageView.image = [UIImage imageNamed:@"主背景"];
//    [self.view addSubview:imageView];
//    //防止通知栏UINavigationBar遮挡view
//    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }
    
//    //设置导航条颜色
//    [self.navigationController.navigationBar setTintColor:[UIColor blueColor]];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma - 隐藏TabBar
- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    NSLog(@"1");
//    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    if (self.navigationController.viewControllers.count > 1) {
        self.tabBarController.tabBar.hidden = YES;
    }else {
        self.tabBarController.tabBar.hidden = NO;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    if (self.navigationController.viewControllers.count > 1) {
        self.tabBarController.tabBar.hidden = NO;
    }else {
        self.tabBarController.tabBar.hidden = NO;
    }

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

#pragma - 点击登录按钮
- (IBAction)login:(UIButton *)sender
{
    // 提示用户输入失败
    if (_userAccount.text.length == 0 || _userPassword.text.length == 0 ) {
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"账号或密码不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            //在此处填写点击取消按钮后执行的方法
            self.userAccount.text = @"";
            self.userPassword.text = @"";
        }];
        [alertView addAction:cancelButton];
        [self presentViewController:alertView animated:YES completion:Nil];
    }
    else if (_userAccount.text.length > 12 || _userAccount < 0)
    {
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"请重新输入你的号码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            //在此处填写点击取消按钮后执行的方法
            self.userAccount.text = @"";
            self.userPassword.text = @"";
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
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"登录成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        }];
        [alertView addAction:cancelButton];
        [self presentViewController:alertView animated:YES completion:Nil];

    }
    
}
- (IBAction)regist:(UIButton *)sender {
    RegisterViewController *regist = [[RegisterViewController alloc]initWithNibName:@"RegisterViewController" bundle:nil];
    [self.navigationController pushViewController:regist animated:YES];
}
- (IBAction)findPsd:(UIButton *)sender {
    FindPasswordViewController *findPsd = [[FindPasswordViewController alloc]initWithNibName:@"FindPasswordViewController" bundle:nil];
    [self.navigationController pushViewController:findPsd animated:YES];
}

#pragma mark - 键盘操作

- (void)hidenKeyboard
{
    [_userAccount resignFirstResponder];
    [_userPassword resignFirstResponder];
}

- (void)returnOnKeyboard:(UITextField *)sender
{
    if (sender == _userAccount) {
        [_userPassword becomeFirstResponder];
    } else if (sender == _userPassword) {
        [self hidenKeyboard];
        if (_login.enabled) {
            [self login];
        }
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
