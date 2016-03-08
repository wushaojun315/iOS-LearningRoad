//
//  CustomProtocolViewController.m
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/8.
//  Copyright © 2016年 George. All rights reserved.
//

#import "CustomProtocolViewController.h"

@interface CustomProtocolViewController ()

@end

@implementation CustomProtocolViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)click:(UIButton *)sender
{
    //获取文本框中的内容
    NSString *text = _txtFieldContent.text;
    //若代理对象响应了代理方法，通知代理做事
    if ([self.delegate respondsToSelector:@selector(customProrocolViewController:didBackWithContent:)])
    {
        [self.delegate customProrocolViewController:self didBackWithContent:text];
    }
}
@end
