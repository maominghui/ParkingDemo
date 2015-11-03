//
//  ButtonModel.h
//  白送街
//
//  Created by xujingjing on 15/4/16.
//  Copyright (c) 2015年 lihongmei. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ButtonModel : NSObject

+(UIButton*)CreateNormBtn:(UIImage*)image andWithSEL:(SEL)sel andTarget:(id)name;

+(UIButton*)CreateLeftmBtn:(UIImage*)image andWithSEL:(SEL)sel andTarget:(id)name;//返回按钮

+(UIButton*)CreateRightBtn:(UIImage*)image andWithSEL:(SEL)sel andTarget:(id)name andTitle:(NSString*)Title;

@end
