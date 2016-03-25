//
//  SelectOrganController.h
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/21.
//  Copyright © 2016年 George. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DTOOrganInfo;
@class SelectOrganController;

@protocol SelectOrganControllerDelegate <NSObject>

@optional
- (void)selectOrganController:(SelectOrganController *)selectOrgController didClickSure:(DTOOrganInfo *)organ;

@end

@interface SelectOrganController : UIViewController

@property (weak, nonatomic) id<SelectOrganControllerDelegate> delegate;

@property (copy, nonatomic) NSMutableArray *arrOrgans;

@property (strong, nonatomic) DTOOrganInfo *reqOrganInfo;

@end
