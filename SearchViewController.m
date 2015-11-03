//
//  SearchViewController.m
//  RRTCC
//
//  Created by 鹿永超 on 15/7/27.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "SearchViewController.h"
#import "FMDatabase.h"
#import "FMResultSet.h"
#import "FMDatabaseQueue.h"

@interface SearchViewController ()<UISearchBarDelegate,UIAlertViewDelegate>
{
    UISearchBar *searchBar;
    UISegmentedControl *segmentControl;
}

@end

@implementation SearchViewController
@synthesize myTableView;
@synthesize dataArray;
@synthesize passCode;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createNav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createNav
{
    UIButton *leftBtn = [ButtonModel CreateLeftmBtn:[UIImage imageNamed:@"返回键"] andWithSEL:@selector(leftBtnAction) andTarget:self];
    UIButton *rightBtn = [ButtonModel CreateRightBtn:[UIImage imageNamed:@""] andWithSEL:@selector(rightBtnSearch) andTarget:self andTitle:@"搜索"];
    
    UIBarButtonItem *leftItemBtn = [[UIBarButtonItem alloc]initWithCustomView: leftBtn];
    UIBarButtonItem *rightItemBtn = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    self.navigationItem.leftBarButtonItem = leftItemBtn;
    self.navigationItem.rightBarButtonItem = rightItemBtn;
    
    searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(60, 5, 150, 40)];
    searchBar.placeholder = @"停车场";
    searchBar.searchBarStyle = UISearchBarStyleDefault;
    searchBar.delegate = self;
    searchBar.returnKeyType = UIReturnKeyDone;
    
    //清除背景颜色
    searchBar.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = searchBar;

}


-(void)leftBtnAction{
    [self.navigationController dismissViewControllerAnimated:NO completion:nil];
}


//点击右键
-(void)rightBtnSearch
{
    NSLog(@"点击搜索------------------------%@", searchBar.text);
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [path objectAtIndex:0];
    NSString *dbPath = [documentPath stringByAppendingPathComponent:@"parkingdata.db"];
    NSLog(@"NSDocumentDirectory:%@",documentPath);
    NSLog(@"NSDocumentDirectory:%@",dbPath);
    
    FMDatabase *database = [FMDatabase databaseWithPath:dbPath];
    if (![database open]) {
        NSLog(@"打开数据库失败");
    }
    else
    {
        NSLog(@"打开数据库成功");
        BOOL result = [database executeUpdate:@"CREATE TABLE IF NOT EXISTS saveData(searchBarText TEXT)"];
        if (result) {
            NSLog(@"创建表成功");
        }
        else
        {
            NSLog(@"创建表失败");
        }
        
        BOOL res = [database executeUpdate:@"insert into saveData(searchBarText) values(?)",searchBar.text];
        if (res == NO) {
            NSLog(@"插入数据库失败");
        }
    }
    
    //关闭数据库
    [database close];
    
    if (searchBar.text.length > 0) {

    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"输入框不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
    
}


#pragma mark------UITableView Delegate Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        if (dataArray.count>0) {
            return dataArray.count;
        }else{
            return 0;
        }
    }else{
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (dataArray.count>0) {
            cell.textLabel.text = [dataArray objectAtIndex:dataArray.count-indexPath.row-1];
        }
        
        return cell;
    }else{
        static NSString *CellWithIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = @"清空浏览记录";
        cell.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        return cell;
        
    }
    
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if(indexPath.section == 0){
//        comeSearchVC *comeVC = [[comeSearchVC alloc]init];
//        UINavigationController *nag = [[UINavigationController alloc]initWithRootViewController:comeVC];
//        comeVC.myTextValue = [dataArray objectAtIndex:dataArray.count-indexPath.row-1];
//        comeVC.passCode = passCode;
//        [self.navigationController presentViewController:nag animated:NO completion:nil];
//        
//    }else{
//        [dataArray removeAllObjects];
//        [self deleteData];
//        [myTableView reloadData];
//        NSLog(@"点击");
//        
//    }
//    
//}

@end
