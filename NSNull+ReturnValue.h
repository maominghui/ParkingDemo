//
//  NSNull+ReturnValue.h
//  iGaoKao
//
//  Created by nyist-mac1 on 15/3/31.
//  Copyright (c) 2015年 wangxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNull (ReturnValues)

- (NSInteger)integerValue;
- (double)doubleValue;
- (NSString *)stringValue;
- (float)floatValue;

@end
