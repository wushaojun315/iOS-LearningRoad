//
//  ViewController.m
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/3.
//  Copyright © 2016年 George. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "UIButton+ZZZAdjustImagePosition.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"主界面"];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    
    
    
    
    //下面添加其他UI控件
    UIButton *btn1 = [[UIButton alloc] init];
    btn1.backgroundColor = [UIColor whiteColor];
    btn1.imageView.backgroundColor = [UIColor redColor];
    btn1.titleLabel.backgroundColor = [UIColor greenColor];
    [btn1 setImage:[UIImage imageNamed:@"icon_weixin"] forState:(UIControlStateNormal)];
    [btn1 setTitle:@"推送到微信" forState:(UIControlStateNormal)];
//    [shareWechatButton setImagePosition:(LXMImagePositionTop) spacing:5];
    btn1.titleLabel.font = [UIFont systemFontOfSize:60];
    [btn1 setTitleColor:[UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1] forState:(UIControlStateNormal)];
    [self.view addSubview:btn1];
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(20);
        make.centerY.equalTo(self.view.mas_top).with.offset(100);
    }];
    UIButton *btn11 = [[UIButton alloc] init];
    btn11.backgroundColor = [UIColor whiteColor];
    btn11.imageView.backgroundColor = [UIColor redColor];
    btn11.titleLabel.backgroundColor = [UIColor greenColor];
    [btn11 setImage:[UIImage imageNamed:@"icon_weixin@2x"] forState:(UIControlStateNormal)];
    [btn11 setTitle:@"推送到微信" forState:(UIControlStateNormal)];
    btn11.titleLabel.font = [UIFont systemFontOfSize:60];
    [btn11 changeImagePosition:(ZZZButtonImagePositionDown) middleSpace:50];
    [btn11 setTitleColor:[UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1] forState:(UIControlStateNormal)];
    [self.view addSubview:btn11];
    [btn11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(20);
        make.centerY.equalTo(self.view.mas_top).with.offset(300);
    }];
    
    UIButton *btn2 = [[UIButton alloc] init];
    btn2.backgroundColor = [UIColor whiteColor];
    btn2.imageView.backgroundColor = [UIColor redColor];
    btn2.titleLabel.backgroundColor = [UIColor greenColor];
    [btn2 setImage:[UIImage imageNamed:@"icon_qq"] forState:(UIControlStateNormal)];
    [btn2 setTitle:@"推送到QQ" forState:(UIControlStateNormal)];
//    [shareQQButton setImagePosition:(LXMImagePositionTop) spacing:5];
    btn2.titleLabel.font = [UIFont systemFontOfSize:11];
    [btn2 changeImagePosition:(ZZZButtonImagePositionUp) middleSpace:50];
    [btn2 setTitleColor:[UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1] forState:(UIControlStateNormal)];
    [self.view addSubview:btn2];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(20);
        make.centerY.equalTo(self.view.mas_top).with.offset(450);
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)changePositon:(UIButton *)button withSpace:(CGFloat)spacing andPosition:(int)postion{
    CGFloat imageWidth = button.imageView.image.size.width;
    CGFloat imageHeight = button.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGFloat labelWidth = [button.titleLabel.text sizeWithFont:button.titleLabel.font].width;
    CGFloat labelHeight = [button.titleLabel.text sizeWithFont:button.titleLabel.font].height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
    
    CGFloat tempWidth = MAX(labelWidth, imageWidth);
    CGFloat changedWidth = labelWidth + imageWidth - tempWidth;
    CGFloat tempHeight = MAX(labelHeight, imageHeight);
    CGFloat changedHeight = labelHeight + imageHeight + spacing - tempHeight;
    
    CGFloat horzonHeight = MAX(labelHeight, imageHeight);
    CGFloat horzonWidth = labelWidth + imageWidth;
    
    CGFloat verticalHeight = labelHeight + imageHeight;
    CGFloat verticalWidth = MAX(labelWidth, imageWidth);
    
    switch (postion) {
        case 1:// LXMImagePositionLeft

            break;
            
        case 2:// LXMImagePositionRight
            button.imageEdgeInsets = UIEdgeInsetsMake(0, (horzonWidth - imageWidth), 0, -(horzonWidth - imageWidth));
            button.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth), 0, imageWidth);
            button.contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
            break;
            
        case 3://LXMImagePositionTop
            button.imageEdgeInsets = UIEdgeInsetsMake(-labelHeight, labelWidth / 2 - imageWidth/2, labelHeight, -(labelWidth / 2 - imageWidth / 2));
            button.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            button.contentEdgeInsets = UIEdgeInsetsMake(imageOffsetY, -changedWidth/2, changedHeight-imageOffsetY, -changedWidth/2);
            break;
            
        case 4://LXMImagePositionBottom
            button.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            button.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            button.contentEdgeInsets = UIEdgeInsetsMake(changedHeight-imageOffsetY, -changedWidth/2, imageOffsetY, -changedWidth/2);
            break;
    }
}

@end
