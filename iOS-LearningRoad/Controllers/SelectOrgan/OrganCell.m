//
//  OrganCell.m
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/22.
//  Copyright © 2016年 George. All rights reserved.
//

#import "OrganCell.h"
#import "DTOOrganInfo.h"

@interface OrganCell ()

@property (weak, nonatomic) IBOutlet UILabel *labOrganName;

@property (weak, nonatomic) IBOutlet UIButton *btnSelect;

- (IBAction)setOrganSelected:(UIButton *)sender;

@end

@implementation OrganCell

//通过获取数据模型数据时，用模型给cell填充内容
- (void)setOrganInfo:(DTOOrganInfo *)organInfo
{
    //为属性赋值
    _organInfo = organInfo;
    
    //使用模型属性，为cell内部填充数据
    _labOrganName.text = _organInfo.organName;
    
    if ([_organInfo.strIsSelected isEqualToString:@"1"]) {
        [_btnSelect setBackgroundImage:[UIImage imageNamed:@"organChecked.png"] forState:UIControlStateNormal];
    }else{
        [_btnSelect setBackgroundImage:[UIImage imageNamed:@"organUnchecked.png"] forState:UIControlStateNormal];
    }
}

//获取单元格的工厂方法
+ (instancetype)CellWithTableView:(UITableView *)tableView
{
    //单元格标识
    static NSString *cellIdentifier = @"MyOrganCell";
    //使用标识初始化cell
    OrganCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //如果用标识找不到cell的话，新建cell
    if (cell == nil)
    {
        //使用自定义cell，从xib文件加载cell(要在xib文件中为cell添加cellIndentifier)
        cell = [[[NSBundle mainBundle] loadNibNamed:@"OrganCell" owner:nil
                                            options:nil] lastObject];
    }
    //返回需要的单元格
    return cell;
}

- (IBAction)setOrganSelected:(UIButton *)sender {
    
    NSLog(@"%lu",(unsigned long)_btnSelect.state);
    
    self.organInfo.strIsSelected = @"1";
    if ([self.delegate respondsToSelector:@selector(organCell:DidSelectedOrgan:)]) {
        [self.delegate organCell:self DidSelectedOrgan:self.organInfo];
    }
}
@end
