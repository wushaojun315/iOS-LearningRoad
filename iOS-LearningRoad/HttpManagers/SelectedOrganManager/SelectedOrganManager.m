//
//  SelectedOrganManager.m
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/22.
//  Copyright © 2016年 George. All rights reserved.
//

#import "SelectedOrganManager.h"
#import "DTOOrganInfo.h"
#import "FDHttpManager.h"

@implementation SelectedOrganManager

SINGLETON

//进入机关选择页面，获取所有机关信息
- (void)getAllOrganInfo:(DTOOrganInfo *)requestModelParm callback:(void (^)(id data, NSError *error))callback
{
    //1,由传送的模型，获取请求参数的字典
    NSDictionary *dict = [requestModelParm toDictionaryWithKeys:@[@"wsCodeReq"]];
    //2,调用[FDHttpManager shareHttpManager]的post/get方法
    [[FDHttpManager shareHttpManager] GET:kNetPath_getAllOrgans parameters:dict mockFile:nil success:^(id data) {
        //3,若成功：
        //将回调时传回的参数data，转换为FDBaseResult类型对象
        FDBaseResult *resultModel = data;
        
        //由上面的FDBaseResult对象得到数据模型对应的对象，使用对应的方法
        NSArray *arrModels = [resultModel getResultArrayListByDic:[DTOOrganInfo class] strKey:@"organInfo"];
        //在得到返回数据后，可以进行一些判断，一些操作，如根据返回是否为空更改一些状态
        
        //成功之后回调callback块，传入获得的数据data1，error参数为空
        callback(arrModels, nil);
    } failure:^(NSError *error) {
        //请求失败后，也可以做一些操作，更改设置一些状态等
        
        //请求失败，回调callback块，传入error对象
        callback(nil, error);
    }];
}

//获取子机关信息
- (void)getChildOrgans:(DTOOrganInfo *)requestModelParm callback:(void (^)(id data, NSError *error))callback
{
    //1,由传送的模型，获取请求参数的字典
    NSDictionary *dict = [requestModelParm toDictionaryWithKeys:@[@"wsCodeReq",
                                                                  @"organId"]];
    //2,调用[FDHttpManager shareHttpManager]的post/get方法
    [[FDHttpManager shareHttpManager] GET:kNetPath_getChildByOrganId parameters:dict mockFile:nil success:^(id data) {
        //3,若成功：
        //将回调时传回的参数data，转换为FDBaseResult类型对象
        FDBaseResult *resultModel = data;
        
        //由上面的FDBaseResult对象得到数据模型对应的对象，使用对应的方法
        NSArray *arrModels = [resultModel getResultArrayListByDic:[DTOOrganInfo class] strKey:@"organInfo"];
        //在得到返回数据后，可以进行一些判断，一些操作，如根据返回是否为空更改一些状态
        
        //成功之后回调callback块，传入获得的数据data1，error参数为空
        callback(arrModels, nil);
    } failure:^(NSError *error) {
        //请求失败后，也可以做一些操作，更改设置一些状态等
        
        //请求失败，回调callback块，传入error对象
        callback(nil, error);
    }];
}


@end
