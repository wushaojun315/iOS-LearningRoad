//
//  RightViewController.m
//  iOS-LearningRoad
//
//  Created by 吴少军 on 2016/12/2.
//  Copyright © 2016年 George. All rights reserved.
//

#import "RightViewController.h"
#import "SideContainerViewController.h"
#import "InnerRightViewController.h"

@interface RightViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation RightViewController

- (UITableView *)tableView {
    if (_tableView == nil) {
        UITableView *tempTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [self.view addSubview:tempTable];
        tempTable.delegate = self;
        tempTable.dataSource = self;
        
        UIView *xxView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
        xxView.backgroundColor = [UIColor redColor];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 80)];
        label.center = xxView.center;
        label.text = @"Header/Footer";
        [xxView addSubview:label];
        tempTable.tableHeaderView = xxView;
        tempTable.tableFooterView = xxView;// [xxView copy];
        
        _tableView = tempTable;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //单元格标识
    static NSString *cellIdentifier = @"MyCell";
    //使用标识初始化cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //如果用标识找不到cell的话，新建cell
    if (cell == nil) {
        //初始化cell，并使用标识
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Right==%ld", indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    InnerRightViewController *innerRight = [[InnerRightViewController alloc] init];
    [self.containerViewController.homeViewController showViewController:innerRight sender:nil];
    [self.containerViewController showHome];
}

@end
