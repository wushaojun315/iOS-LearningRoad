//
//  UIButton+ZZZAdjustImagePosition.h
//  iOS-LearningRoad
//
//  Created by GaKi on 2017/10/25.
//  Copyright © 2017年 Freedom. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ZZZButtonImagePosition) {
    ZZZButtonImagePositionLeft,     // 设置Button图片居左，文字居右（UIButton默认就是如此）
    ZZZButtonImagePositionRight,    // 设置Button图片居右，文字居左
    ZZZButtonImagePositionUp,       // 设置Button图片居上，文字居下
    ZZZButtonImagePositionDown      // 设置Button图片居下，文字居上
};

@interface UIButton (ZZZAdjustImagePosition)

/**
 修改Button中图片与文字的相对位置。
 使用此方法前，要求先设置好图片、文字以及字体大小

 @param position 枚举值，表示图片和文字需要设置成怎样的相对位置
 @param middleSpace 图片与文字之间的间距
 */
- (void)changeImagePosition:(ZZZButtonImagePosition)position
                middleSpace:(CGFloat)middleSpace;

@end
