//
//  ViewController.m
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/3.
//  Copyright © 2016年 George. All rights reserved.
//

#import "ViewController.h"
#import "KVOUsage.h"
#import "NotificationUsage.h"

@interface ViewController ()

- (IBAction)goKVOTest:(UIButton *)sender;
- (IBAction)goNotificationTest:(UIButton *)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"主界面"];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    //下面添加其他UI控件
    UIButton *btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnOne setTitle:@"点击" forState:UIControlStateNormal];
    [btnOne setBackgroundColor:[UIColor blueColor]];
    [btnOne setCenter:self.view.center];
    [btnOne setBounds:CGRectMake(0, 0, 100, 50)];
    [btnOne addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnOne];
}

//按钮点击事件测试
- (void)test
{
    [self.view makeToast:@"按钮点击测试"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)goKVOTest:(UIButton *)sender
{
    KVOUsage *KVOController = [[KVOUsage alloc] init];
    [self.navigationController pushViewController:KVOController animated:YES];
}

- (IBAction)goNotificationTest:(UIButton *)sender
{
    NotificationUsage *notificationController = [[NotificationUsage alloc] init];
    [self.navigationController pushViewController:notificationController animated:YES];
}
@end
