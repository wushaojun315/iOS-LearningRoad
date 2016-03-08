//
//  ViewController.m
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/3.
//  Copyright © 2016年 George. All rights reserved.
//

#import "ViewController.h"
#import "CustomProtocolViewController.h"

@interface ViewController ()

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
    [btnOne setBounds:CGRectMake(0, 0, 100, 50)];
    CGPoint center = btnOne.center;
    center.x = self.view.center.x;
    center.y = 100;
    btnOne.center = center;
    [btnOne addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnOne];
}

//按钮点击事件测试
- (void)test
{
    [self.view makeToast:@"按钮点击测试"];
    _btnButton.layer.cornerRadius = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)click:(UIButton *)sender
{
    _btnButton.layer.cornerRadius = 15;
//    _btnGetOut.clipsToBounds = YES;
    
    //4，设置委托方的委托对象为代理方，即给delegate属性赋值
    CustomProtocolViewController *viewController = [[CustomProtocolViewController alloc] init];
    viewController.delegate = self;
    [self.navigationController pushViewController:viewController animated:YES];
}

//5,实现委托方的协议方法
- (void)customProrocolViewController:(CustomProtocolViewController *)viewController didBackWithContent:(NSString *)content
{
    //关闭展示的视图，跳回本视图
    [self.navigationController popViewControllerAnimated:YES];
    //展示文本框内容
    _labHint.text = content;
}
@end
