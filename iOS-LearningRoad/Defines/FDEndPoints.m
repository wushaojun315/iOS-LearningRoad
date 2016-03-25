//
//  FDEndPoints.m
//  FDSupervise
//
//  Created by 刘伟 on 15/6/10.
//  Copyright (c) 2015年 刘伟. All rights reserved.
//

#import "FDEndPoints.h"

#ifdef __OPTIMIZE__
#define NSLog(...)
#endif

#ifndef TIM_DEBUG

NSString * const ServiceEndPoint = @"http://10.10.16.178:8080/deliver/services/ws/";
NSString * const ServicePicPath = @"http://10.1.63.120:8080/fdWebFile";

#else

NSString * const ServiceEndPoint  = @"http://10.1.8.133:8023/deliver/services/ws/";
NSString * const ServicePicPath = @"http://10.1.8.133:8023/fdWebFile";


#endif

void debug_log(NSString *msg){
    NSLog(@"======debugMsg:%@",msg);
}