//
//  UIButton+ZZZExpandResponseArea.h
//  iOS-LearningRoad
//
//  Created by GaKi on 2017/10/19.
//  Copyright © 2017年 Freedom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ZZZExpandResponseArea)

/**
 在button的上、左、下、右分别扩张多少
 UIEdgeInsets的每一项，正值表示在对应方向缩窄，负值表示在对应方向扩张
 */
@property(nonatomic, assign) UIEdgeInsets expandEdgeInsets;

@end
