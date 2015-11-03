//
//  SecondViewController.m
//  RRTC
//
//  Created by 鹿永超 on 15/7/16.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "SecondViewController.h"
//#import "LockCell.h"


static const CGFloat MJDuration = 2.0;
/**
 * 随机数据
 */
#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]
@interface SecondViewController ()
{
    // 当前的编辑模式
    UITableViewCellEditingStyle _editingStyle;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 用来显示的假数据 */
@property (strong, nonatomic) NSMutableArray *data;

@end

@implementation SecondViewController



-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.image = [UIImage imageNamed:@"second.png"];
        self.title = @"地锁";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"地锁"];
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 马上进入刷新状态
    [self.tableView.header beginRefreshing];
    
    
    UIBarButtonItem *addLock = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(deleteData)];
    [self.navigationItem setRightBarButtonItem:addLock];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellTableIdentifier = @"cell";
    
    //自定义Cell类
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleSubtitle)reuseIdentifier:CellTableIdentifier ];
    }
    cell.imageView.image = [UIImage imageNamed:@"停车"];
    cell.textLabel.text = @"万科星园/A001";
    cell.detailTextLabel.text = @"北京市朝阳区";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;//cell的个数
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;//cell的高度
}

#pragma mark - 数据处理相关
#pragma mark 下拉刷新数据
- (void)loadNewData
{
    // 1.添加假数据
    for (int i = 0; i<5; i++) {
        [self.data insertObject:MJRandomData atIndex:0];
    }
    
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView reloadData];
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.header endRefreshing];
    });
}

- (NSMutableArray *)data
{
    if (!_data) {
        self.data = [NSMutableArray array];
    }
    return _data;
}

//#pragma mark - 删除操作
//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //局部刷新又有动画效果
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
//    }
//    //
//}

#pragma mark 提交编辑操作时会调用这个方法(删除，添加)
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    // 删除操作
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // 1.删除数据
        [self.data removeObjectAtIndex:indexPath.row];
        
        // 2.更新UITableView UI界面
        // [tableView reloadData];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    } else {
        // 添加操作
        
        // 1.添加数据
        long int row = indexPath.row + 1;
        [self.data insertObject:@"新添加的数据" atIndex:row];
        
        // 2.更新UI界面
        //[tableView reloadData];
        NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:0];
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}
#pragma mark 决定tableview的编辑模式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _editingStyle;
}
#pragma mark 只有实现这个方法，编辑模式中才允许移动Cell
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    // NSLog(@"from(%i)-to(%i)", sourceIndexPath.row, destinationIndexPath.row);
    // 更换数据的顺序
    [self.data exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
}

#pragma mark - 公共方法
#pragma mark 删除数据
- (void)deleteData {
    _editingStyle = UITableViewCellEditingStyleDelete;
    
    // 开始编辑模式
    // self.tableView.editing = YES;
    // [self.tableView setEditing:YES];
    
    BOOL isEditing = self.tableView.isEditing;
    // 开启\关闭编辑模式
    [self.tableView setEditing:!isEditing animated:YES];
    
}

#pragma mark 添加数据
- (void)addData {
    _editingStyle = UITableViewCellEditingStyleInsert;
    
    BOOL isEditing = self.tableView.isEditing;
    // 开启\关闭编辑模式
    [self.tableView setEditing:!isEditing animated:YES];
}

@end
