//
//  ViewController.h
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/3.
//  Copyright © 2016年 George. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomProtocolViewController.h"

//3，代理方遵守委托协议，具备成为代理方的资格
@interface ViewController : UIViewController<CustomProtocolViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labHint;
@property (weak, nonatomic) IBOutlet UIButton *btnButton;

- (IBAction)click:(UIButton *)sender;

@end
