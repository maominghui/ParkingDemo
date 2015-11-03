//
//  AddCarViewController.m
//  RRTCC
//
//  Created by 鹿永超 on 15/7/16.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "AddCarViewController.h"
#import "iOSCombobox.h"

@interface AddCarViewController ()

@end

@implementation AddCarViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createNavgiBar];
    [self.navigationItem setTitle:@"绑定车辆"];
    
    //防止通知栏UINavigationBar遮挡view
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }

    
    iOSCombobox *combo = [[iOSCombobox alloc] initWithFrame:CGRectMake(10.0f, 150.0f, 60.0f,30.0f)];
    [combo setValues:@[@"京", @"津",@"冀",@"晋",@"蒙",@"辽",@"吉",@"黑",@"沪",@"苏",@"浙",@"皖",@"闽",@"赣",@"鲁",@"豫",@"鄂",@"湘",@"粤",@"桂",@"琼",@"渝",@"川",@"贵",@"云",@"藏",@"陕",@"甘",@"青",@"宁",@"新",@"港",@"澳",@"台"]];
    [combo setCurrentValue:@"京"];
    [combo setDelegate:self];
    [self.view addSubview:combo];
    
    [self setKeybc:[[BSKeyboardControls alloc] initWithFields:@[combo, self.carNumber]]];
    [self.keybc setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
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



- (void)keyboardControlsDonePressed:(BSKeyboardControls *)keyboardControls
{
    [[keyboardControls activeField] resignFirstResponder];
}

- (void)comboboxOpened:(iOSCombobox *)combobox
{
    [self.keybc setActiveField:combobox];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.keybc setActiveField:textField];
}
@end
