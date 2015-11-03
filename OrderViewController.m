//
//  OrderViewController.m
//  RRTCC
//
//  Created by 鹿永超 on 15/7/21.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "OrderViewController.h"

@interface OrderViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNavgiBar];
    [self.navigationItem setTitle:@"我的订单"];
    
    dataItems = [[NSMutableArray alloc]initWithObjects:@"未完成订单",@"已完成订单",nil];
    iconItems = [[NSMutableArray alloc]initWithObjects:@"未完成订单",@"已完成订单",nil];
    
    // 删除其他空行
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = view;
    
    
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        unfinished = [[UnfinishedViewController alloc]initWithNibName:@"UnfinishedViewController" bundle:nil];
        UINavigationController *MyUnfinished = [[UINavigationController alloc]initWithRootViewController:unfinished];
        [self.navigationController presentViewController:MyUnfinished animated:NO completion:nil];
    }
    if (indexPath.row == 1) {
        finished = [[MyOrderVC alloc]initWithNibName:@"MyOrderVC" bundle:nil];
        UINavigationController *Myfinished = [[UINavigationController alloc]initWithRootViewController:finished];
        [self.navigationController presentViewController:Myfinished animated:NO completion:nil];
    }
}


@end
