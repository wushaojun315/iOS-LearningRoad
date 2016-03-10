//
//  NotificationUsage.m
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/9.
//  Copyright © 2016年 George. All rights reserved.
//

#import "NotificationUsage.h"
#import "LoginViewController.h"

@interface NotificationUsage ()

@property (weak, nonatomic) IBOutlet UILabel *labUserInfo;


- (IBAction)goLoginPage:(UIButton *)sender;

@end

@implementation NotificationUsage

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

//接收到通知后，更新用户信息
//因为需要用户信息，所以将用户信息存放在notification中的userInfo中传到方法
- (void)updateUserInfo:(NSNotification *)notification
{
    [self.navigationController popViewControllerAnimated:YES];
    
    NSString *userName = notification.userInfo[@"name"];
    NSString *passWord = notification.userInfo[@"password"];
    
    _labUserInfo.text = [NSString stringWithFormat:@"Hello,%@!您的密码为：%@",userName,passWord];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)goLoginPage:(UIButton *)sender
{
    //要去登录就添加一个监听器
    //本viewController想要接收到“登录状态改变”的通知，就需要先注册一个监听器来接收通知
    //addObserver:本viewController（self）是通知的接收者      接收到通知后回调updateUserInfo方法
    //name参数为通知的名称        object为通知的发布者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUserInfo:) name:@"LoginStatusChanged" object:nil];
    
    LoginViewController *loginController = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:loginController animated:YES];
}

//移除监听
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
