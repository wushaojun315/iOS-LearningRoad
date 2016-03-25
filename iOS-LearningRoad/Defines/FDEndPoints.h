//
//  FDEndPoints.h
//  FDSupervise
//
//  Created by 刘伟 on 15/6/10.
//  Copyright (c) 2015年 刘伟. All rights reserved.
//
#define TIM_DEBUG

#ifndef FDSupervise_FDEndPoints_h
#define FDSupervise_FDEndPoints_h

extern NSString * const ServiceEndPoint;
extern NSString * const ServicePicPath;
extern void debug_log(NSString *msg);

#pragma mark Account

//登陆
#define kNetPath_Login                        @"hebgs/services/mobile/getLoginInfo"

//获取所有机关信息
#define kNetPath_getAllOrgans                 @"hebgs/services/mobile/getAllOrgan"
//获取子机关信息
#define kNetPath_getChildByOrganId            @"hebgs/services/mobile/getChildByOrganId"

#endif
