//
//  ViewController.m
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/3.
//  Copyright © 2016年 George. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "SelectOrganController.h"
#import "DTOOrganInfo.h"

@interface ViewController ()<SelectOrganControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labOrganName;
@end

@implementation ViewController

- (void)viewDidLoad
{
    TICK
    [super viewDidLoad];
    [self setTitle:@"主界面"];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    DEBUG;
    //下面添加其他UI控件
    TOCK
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)goSelectOrgan:(UIButton *)sender {
    SelectOrganController *controller = [[SelectOrganController alloc] init];
    controller.delegate = self;
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)selectOrganController:(SelectOrganController *)selectOrgController didClickSure:(DTOOrganInfo *)organ{
    
    _labOrganName.text = organ.organName;
}
@end
