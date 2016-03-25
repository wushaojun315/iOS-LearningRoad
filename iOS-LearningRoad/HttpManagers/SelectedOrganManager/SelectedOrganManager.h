//
//  SelectedOrganManager.h
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/22.
//  Copyright © 2016年 George. All rights reserved.
//

#import "FDBaseManager.h"

@class DTOOrganInfo;

@interface SelectedOrganManager : FDBaseManager

//进入机关选择页面，获取所有机关信息
- (void)getAllOrganInfo:(DTOOrganInfo *)requestModelParm callback:(void (^)(id data, NSError *error))callback;

//获取子机关信息
- (void)getChildOrgans:(DTOOrganInfo *)requestModelParm callback:(void (^)(id data, NSError *error))callback;

@end
