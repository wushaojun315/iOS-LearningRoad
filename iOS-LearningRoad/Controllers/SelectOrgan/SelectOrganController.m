//
//  SelectOrganController.m
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/21.
//  Copyright © 2016年 George. All rights reserved.
//

#import "SelectOrganController.h"
#import "OrganCell.h"
#import "DTOOrganInfo.h"
#import "SelectedOrganManager.h"
#import "ViewController.h"

@interface SelectOrganController ()<UITableViewDelegate,UITableViewDataSource,OrganCellDelegate,SelectOrganControllerDelegate>

@property (copy, nonatomic) NSMutableArray *arrAllOrgans;
@property (strong, nonatomic) DTOOrganInfo *selectedOrgan;

@property (weak, nonatomic) IBOutlet UITableView *tableViewOrgans;
@property (weak, nonatomic) IBOutlet UIButton *btnSure;

- (IBAction)sureSelect:(UIButton *)sender;

@end

@implementation SelectOrganController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!_reqOrganInfo) {
        //第一次初始化页面，获取所有机关信息
        self.title = @"选择机关";
        _reqOrganInfo = [[DTOOrganInfo alloc] init];
        _reqOrganInfo.wsCodeReq = @"00000006";
        
        [self requestFirstData];
    }else{
        //点击某一机关后，获取下一级子机关
        self.title = _reqOrganInfo.organName;
        
        [self getChildOrgans];
    }
    _tableViewOrgans.delegate = self;
    _tableViewOrgans.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//点击确定按钮后，将选中的selectedOrgan传过去，并调用代理方法
- (IBAction)sureSelect:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(selectOrganController:didClickSure:)]) {
        //        [self.navigationController popViewControllerAnimated:YES];
        [self.navigationController popToViewController:(ViewController *)self.delegate animated:YES];
        [self.delegate selectOrganController:self didClickSure:_selectedOrgan];
    }
}

#pragma mark SelectOrganController的代理方法
//点击了子机关的选中确定之后，调用这个代理方法
- (void)selectOrganController:(SelectOrganController *)selectOrgController didClickSure:(DTOOrganInfo *)organ{
    if ([self.delegate respondsToSelector:@selector(selectOrganController:didClickSure:)]) {
        [self.navigationController popViewControllerAnimated:YES];
        [self.delegate selectOrganController:self didClickSure:organ];
    }
}

#pragma mark  UITableView的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrOrgans.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //将获取cell操作封装到自定义cell中
    OrganCell *cell = [OrganCell CellWithTableView:tableView];
    cell.delegate = self;
    //将数据模型对象传给cell，将为cell内部空间填值的操作也封装到cell内部
    cell.organInfo= _arrOrgans[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SelectOrganController *controller = [[SelectOrganController alloc] init];
    controller.reqOrganInfo = _arrOrgans[indexPath.row];
    controller.reqOrganInfo.wsCodeReq = @"00000007";
    controller.delegate = self.delegate;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark OrganCellDelegate 的代理方法
//在点击每行前面的选择按钮后，实现代理方法，让之前选中的取消选中
- (void)organCell:(OrganCell *)cell DidSelectedOrgan:(DTOOrganInfo *)organ
{
    //记录下当前选中的机关(用于在点击确定时，传递回去)
    _selectedOrgan = organ;
    //然后让之前选中状态的机关，设置不选中，保证自由当前机关被选中
    [self selectOnlyOne];
    //重新加载表格数据，在strIsSelected属性为@“1”的表格，显示选中状态
    [_tableViewOrgans reloadData];
}

//确保永远自由一个机关是选中的状态
- (void)selectOnlyOne
{
    //对所有机关遍历，只要不是当前选中的这个organ的，都将strIsSelected设为空（当前的设为了@“1”）
    for (DTOOrganInfo *eachOrgan in _arrOrgans) {
        if (eachOrgan != _selectedOrgan) {
            eachOrgan.strIsSelected = nil;
        }
    }
}

//获取子机关
- (void)getChildOrgans
{
//    [self startLoading];
    
    //2,调用对应[XXXXManager sharedInstance]的发送请求方法，传入参数，有结果后回调
    [[SelectedOrganManager sharedInstance] getChildOrgans:_reqOrganInfo callback:^(id data, NSError *error) {
        if (data)
        {
            //3,请求成功后，回调callback(arrModels,nil)
            //返回的arrModels参数即为数据模型类型或其数组，可以赋值给本页面的数据源
            _arrOrgans = [NSMutableArray arrayWithArray:data];
            [_tableViewOrgans reloadData];
            
//            [self stopLoading];
            
        }else
        {
//            [self displayEmptyView];
        }
    }];
}

//第一次选择，获取所有机关数据
- (void)requestFirstData
{
//    [self startLoading];
    //2,调用对应[XXXXManager sharedInstance]的发送请求方法，传入参数，有结果后回调
    [[SelectedOrganManager sharedInstance] getAllOrganInfo:_reqOrganInfo callback:^(id data, NSError *error) {
        if (data){
            //3,请求成功后，回调callback(arrModels,nil)
            //获取所有机关后,获取第一层机关
            [self getFirstLayerOrgans:data];
        }else {
            //4,为空时，展示空界面
//            [self displayEmptyView];
        }
    }];
}

- (void)getFirstLayerOrgans:(NSArray *)allOrgans{
    if (!_arrOrgans) {
        _arrOrgans = [NSMutableArray array];
    }
    for (DTOOrganInfo *organ in allOrgans) {
        if ([organ.rank  isEqual: @"2"]) {
            [_arrOrgans addObject:organ];
        }
    }
    [_tableViewOrgans reloadData];
//    [self stopLoading];
}
@end
