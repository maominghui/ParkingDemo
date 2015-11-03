//
//  MyOrderVC.m
//  RRTCC
//
//  Created by 鹿永超 on 15/7/29.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "MyOrderVC.h"
#import "MyInfoModel.h"
#import "orderCell.h"
#import "FinishedViewController.h"

@interface MyOrderVC ()
{
    NSArray  *_dataArray;       //数据数组
    NSMutableArray *_orderList; //订单列表
}

@end

@implementation MyOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"已完成订单";
    [self createNavgiBar];
    
    
    //初始化数据数组
    _dataArray = @[@[@"06月29日 10:08",@"知春路科学院南路",@"已完成"],
                   @[@"06月17日 19:27",@"清华东路35号北京林业大学",@"已完成"],
                   @[@"06月11日 16:35",@"海淀区中关村大街",@"已完成"],
                   @[@"05月15日 12:44",@"知春路",@"已完成"]];
    
    //初始化订单列表
    _orderList = [[NSMutableArray alloc]init];
    for (int i = 0; i < _dataArray.count; i++) {
        //初始化数据模型
        MyInfoModel *orderModel = [[MyInfoModel alloc]initWithcarID:i
                                                            carTime:_dataArray[i][0]
                                                        carLocation:_dataArray[i][1]
                                                             finish:_dataArray[i][2]];
    
    //添加订单模型到订单列表中
    [_orderList addObject:orderModel];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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

//记录行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _orderList.count;
}

/**
 3、设置行的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88.0f;
}

// 设置方式2
/**
 4、返回指定的 row 的 cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1. cell标示符，使cell能够重用
    static NSString *paperCell = @"paperCell";
    // 2. 从TableView中获取标示符为paperCell的Cell
    orderCell *cell = (orderCell *)[tableView dequeueReusableCellWithIdentifier:paperCell];
    // 如果 cell = nil , 则表示 tableView 中没有可用的闲置cell
    if(cell == nil){
        // 3. 把 WPaperCell.xib 放入数组中
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"orderCell" owner:self options:nil] ;
        
        // 获取nib中的第一个对象
        for (id oneObject in nib){
            // 判断获取的对象是否为自定义cell
            if ([oneObject isKindOfClass:[orderCell class]]){
                // 4. 修改 cell 对象属性
                cell = [(orderCell *)oneObject initWithStyle:UITableViewCellStyleDefault reuseIdentifier:paperCell];
            }
        }
    }
    // 5. 设置单元格属性
    [cell setupCell:_orderList[indexPath.row]];
    return cell;
}

/**
 5、点击单元格时的处理
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FinishedViewController *finished = [[FinishedViewController alloc]initWithNibName:@"FinishedViewController" bundle:nil];
    UINavigationController *myFinished = [[UINavigationController alloc]initWithRootViewController:finished];
    [self.navigationController presentViewController:myFinished animated:NO completion:nil];
}



@end
