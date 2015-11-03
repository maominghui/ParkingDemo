//
//  FourViewController.m
//  RRTC
//
//  Created by 鹿永超 on 15/7/16.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "FourViewController.h"
#import "CoreMediaFuncManagerVC.h"
#import "NavigationViewController.h"

/**
 *每个Cell的高度
 */
#define kTableViewCell 50

@interface FourViewController ()<UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation FourViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.image = [UIImage imageNamed:@"four.png"];
        self.title = @"我";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    //设置顶部状态栏标题
//    [self.navigationItem setTitle:@"我"];
    
    //防止通知栏UINavigationBar遮挡view
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    dataItems = [[NSMutableArray alloc]initWithObjects:@"绑定车辆",@"服务电话",@"意见反馈",@"我的订单",@"修改密码",nil];
    iconItems = [[NSMutableArray alloc]initWithObjects:@"绑定车辆",@"服务电话",@"意见反馈",@"我的订单",@"修改密码",nil];
    
    // 删除其他空行
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = view;
    
    // 注销按钮
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithTitle:@"注销" style:UIBarButtonItemStylePlain target:self action:@selector(onTouchRightBarButton)];
    [self.navigationItem setRightBarButtonItem:rightBarButton];
    
    
}



#pragma mark -注销按钮
-(void)onTouchRightBarButton
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"确认要注销当前用户登录吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [alert show];
}


#pragma mark -Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataItems count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        //实例化cell时注意样式由原来的UITableViewCellStyleDefault缺省改成UITableViewCellStyleSubtitle
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] ;
    }
    NSUInteger row=[indexPath row];
    //添加图标
    cell.imageView.image =[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[iconItems objectAtIndex:row]]];
    cell.textLabel.text=[iconItems objectAtIndex:row];
    //导航按钮
    cell.accessoryType= UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  - 登录界面
- (IBAction)login:(UIButton *)sender {
    LoginViewController *login = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
        UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:login];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}

#pragma - 注册界面
- (IBAction)regist:(UIButton *)sender {
    RegisterViewController *regist = [[RegisterViewController alloc]initWithNibName:@"RegisterViewController" bundle:nil];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:regist];

    [self.navigationController presentViewController:nav animated:YES completion:nil];
}


#pragma - 进入个人中心列表页面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        // 进入增加车辆页面
        addcar = [[AddCarViewController alloc]initWithNibName:@"AddCarViewController" bundle:nil];
        UINavigationController *add_car = [[UINavigationController alloc]initWithRootViewController:addcar];
        [self.navigationController presentViewController:add_car animated:YES completion:nil];
    }
    else if (indexPath.row == 1) {
        [CoreMediaFuncManagerVC call:@"4000000000" inViewController:self failBlock:^{
            NSLog(@"不能打");
        }];

    }
    else if (indexPath.row == 2)
    {
        //意见反馈
        suggset = [[SuggestViewController alloc]initWithNibName:@"SuggestViewController" bundle:nil];
        UINavigationController *mySuggest = [[UINavigationController alloc]initWithRootViewController:suggset];
        [self.navigationController presentViewController:mySuggest animated:YES completion:nil];
    }
    else if (indexPath.row == 3)
    {
        // 我的订单
        order = [[OrderViewController alloc]initWithNibName:@"OrderViewController" bundle:nil];
        UINavigationController *myOrder = [[UINavigationController alloc]initWithRootViewController:order];
        [self.navigationController presentViewController:myOrder animated:YES completion:nil];
    }
    else if (indexPath.row == 4)
    {
        // 修改密码
        change = [[ChangePSDViewController alloc]initWithNibName:@"ChangePSDViewController" bundle:nil];
        UINavigationController *myChage = [[UINavigationController alloc]initWithRootViewController:change];
        [self.navigationController presentViewController:myChage animated:YES completion:nil];
    }
}



@end
