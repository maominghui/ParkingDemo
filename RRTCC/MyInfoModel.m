//
//  MyInfoModel.m
//  RRTCC
//
//  Created by 鹿永超 on 15/7/29.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "MyInfoModel.h"

@implementation MyInfoModel

/**
 
 初始化完成订单模型对象
 @param ID          订单编号
 @param time        日期
 @param location    地点
 @param finish      是否完成
 
 */
-(id)initWithcarID:(NSInteger)ID
           carTime:(NSString *)time
       carLocation:(NSString *)location
            finish:(NSString *)finish;
{
    
    if(self = [super init])
    {
        self.carID          = ID;
        self.carTime        = time;
        self.carLocation    = location;
        self.carFinish      = finish;
    }
    return self;
}
@end
