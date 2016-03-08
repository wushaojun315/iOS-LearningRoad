//
//  CustomProtocolViewController.h
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/8.
//  Copyright © 2016年 George. All rights reserved.
//



/*
 自定义委托协议的流程，大致分为5个步骤：
 1，委托方根据需求，定义一个委托协议，该协议中定义了供代理方实现的方法
 2，委托方定义一个delegate属性，该属性对代理方持有一个弱引用
 3，代理方遵守委托协议，具备成为代理方的资格
 4，设置委托方的委托对象为代理方，即给delegate属性赋值
 5，特定的时刻调用代理方法，通知代理做事情
 */





#import <UIKit/UIKit.h>

//1,委托方根据需求，定义一个委托协议，该协议中定义了供代理方实现的方法
//在CustomProtocolViewController.h中定义一个协议
@class CustomProtocolViewController;
@protocol CustomProtocolViewControllerDelegate <NSObject>
@optional
//协议内定义一个供代理实现的方法
//代理方法，表示已经获取了文本库内容
- (void)customProrocolViewController:(CustomProtocolViewController *)viewController
                  didBackWithContent:(NSString *)content;
@end



@interface CustomProtocolViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtFieldContent;
@property (weak, nonatomic) IBOutlet UIButton *btnSure;
//2,委托方定义一个delegate属性，该属性对代理方持有一个弱引用
//在CustomProtocolViewController.h文件中添加一个代理属性，该代理属性遵循CustomProtocolViewControllerDelegate协议：
//@property (assign, nonatomic) id<CustomProtocolViewControllerDelegate> delegate;
@property (weak, nonatomic) id<CustomProtocolViewControllerDelegate> delegate;

- (IBAction)click:(UIButton *)sender;
@end
