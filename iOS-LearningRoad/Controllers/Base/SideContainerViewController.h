//
//  SideContainerViewController.h
//  iOS-LearningRoad
//
//  Created by 吴少军 on 2016/11/30.
//  Copyright © 2016年 George. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideContainerViewController : UIViewController

@property (nonatomic, strong, readonly) UITabBarController *tabController;
@property (nonatomic, strong, readonly) UINavigationController *naviController;
@property (nonatomic, strong, readonly) UIViewController *homeViewController;
@property (nonatomic, strong, readonly) UIViewController *leftViewController;
@property (nonatomic, strong, readonly) UIViewController *rightViewController;

/**
 初始化方法，此方法用在整个结构是TabBarController + navigationController的情况

 @param tabBarController    整体结构中的tabBarController，以此会设置当前的naviController和homeViewController
 @param leftMenuController  左侧菜单的控制器（此控制器中可以弱引用containerController，用于跳转页面），同时此页面的frame需要设置为(0, 0, 0.75 * [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
 @param rightMenuController 右侧菜单控制器，要求同左侧菜单
 @param leftIsEnable        是否需要给左侧导航栏按钮添加展开左侧菜单的功能（需要确保homeController有左右导航栏菜单）
 @param rightIsEnable       同上

 @return 返回包含有tabBarController内部内容，和左右菜单的SideContainerViewController控制器
 */
- (instancetype)initWithTabBarController:(UITabBarController *)tabBarController
                                leftMenu:(UIViewController *)leftMenuController
                               rightMenu:(UIViewController *)rightMenuController
                     leftButtonClickAble:(BOOL)leftIsEnable
                    rightButtonClickAble:(BOOL)rightIsEnable;

/**
 初始化方法，此方法用在整个结构只是一个navigationController的情况，此方法初始化后，默认tabBarController为空

 @param naviController      根部的navigationController，可以获取到进行页面跳转，homeViewController通过此naviController获取
 @param leftMenuController  左侧菜单的控制器（此控制器中可以弱引用containerController，用于跳转页面），同时此页面的frame需要设置为(0, 0, 0.75 * [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
 @param rightMenuController 右侧菜单控制器，要求同左侧菜单
 @param leftIsEnable        是否需要给左侧导航栏按钮添加展开左侧菜单的功能（需要确保homeController有左右导航栏菜单）
 @param rightIsEnable       同上
 
 @return 返回包含有navigationController内部内容，和左右菜单的SideContainerViewController控制器
 */
- (instancetype)initWithNaviController:(UINavigationController *)naviController
                              leftMenu:(UIViewController *)leftMenuController
                             rightMenu:(UIViewController *)rightMenuController
                   leftButtonClickAble:(BOOL)leftIsEnable
                  rightButtonClickAble:(BOOL)rightIsEnable;;

/**
 初始化方法，当需要初始化一个没有tabBar和navigationBar的左右侧滑菜单时，可以用此方法初始化，默认初始化后tabController和naviController为空

 @param homeController     主页展示的内容
 @param leftMenuController 左侧菜单的控制器（此控制器中可以弱引用containerController，用于跳转页面），同时此页面的frame需要设置为(0, 0, 0.75 * [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
 @param rightMenuController 右侧菜单控制器，要求同左侧菜单
 @param leftIsEnable        是否需要给左侧导航栏按钮添加展开左侧菜单的功能（需要确保homeController有左右导航栏菜单）
 @param rightIsEnable       同上
 
 @return 返回包含有navigationController内部内容，和左右菜单的SideContainerViewController控制器
 */
- (instancetype)initWithHomeViewController:(UIViewController *)homeController
                                  leftMenu:(UIViewController *)leftMenuController
                                 rightMenu:(UIViewController *)rightMenuControler
                       leftButtonClickAble:(BOOL)leftIsEnable
                      rightButtonClickAble:(BOOL)rightIsEnable;

// 可以主动调用，一般用在左右菜单视图中，进行点击，跳转页面后，要显示回主界面的情况
- (void)showHome;

/**
 展开左侧菜单的方法，一般不会主动调用，除非手动为navigationBar上的按钮添加打开菜单的事件
 */
- (void)showLeft;

/**
 展开右侧菜单的方法，一般不会主动调用，除非手动为navigationBar上的按钮添加打开菜单的事件
 */
- (void)showRight;

@end
