//
//  ViewController.m
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/3.
//  Copyright © 2016年 George. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "UIView+Toast.h"
#import "UIButton+ZZZExpandResponseArea.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"扩大按钮响应范围"];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    //下面添加其他UI控件
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(60, 160, 160, 120)];
    view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 80, 40)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"修改响应" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
    // 将button响应区间改变：
    button.expandEdgeInsets = UIEdgeInsetsMake(20, 40, 0, 0);
//    button.expandEdgeInsets = UIEdgeInsetsMake(-40, -40, -40, -40);
    
}

- (void)buttonClicked {
    [self.view makeToast:@"按钮的点击事件响应到了！"];
}

@end
