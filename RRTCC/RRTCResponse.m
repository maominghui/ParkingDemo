//
//  RRTCResponse.m
//  RRTCC
//
//  Created by 鹿永超 on 15/8/3.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import "RRTCResponse.h"



@implementation RRTCResponse

- (BOOL)fromDic:(NSDictionary *)dic
{
    if(dic == nil || ![dic isKindOfClass:[NSDictionary class]])
    {
        self.ret = RET_DATA_FORMAT_ERROR;//服务器返回数据格式错误
    }
    else
    {
        id temp = dic[@"ret"];
        if(temp == nil || [temp isKindOfClass:[NSNull class]])
            self.ret = RET_DATA_FORMAT_ERROR;
        else
            self.ret = [temp integerValue];
        self.msg = dic[@"msg"];
    }
    
    return self.ret == 0 ? YES : NO;
}

- (NSString *)msg
{
    if(_ret > 1000)
        return _msg;
    if(_ret == RET_DATA_FORMAT_ERROR || _ret == RET_PARSE_JSON_ERROR)
        return @"服务器返回数据格式错误";
    
    if(_ret == RET_TIME_OUT)
        return @"连接超时，请检查网络后重试";
    
    if(_ret < 1000 && _ret > 0)
        return [NSString stringWithFormat:@"请求出错，请重试！code:%ld", (long)_ret];
    
    return @"请求成功";
}

@end