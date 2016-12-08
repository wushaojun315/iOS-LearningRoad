//
//  ViewController.m
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/3.
//  Copyright © 2016年 George. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "MessageViewController.h"
#import "MineViewController.h"

@interface ViewController ()

@property(strong, nonatomic) MessageViewController *meController;
@property (nonatomic, strong) MineViewController *mineContr;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"主界面"];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    NSArray *nullArr = [NSNull null];
    NSArray *nilArr = nil;
    [nullArr count];
    [nilArr count];
    
    
    //下面添加其他UI控件
    UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 54)];
    testButton.center = self.view.center;
    testButton.backgroundColor = [UIColor greenColor];
    [testButton setTitle:@"测试按钮" forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(testButtonFounction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton];
    
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    leftLabel.backgroundColor = [UIColor redColor];
    leftLabel.text = @"Left";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftLabel];
    
    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    rightLabel.backgroundColor = [UIColor redColor];
    rightLabel.text = @"Right";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:nil action:nil];
    
    UIView *vv = [[UIView alloc] initWithFrame:CGRectMake(10, 70, 100, 100)];
    MessageViewController *messController = [[MessageViewController alloc] init];
    _meController = messController;
    [self addChildViewController:messController];
    MineViewController *mineController = [[MineViewController alloc] init];
    _mineContr = mineController;
    [self addChildViewController:mineController];
    messController.view.frame = vv.bounds;
    mineController.view.frame = vv.bounds;
    [vv addSubview:messController.view];
    [self.view addSubview:vv];
}

- (void)rightClicked {
    NSLog(@"XXXX");
}

- (void)testButtonFounction:(UIButton *)button {
    NSLog(@"Clicked");
    [self transitionFromViewController:_meController toViewController:_mineContr duration:2 options:UIViewAnimationOptionLayoutSubviews animations:nil completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
