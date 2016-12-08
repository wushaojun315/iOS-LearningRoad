//
//  SideContainerViewController.m
//  iOS-LearningRoad
//
//  Created by 吴少军 on 2016/11/30.
//  Copyright © 2016年 George. All rights reserved.
//

#import "SideContainerViewController.h"

#ifndef SideMenu_Macro
#define SideMenu_Macro

#define SMScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define SMScreenHeight ([UIScreen mainScreen].bounds.size.height)

#endif

@interface SideContainerViewController ()

@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;

@property (nonatomic, weak) UIView *blackCover;
@property (nonatomic, weak) UIView *mainView;
// 最终停下时，mainView的x值
@property (nonatomic, assign) CGFloat endedDistance;
// 是否需要设置左右按钮点击弹出左右菜单的功能

@property (nonatomic, assign) BOOL isLeftEnable;
@property (nonatomic, assign) BOOL isRightEnable;

@end

@implementation SideContainerViewController

- (instancetype)initWithTabBarController:(UITabBarController *)tabBarController leftMenu:(UIViewController *)leftMenuController rightMenu:(UIViewController *)rightMenuController leftButtonClickAble:(BOOL)leftIsEnable rightButtonClickAble:(BOOL)rightIsEnable
{
    self = [super init];
    if (self) {
        _tabController = tabBarController;
        _naviController = tabBarController.selectedViewController;
        if (_naviController && _naviController.viewControllers && _naviController.viewControllers.count) {
            _homeViewController = _naviController.viewControllers[0];
        }
        _leftViewController = leftMenuController;
        _rightViewController = rightMenuController;
        _isLeftEnable = leftIsEnable;
        _isRightEnable = rightIsEnable;
    }
    return self;
}

- (instancetype)initWithNaviController:(UINavigationController *)naviController leftMenu:(UIViewController *)leftMenuController rightMenu:(UIViewController *)rightMenuController leftButtonClickAble:(BOOL)leftIsEnable rightButtonClickAble:(BOOL)rightIsEnable
{
    self = [super init];
    if (self) {
        _naviController = naviController;
        if (naviController && naviController.viewControllers && naviController.viewControllers.count) {
            _homeViewController = naviController.viewControllers[0];
        }
        _leftViewController = leftMenuController;
        _rightViewController = rightMenuController;
        _isLeftEnable = leftIsEnable;
        _isRightEnable = rightIsEnable;
    }
    return self;
}

- (instancetype)initWithHomeViewController:(UIViewController *)homeController leftMenu:(UIViewController *)leftMenuController rightMenu:(UIViewController *)rightMenuControler leftButtonClickAble:(BOOL)leftIsEnable rightButtonClickAble:(BOOL)rightIsEnable
{
    self = [super init];
    if (self) {
        _homeViewController = homeController;
        _leftViewController = leftMenuController;
        _rightViewController = rightMenuControler;
        _isLeftEnable = leftIsEnable;
        _isRightEnable = rightIsEnable;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 背景图片，占整个屏幕
    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    backImageView.image = [UIImage imageNamed:@"background.png"];
    [self.view addSubview:backImageView];
    
    // 然后添加左侧菜单的view到视图中，左侧视图的宽度只有3/4
    if (_leftViewController) {
        _leftViewController.view.frame = CGRectMake(0, 0, 0.75 * SMScreenWidth, SMScreenHeight);
        [self.view addSubview:_leftViewController.view];
    }
    // 同理右侧菜单
    if (_rightViewController) {
        _rightViewController.view.frame = CGRectMake(SMScreenWidth, 0, 0.75 * SMScreenWidth, SMScreenHeight);
        [self.view addSubview:_rightViewController.view];
    }
    
    // 在菜单层上增加黑色遮罩层，目的是实现视差特效
    UIView *blackCover = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    blackCover.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blackCover];
    _blackCover = blackCover;
    
    // 初始化主视图，包含tabbar、navigationBar和首页页面的总视图
    UIView *mainView = [[UIView alloc] initWithFrame:self.view.frame];
    // 针对三种初始化方法，设置对应的mainView的内容
    if (_tabController) {
        if (_naviController) {
            // 需要使用一遍，否则后面用到相关属性时，获取的是空（添加导航栏左右按钮点击事件）
            _naviController.view;
        }
        if (_homeViewController) {
            _homeViewController.view;
        }
        [mainView addSubview:_tabController.view];
    } else if (_naviController) {
        if (_homeViewController) {
            _homeViewController.view;
        }
        [mainView addSubview:_naviController.view];
    } else {
        [mainView addSubview:_homeViewController.view];
    }
    
    [self.view addSubview:mainView];
    
    // 在有左右菜单的时候才会添加手势
    if (_leftViewController || _rightViewController) {
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [mainView addGestureRecognizer:panGesture];
        // 给首页 加入 点击自动关闭侧滑菜单功能
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showHome)];
        _tapGesture = tapGesture;
    }
    _mainView = mainView;
    
    // 如果有要给添加按钮点击展开左右菜单的话，需要填方方法响应
    if (_naviController && _homeViewController) {
        if (_isLeftEnable && _leftViewController && _homeViewController.navigationItem.leftBarButtonItem) {
            _homeViewController.navigationItem.leftBarButtonItem.action = @selector(showLeft);
        }
        if (_isRightEnable && _rightViewController && _homeViewController.navigationItem.rightBarButtonItem) {
            _homeViewController.navigationItem.rightBarButtonItem.action = @selector(showRight);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)pan:(UIPanGestureRecognizer *)recognizer {
    
    // 手势滑动的距离,左到右方向的滑动为正，右到左方向的滑动为负
    CGFloat x = [recognizer translationInView:self.view].x;
    
    // 当前主页面mainView的x值
    CGFloat trueDistance = _endedDistance + x;
    // 限制左右滑动的最大距离
    if (trueDistance > 0.75 * SMScreenWidth || trueDistance < -0.75 * SMScreenWidth) {
        
        return;
    }
    // 移动时变化blackCover的透明度
    _blackCover.alpha = 1 - fabs(trueDistance) / (0.75 * SMScreenWidth);
    // 移动mainView
    _mainView.center = CGPointMake(self.view.center.x + trueDistance, self.view.center.y);
    // 跟着同时移动右侧界面，设计时，右侧界面是直接放在self.view的外侧，并未被mainView覆盖,而是与mainView保持左右并排显示，但是左侧界面是的位置是被mainView覆盖的，所以右侧移动mainView就自然能显示出左侧界面
    if (_rightViewController) {
        _rightViewController.view.center = CGPointMake(_mainView.center.x + 0.875 * SMScreenWidth, 0.5 * SMScreenHeight);
    }
    
    // 结束之后，开始根据当前位置，确实能够要怎样显示
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        if (trueDistance > 0.5 * SMScreenWidth) {
            [self showLeft];
        } else if (trueDistance < - 0.5 * SMScreenWidth) {
            [self showRight];
        } else {
            [self showHome];
        }
    }
}

- (void)showLeft {
    if (_leftViewController) {
        
        [_mainView addGestureRecognizer:_tapGesture];
        _endedDistance = 0.75 * [UIScreen mainScreen].bounds.size.width;
        [self animateRelatedViews];
    }
}

- (void)showRight {
    if (_rightViewController) {
        
        [_mainView addGestureRecognizer:_tapGesture];
        _endedDistance = -0.75 * [UIScreen mainScreen].bounds.size.width;
        [self animateRelatedViews];
    }
}

- (void)showHome {
    if (_homeViewController) {
        
        if ([_mainView.gestureRecognizers containsObject:_tapGesture]) {
            [_mainView removeGestureRecognizer:_tapGesture];
        }
        _endedDistance = 0;
        [self animateRelatedViews];
    }
}

// 最终位置的动画
- (void)animateRelatedViews {
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        // 最终位置时候
        // 1，blackCover的透明度,endedDistance不为零的时候（也就是不是显示主页面的时候）就全透明
        _blackCover.alpha = _endedDistance ? 0 : 1;
        // 2，mainView的最终位置，根据endedDistance确认其中心点坐标
        _mainView.center = CGPointMake(self.view.center.x + _endedDistance, self.view.center.y);
        // 3,确保右侧菜单也随着动
        _rightViewController.view.center = CGPointMake(_mainView.center.x + 0.875 * SMScreenWidth, 0.5 * SMScreenHeight);
    } completion:nil];
}

@end
