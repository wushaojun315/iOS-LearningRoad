//
//  NotificationUsage.h
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/9.
//  Copyright © 2016年 George. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationUsage : UIViewController

/**
 *  通知机制
 要想发布通知，首先要创建一个通知对象，通知是实用NSNotification类表示的，它就是一个通知内容的载体，有如下三个属性
 @property (readonly, copy) NSString *name;           //通知的名称，只读
 @property (readonly, retain) id object;              //通知的发布者，也就是谁要发布通知
 @property (readonly, copy) NSDictionary *userInfo;   //通知发布者传递给通知接收者的额外信息内容
 
 此外，NSNotification类还提供了一些初始化通知对象的方法，这些方法如下：
 + (instancetype)notificationWithName:(NSString *)aName object:(id)anObject;
 + (instancetype)notificationWithName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo;
 - (instancetype)initWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo;
 
 完成通知对象的初始化之后 ，就需要实现通知机制，通知机制的实现分为3部分：
 
 1，通知发布者
 通知发布者主要负责发布通知到通知中心，通知中心有方法，协助发布通知：
 //参数为通知对象，可以用该对象设置通知的名称，通知的发布者，额外信息等
 - (void)postNotification:(NSNotification *)notification;
 //参数为aName表示通知的名称，anObject表示通知的发布者
 - (void)postNotificationName:(NSString *)aName object:(id)anObject;
 //userInfo参数用于设置通知的额外信息
 - (void)postNotificationName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo;
 
 2，通知中心
 通知中心使用NSNotificationCenter类表示，主要负责接收通知发布者的通知并转发给通知接收者
 //获取一个通知中心对象，通知中心对象是一个单例模式, 它允许注册观察者，发送通知，撤销注册
 + (NSNotificarionCenter *)defaultCenter;
 
 3，通知接收者
 通知接收者主要负责接收从通知中心发布的通知。要想实现通知的接收，必须要注册一个通知监听器，NSNotificationCenter类提供了方法来注册监听器：
 //observer参数为通知的接收者，aSelector参数为受到通知后回调的方法，aName参数表示通知的名称，anObject参数表示通知的发布者
 - (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject;
 //name参数表示通知的名称，obj参数表示通知的发布者，block参数表示接收到通知后回调该block，queue参数决定block在哪个操作队列中执行，若设置为nil，则表示默认在当前队列中同步执行
 - (id<NSObject>)addObjectForName:(NSString *)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void(^)(NDNotification *note))block;
 NSNotificationCenter类还提供了注销监听器的方法：
 - (void)removeObserver:(id)observer;
 - (void)removeObserver:(id)observer name:(NSString *)aName object:(id)anObject;
 两个方法均为注销监听器的方法，一般会在通知的接收者销毁之前取消注册，因此常在dealloc方法中调用。
 
 */

@end
