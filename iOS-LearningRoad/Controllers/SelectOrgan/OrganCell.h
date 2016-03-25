//
//  OrganCell.h
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/22.
//  Copyright © 2016年 George. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DTOOrganInfo;
@class OrganCell;

@protocol OrganCellDelegate <NSObject>

@optional

- (void)organCell:(OrganCell *)cell DidSelectedOrgan:(DTOOrganInfo *)organ;

@end

@interface OrganCell : UITableViewCell

@property (weak, nonatomic) id<OrganCellDelegate> delegate;

//包装一个数据模型对象，对外开放
@property (strong, nonatomic) DTOOrganInfo *organInfo;

//添加一个能直接获取cell的工厂方法
+ (instancetype)CellWithTableView:(UITableView *)tableView;

@end
