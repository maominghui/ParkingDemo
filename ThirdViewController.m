//
//  ThirdViewController.m
//  RRTC
//
//  Created by 鹿永超 on 15/7/16.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "ThirdViewController.h"
#import "MBProgressHUD.h"
#import "SVWebViewController.h"

/**
 *每个Cell的高度
 */
#define kTableViewCell 50

@interface ThirdViewController ()<UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ThirdViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.image = [UIImage imageNamed:@"third.png"];
        self.tabBarItem.title = @"发现";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"发现"];
    
    //防止通知栏UINavigationBar遮挡view
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    dataItems = [[NSMutableArray alloc]initWithObjects:@"绑定车辆",@"服务电话",@"意见反馈",nil];
    iconItems = [[NSMutableArray alloc]initWithObjects:@"天气",@"限行",@"违章",nil];
    
    // 删除其他空行
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = view;

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma - 进入三个页面、天气等页面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 进入天气页面
    if (indexPath.row == 0)
    {

        weather = [[WeatherViewController alloc]initWithNibName:@"WeatherViewController" bundle:nil];
        UINavigationController *myWeather = [[UINavigationController alloc]initWithRootViewController:weather];
        [self.navigationController presentViewController:myWeather animated:NO completion:nil];
    }
    //进入限行页面
    else if (indexPath.row == 1)
    {
//        limit = [[LimitViewController alloc]initWithNibName:@"LimitViewController" bundle:nil];
//        UINavigationController *myLimit = [[UINavigationController alloc]initWithRootViewController:limit];
//        [self.navigationController presentViewController:myLimit animated:NO completion:nil];
        
        NSURL *URL = [NSURL URLWithString:@"http://maominghui.github.io"];
        SVWebViewController *webViewController = [[SVWebViewController alloc] initWithURL:URL];
        UINavigationController *me = [[UINavigationController alloc]initWithRootViewController:webViewController];
        [self.navigationController presentViewController:me animated:NO completion:nil];
}
    //进入违章页面
    else if (indexPath.row == 2)
    {
        NSURL *URL2 = [NSURL URLWithString:@"http://wap.bjjtgl.gov.cn"];
        SVWebViewController *webViewController2 = [[SVWebViewController alloc] initWithURL:URL2];
        UINavigationController *me2 = [[UINavigationController alloc]initWithRootViewController:webViewController2];
        [self.navigationController presentViewController:me2 animated:NO completion:nil];    }
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
