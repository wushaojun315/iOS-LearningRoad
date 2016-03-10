//
//  LoginViewController.m
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/10.
//  Copyright © 2016年 George. All rights reserved.
//

#import "LoginViewController.h"
#import "UIView+Toast.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtFUserName;
@property (weak, nonatomic) IBOutlet UITextField *txtFPassWord;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnCancel;


- (IBAction)login:(UIButton *)sender;
- (IBAction)cancel:(UIButton *)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _btnLogin.layer.cornerRadius = 5;
    _btnLogin.clipsToBounds = YES;
    _btnCancel.layer.cornerRadius = 5;
    _btnCancel.clipsToBounds = YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)login:(UIButton *)sender
{
    [self.view makeToast:@"点击登录"];
    if ((_txtFUserName.text.length != 0) && (_txtFPassWord.text.length != 0))
    {
        [self.view endEditing:YES];
        
        //登录成功时发送通知，将信息保存在userInfo字典中
        NSDictionary *userInfo = @{@"name":_txtFUserName.text,@"password":_txtFPassWord.text};
        //通知发布者为self
        [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginStatusChanged" object:self userInfo:userInfo];
        //pop当前视图控制器
        
    }
    else
    {
        //弹出提示消息
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"系统提示" message:@"用户名或密码不能为空，登录失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
}

- (IBAction)cancel:(UIButton *)sender
{
    [self.view makeToast:@"点击取消"];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
