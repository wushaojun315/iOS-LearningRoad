//
//  UsageOfKVC.h
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/9.
//  Copyright © 2016年 George. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsageOfKVC : UIViewController
/**
 1,使用KVC操作属性
 - (void)setValue:(id)value forKey:(NSString *)key;
 -(id)valueForKey:(NSString *)key;
 
 Person *p = [[Person alloc] init];
 [p setValue:@"Jay" forKey:@"name"];//使用KVC给属性name赋值
 [p setValue:@28 forKey:"age"];//使用KVC给属性age赋值，@28，会直接将数字赋值给int型
 
 NSLog(@"age = %d",[[p valueForKey:@"age"] intValue]);//使用KVC获取p的属性的值
 
 */

@property (weak, nonatomic) NSString *middle1;

/**
2,使用KVC获取Key路径
- (void)setValue:(id)value forKeyPath:(NSString *)keyPath;
- (id)valueForKeyPath:(NSString *)keyPath;

Person *p = [[Person alloc] init]

//使用KVC方式给dog属性赋值
[p setValue:[[Dog alloc] init] forKey:@"dog"];
//使用setValue:forKeyPath给dog属性的color属性赋值
[p setValue:[UIColor redColor] forKeyPath:@"dog.color"];

//使用valueForKeyPath方法获取复合属性的值
UIColor *color = [p valueForKeyPath:"dog.color"];
*/

@property (weak, nonatomic) NSString *middle2;

/**
 *  3,处理不存在的key，重写方法：
 - (void)setValue:(id)value forUndefinedKey:(NSString *)key
 {
 NSLog(@"您设置的key－－％@不存在",key);
 }
 
 - (id)valueForUndefinedKey:(NSString *)key
 {
 return [NSString stringwithFormat:@"您要获取的key－－％@不存在",key];
 }

 */

@property (weak, nonatomic) NSString *middle3;

/**
 *  4,字典转模型
 //字典转模型
 - (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues;
 //模型转字典
 - (NSDictionary<NSString *,id> *)dictionaryWithValuesForKeys:(NSArray<NSString *> *)keys;
 */

@end
