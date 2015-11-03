//
//  RechargeVC.h
//  RRTCC
//
//  Created by 鹿永超 on 15/7/28.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RechargeVC : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@property (weak, nonatomic) IBOutlet UILabel *money;

@end
