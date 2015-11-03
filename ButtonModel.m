//
//  ButtonModel.m
//  白送街
//
//  Created by xujingjing on 15/4/16.
//  Copyright (c) 2015年 lihongmei. All rights reserved.
//

#import "ButtonModel.h"

@implementation ButtonModel
+(UIButton*)CreateNormBtn:(UIImage*)image andWithSEL:(SEL)sel andTarget:(id)name
{
    UIButton * Btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [Btn setBackgroundColor:[UIColor blueColor]];
    [Btn setTintColor:[UIColor whiteColor]];
    Btn.layer.cornerRadius = 5;
    [Btn setFrame:CGRectMake(100, 100, 50, 30)];
    [Btn setTitle:@"进入" forState:UIControlStateNormal];
    [Btn addTarget:name action:sel forControlEvents:UIControlEventTouchUpInside];
    [Btn setImage:image forState:UIControlStateNormal];
    return Btn;
}

+(UIButton*)CreateLeftmBtn:(UIImage*)image andWithSEL:(SEL)sel andTarget:(id)name
{
    UIButton * Btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [Btn setTintColor:[UIColor whiteColor]];
    Btn.layer.cornerRadius = 5;
    [Btn setFrame:CGRectMake(0, 0, 25, 25)];
    [Btn setTitle:@"" forState:UIControlStateNormal];
    [Btn addTarget:name action:sel forControlEvents:UIControlEventTouchUpInside];
    [Btn setImage:image forState:UIControlStateNormal];
    return Btn;
}

+(UIButton*)CreateRightBtn:(UIImage*)image andWithSEL:(SEL)sel andTarget:(id)name andTitle:(NSString *)Title
{
    UIButton * Btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [Btn setTintColor:[UIColor whiteColor]];
    Btn.layer.cornerRadius = 5;
    Btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [Btn setFrame:CGRectMake(5, 5, 45, 45)];
    [Btn setTitle:Title forState:UIControlStateNormal];
    [Btn addTarget:name action:sel forControlEvents:UIControlEventTouchUpInside];
    [Btn setImage:image forState:UIControlStateNormal];
    return Btn;
}


@end
