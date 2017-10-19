//
//  UIButton+ZZZExpandResponseArea.m
//  iOS-LearningRoad
//
//  Created by GaKi on 2017/10/19.
//  Copyright © 2017年 Freedom. All rights reserved.
//

#import "UIButton+ZZZExpandResponseArea.h"
#import <objc/runtime.h>

@implementation UIButton (ZZZExpandResponseArea)

- (void)setExpandEdgeInsets:(UIEdgeInsets)expandEdgeInsets {
    // 这边转换成对象了，后面使用的是retain_nonatomic原则（如果用assign原则关联inset结构体的话，会是弱引用，button本身会丢失对这个属性的持有母舅无法使用了）
    NSValue *value = [NSValue value:&expandEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    
    objc_setAssociatedObject(self, @selector(expandEdgeInsets), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)expandEdgeInsets {
    // 根据key，获取到关联的NSValue对象
    NSValue *value = objc_getAssociatedObject(self, _cmd);
    // 若有值就转换为UIEdgeInsets结构体，并返回
    if(value) {
        UIEdgeInsets edgeInsets;
        [value getValue:&edgeInsets];
        
        return edgeInsets;
    }else {
        return UIEdgeInsetsZero;
    }
}

// 在这个方法中扩大button的响应区域
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    // 不扩大、或不可点击、或隐藏时不处理
    if(UIEdgeInsetsEqualToEdgeInsets(self.expandEdgeInsets, UIEdgeInsetsZero) ||       !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    
    // 否则扩大范围
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.expandEdgeInsets);
    
    return CGRectContainsPoint(hitFrame, point);
}

@end
