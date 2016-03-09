//
//  KVOUsage.m
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/9.
//  Copyright © 2016年 George. All rights reserved.
//

#import "KVOUsage.h"
#import "Movie.h"

@interface KVOUsage ()

//定义两个属性，表示价格标签和更新按钮

@property (weak, nonatomic) IBOutlet UILabel *labPrice;

- (IBAction)updatePrice:(UIButton *)sender;

//定义一个模型属性
@property (nonatomic, strong) Movie *movie;

@end

@implementation KVOUsage

- (Movie *)movie
{
    if (_movie == nil) {
        _movie = [[Movie alloc] init];
        //给movie属性注册一个监听器，观察者为self
        [_movie addObserver:self forKeyPath:@"price" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    }
    return _movie;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self movie];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)updatePrice:(UIButton *)sender
{
    //修改price属性的值－－－－－－使用KVC机制
    [self.movie setValue:@"200 ¥" forKey:@"price"];
}

//要响应值变化的话，需要响应方法：
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    //若keyPath路径为price，则将新价格显示
    if ([keyPath isEqualToString:@"price"])
    {
        self.labPrice.text = [_movie valueForKey:@"price"];//使用KVC获取属性值
    }
}

- (void)dealloc
{
    //移除指定监听器
    [_movie removeObserver:self forKeyPath:@"price"];//是_movie移除，而不是self
}

@end
