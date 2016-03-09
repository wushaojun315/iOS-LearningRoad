//
//  KVOUsage.h
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/9.
//  Copyright © 2016年 George. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KVOUsage : UIViewController

/**
 *  KVO机制由NSkeyValueObserving协议提供支持，该协议包含如下常用方法：
 //以下方法可用于注册监听器
 */
//- (void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context;
//- (void)removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;
//- (void)removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath context:(void *)context;

/**
 *  例如，假设存在一个Bank实例，该实例包含一个int型的accountBalance属性。如果想要使用KVO机制，建立一个这个属性的观察员需要以下两个步骤：
 
 1，Bank实例必须注册一个监听器，当accountBalance属性值发生变化时，会通知监听者Person实例
 2，为了能够响应消息，Person实例（观察者）必须实现下面的方法，当属性值发生变化时，该方法会被自动的调用，用于实现如何响应变化的消息。
 */
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context;


@end
