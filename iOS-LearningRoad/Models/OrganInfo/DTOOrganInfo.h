//
//  DTOOrganInfo.h
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/22.
//  Copyright © 2016年 George. All rights reserved.
//

#import "FDBaseModel.h"

@interface DTOOrganInfo : FDBaseModel

//请求参数
@property (copy, nonatomic) NSString<Optional> *wsCodeReq;     //接口编号
@property (copy, nonatomic) NSString<Optional> *organId;       //机关主键

//相应参数
//@property (copy, nonatomic) NSString<Optional> *organId;      //机关主键
@property (copy, nonatomic) NSString<Optional> *organName;      //机关名称
@property (copy, nonatomic) NSString<Optional> *rank;           //机关级别
@property (copy, nonatomic) NSString<Optional> *valid;          //有效性
@property (copy, nonatomic) NSString<Optional> *gbCode;         //国标码
@property (copy, nonatomic) NSString<Optional> *displayOrder;   //排序号
@property (copy, nonatomic) NSString<Optional> *parentOrganId;  //父机关


@property (copy, nonatomic) NSString<Optional> *strIsSelected;
@end
