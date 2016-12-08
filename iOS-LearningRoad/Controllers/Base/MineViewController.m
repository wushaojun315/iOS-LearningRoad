//
//  MineViewController.m
//  iOS-LearningRoad
//
//  Created by 吴少军 on 2016/12/5.
//  Copyright © 2016年 George. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的";
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 50, 54)];
//    testButton.center = self.view.center;
    testButton.backgroundColor = [UIColor redColor];
    [testButton setTitle:@"测试按钮" forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(testButtonFounction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton];
    
    
}

- (void)testButtonFounction:(UIButton *)button {
    NSLog(@"Mine");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
