//
//  FirstViewController.h
//  RRTC
//
//  Created by 鹿永超 on 15/7/16.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <MAMapKit/MAMapKit.h>
//#import <AMapSearchKit/AMapSearchAPI.h>
#import "NavigationViewController.h"

@interface FirstViewController : UIViewController<UISearchBarDelegate,UISearchDisplayDelegate>
{
    MAMapView *_mapView;
    //AMapSearchAPI *_search;
}

@property (nonatomic, retain) NSString *passCode;
@end
