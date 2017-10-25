//
//  UIButton+ZZZAdjustImagePosition.m
//  iOS-LearningRoad
//
//  Created by GaKi on 2017/10/25.
//  Copyright © 2017年 Freedom. All rights reserved.
//

#import "UIButton+ZZZAdjustImagePosition.h"

@implementation UIButton (ZZZAdjustImagePosition)

- (void)changeImagePosition:(ZZZButtonImagePosition)position
                middleSpace:(CGFloat)middleSpace
{
    [self setTitle:self.currentTitle forState:UIControlStateNormal];
    [self setImage:self.currentImage forState:UIControlStateNormal];
    
    
    CGFloat imageWidth = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGFloat labelWidth = [self.titleLabel.text sizeWithFont:self.titleLabel.font].width;
    CGFloat labelHeight = [self.titleLabel.text sizeWithFont:self.titleLabel.font].height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + middleSpace / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + middleSpace / 2;//label中心移动的y距离
    
    CGFloat tempWidth = MAX(labelWidth, imageWidth);
    CGFloat changedWidth = labelWidth + imageWidth - tempWidth;
    CGFloat tempHeight = MAX(labelHeight, imageHeight);
    CGFloat changedHeight = labelHeight + imageHeight + middleSpace - tempHeight;
    
    switch (position) {
        case ZZZButtonImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -middleSpace/2, 0, middleSpace/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, middleSpace/2, 0, -middleSpace/2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, middleSpace/2, 0, middleSpace/2);
            break;
            
        case ZZZButtonImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + middleSpace/2, 0, -(labelWidth + middleSpace/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth + middleSpace/2), 0, imageWidth + middleSpace/2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, middleSpace/2, 0, middleSpace/2);
            break;
            
        case ZZZButtonImagePositionUp:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(imageOffsetY, -changedWidth/2, changedHeight-imageOffsetY, -changedWidth/2);
            break;
            
        case ZZZButtonImagePositionDown:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(changedHeight-imageOffsetY, -changedWidth/2, imageOffsetY, -changedWidth/2);
            break;
            
        default:
            break;
    }
}

@end
