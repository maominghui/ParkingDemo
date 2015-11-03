//
//  FirstViewController.m
//  RRTC
//
//  Created by 鹿永超 on 15/7/16.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "FirstViewController.h"
#import "SearchViewController.h"
//#import "BaseNaviViewController.h"


@interface FirstViewController ()



@end

@implementation FirstViewController
@synthesize passCode;



-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.image = [UIImage imageNamed:@"first.png"];
        self.tabBarItem.title = @"地图";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //点击搜索图标
    [self initSeatch];

    
//    //点击搜索框
//    [self searchParking];
    
    // Do any additional setup after loading the view from its nib.
    [self.navigationItem setTitle:@"地图"];

    
    _mapView.showsUserLocation = YES; // 开启定位功能YES为打开，NO为关闭
    [_mapView setUserTrackingMode: MAUserTrackingModeFollow animated:YES]; //地图跟着位置移动
    
    
//    //搜索
//    //初始化检索对象
//    _search = [[AMapSearchAPI alloc] initWithSearchKey:@"61d97c08334c007fd84e1e25a375a052" Delegate:self];
//    
//    //构造AMapPlaceSearchRequest对象，配置关键字搜索参数
//    AMapPlaceSearchRequest *poiRequest = [[AMapPlaceSearchRequest alloc] init];
//    poiRequest.searchType = AMapSearchType_PlaceKeyword;
//    poiRequest.keywords = @"俏江南";
//    poiRequest.city = @[@"beijing"];
//    poiRequest.requireExtension = YES;
//    
//    //发起POI搜索
//    [_search AMapPlaceSearch: poiRequest];


    // 注销按钮
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithTitle:@"导航" style:UIBarButtonItemStylePlain target:self action:@selector(onTouchRightBarButton)];
    [self.navigationItem setLeftBarButtonItem:rightBarButton];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onTouchRightBarButton
{
    NavigationViewController *navi = [[NavigationViewController alloc]init];
    UINavigationController *nag = [[UINavigationController alloc]initWithRootViewController:navi];
    [self.navigationController presentViewController:nag animated:NO completion:nil];
}

//-(void)searchParking{
//    /* UISearchBar的常用方法 搜索*/
//    UISearchBar *oneSearchBar = [[UISearchBar alloc] init];
//    oneSearchBar.frame = CGRectMake(0, 0, 320, 50); // 设置位置和大小
//    oneSearchBar.keyboardType = UIKeyboardTypeEmailAddress; // 设置弹出键盘的类型
//    oneSearchBar.barStyle = UIBarStyleBlackTranslucent; // 设置UISearchBar的样式
//    oneSearchBar.tintColor = [UIColor whiteColor]; // 设置光标颜色
//    oneSearchBar.placeholder = @"停车场"; // 设置提示文字
//    oneSearchBar.delegate = self; // 设置代理
//    oneSearchBar.keyboardType = UIBarStyleDefault;
//    [self.view addSubview:oneSearchBar];
//}

-(void)viewDidAppear:(BOOL)animated
{
    

    
    MAPointAnnotation * pointAnnotation = [[MAPointAnnotation alloc]init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(39.989, 116.481);
    pointAnnotation.title = @"￥6";
    [_mapView addAnnotation:pointAnnotation];
    
    [super viewDidAppear:animated];
    //获取地图信息
    //配置用户key
    [MAMapServices sharedServices].apiKey = @"61d97c08334c007fd84e1e25a375a052";
    
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    _mapView.delegate = self;
    
    // 开启定位
    _mapView.showsUserLocation = YES;
    
    [self.view addSubview:_mapView];
    
    // 2D栅格地图定位
    _mapView.showsUserLocation = YES;   //开启定位
    
    _mapView.userTrackingMode = MAUserTrackingModeFollowWithHeading; //跟随用户的位置和角度移动
    
    [_mapView setZoomLevel:16.1 animated:YES];
    
    
    /* UISearchBar的常用方法 搜索*/
//    UISearchBar *oneSearchBar = [[UISearchBar alloc] init];
//    oneSearchBar.frame = CGRectMake(0, 0, 320, 50); // 设置位置和大小
//    oneSearchBar.keyboardType = UIKeyboardTypeEmailAddress; // 设置弹出键盘的类型
//    oneSearchBar.barStyle = UIBarStyleBlackTranslucent; // 设置UISearchBar的样式
//    oneSearchBar.tintColor = [UIColor whiteColor]; // 设置光标颜色
//    oneSearchBar.placeholder = @"停车场"; // 设置提示文字
//    oneSearchBar.delegate = self; // 设置代理
//    oneSearchBar.keyboardType = UIBarStyleDefault;
    //oneSearchBar.showsCancelButton = YES; // 设置时候显示关闭按钮
    // oneSearchBar.showsScopeBar = YES; // 设置显示范围框
    // oneSearchBar.showsSearchResultsButton = YES; // 设置显示搜索结果
    // oneSearchBar.showsBookmarkButton = YES; // 设置显示书签按钮
    //oneSearchBar.backgroundColor = [UIColor whiteColor];

//    [self.view addSubview:oneSearchBar]; // 添加到View上

    
    /* 增加定位按钮 http://blog.csdn.net/cheneystudy/article/details/8115092*/
    //增加圆形按钮
    UIButton *locationButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    locationButton.frame = CGRectMake(10, 400, 30, 30);
    locationButton.backgroundColor = [UIColor blueColor];
    [self.view addSubview:locationButton];

}

#pragma mark - 搜索
-(void)initSeatch
{
    
    //搜索按钮
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    rightBtn.frame = CGRectMake(300, 10, 25, 25);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"搜索图标"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightSearch) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;//加载到右上角
}


////实现POI搜索对应的回调函数
//- (void)onPlaceSearchDone:(AMapPlaceSearchRequest *)request response:(AMapPlaceSearchResponse *)response
//{
//    if(response.pois.count == 0)
//    {
//        return;
//    }
//    
//    //通过AMapPlaceSearchResponse对象处理搜索结果
//    NSString *strCount = [NSString stringWithFormat:@"count: %ld",(long)response.count];
//    NSString *strSuggestion = [NSString stringWithFormat:@"Suggestion: %@", response.suggestion];
//    NSString *strPoi = @"";
//    for (AMapPOI *p in response.pois) {
//        strPoi = [NSString stringWithFormat:@"%@\nPOI: %@", strPoi, p.description];
//    }
//    NSString *result = [NSString stringWithFormat:@"%@ \n %@ \n %@", strCount, strSuggestion, strPoi];
//    NSLog(@"Place: %@", result);
//}




#pragma - 定位回调函数
#pragma - 获取当前位置坐标
- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
//    if (updatingLocation) {
//        //取出当前位置的坐标
//        //NSLog(@"纬度 : %f,经度: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
//        
//    }
    if (updatingLocation) {
        CLLocation *newLocation = userLocation.location;
        //判断时间
        NSTimeInterval locationAge = -[newLocation.timestamp timeIntervalSinceNow];
        
        if (locationAge > 0.5) {
            return;
        }
        //判断水平精度是否有效
        if (newLocation.horizontalAccuracy < 0) {
            return;
        }
        
//        //根据业务需求，进行水平精度判断，获取所需位置信息（100）可改为业务所需值
//        if (newLocation.horizontalAccuracy < 100) {
//            //获取定位位置的经度
//            CLLocationCoordinate2D myCoordinate = [newLocation coordinate];
//            //纬度
//            CGFloat latitude = myCoordinate.latitude;
//            //经度
//            CGFloat longitude = myCoordinate.longitude;
//        }
    }
    
}

#pragma - 定义标注样式

-(MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
        MAAnnotationView *annotationView = (MAAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation
                                                          reuseIdentifier:reuseIndetifier];
        }
        annotationView.image = [UIImage imageNamed:@"restaurant"];
        //设置中⼼心点偏移，使得标注底部中间点成为经纬度对应点
        annotationView.centerOffset = CGPointMake(0, -18);
        return annotationView;
    }
    return nil;
}

#pragma mark - 搜索按钮
-(void)rightSearch{
    SearchViewController *searchbvc = [[SearchViewController alloc]init];
    UINavigationController *nag = [[UINavigationController alloc]initWithRootViewController:searchbvc];
    if(passCode.length>0){
        
        searchbvc.passCode = passCode;
    }else{
        passCode = @"0377";
        searchbvc.passCode = passCode;
    }
    NSLog(@"地点选择+++++++++%@",passCode);
    searchbvc.passCode = passCode;
    
    [self.navigationController presentViewController:nag animated:NO completion:nil];
}


@end
