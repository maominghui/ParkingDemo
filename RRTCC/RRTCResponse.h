//
//  RRTCResponse.h
//  RRTCC
//
//  Created by 鹿永超 on 15/8/3.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#define RET_SUCCESSED 0 //请求成功
#define RET_FAILD -1 // 失败，一般为程序内部错误，而非网络错误
#define RET_TIME_OUT 1 // 连接超时
#define RET_HTTP_ERROR 2 // http请求错误
#define RET_DATA_FORMAT_ERROR 3 // 服务器返回数据格式错误
#define RET_PARSE_JSON_ERROR 4 // json解析错误
#define RET_URI_INVALID 5 // 上传图片uri无效



#define RET_TOKEN_INVALIDATION  1005 //保存token失效
#define RET_COLLECTED_NO        1010 //未收藏
#define RET_COLLECTED_YES       1011 //试题已收藏
#define RET_COLLECT_FAIL        1012 //试题收藏失败
#define RET_COLLECT_CANCEL_FAIL 1013 //试题取消收藏失败



@interface RRTCResponse : NSObject

@property (assign, nonatomic) NSInteger ret;
@property (copy, nonatomic) NSString *msg;

- (BOOL)fromDic:(NSDictionary *)dic;

@end
