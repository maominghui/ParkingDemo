//
//  NSNull+ReturnValue.m
//  iGaoKao
//
//  Created by nyist-mac1 on 15/3/31.
//  Copyright (c) 2015年 wangxi. All rights reserved.
//

#import "NSNull+ReturnValue.h"
@implementation NSNull (ReturnValues)

- (NSInteger)integerValue
{
    return 0;
}

- (double)doubleValue
{
    return 0;
}

- (NSString *)stringValue
{
    return @"";
}

- (float)floatValue
{
    return 0;
}

@end

