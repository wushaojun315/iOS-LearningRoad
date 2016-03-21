//
//  ABUtil.h
//  GSMoblieManager
//
//  Created by Ken on 16/1/20.
//  Copyright © 2016年 Ken. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABUtil : NSObject

/*
 * 获取指定controller
 */
+ (id)getViewController:(NSString*)viewController fromStoryBoard:(NSString*)storyBoard;

/*
 * 字符串非空
 */
+ (NSString*)stringTrim:(NSString*)str;

/**
 * 检查系统"照片"授权状态, 如果权限被关闭, 提示用户去隐私设置中打开.
 */
+ (BOOL)checkPhotoLibraryAuthorizationStatus;

/**
 * 检查系统"相机"授权状态, 如果权限被关闭, 提示用户去隐私设置中打开.
 */
+ (BOOL)checkCameraAuthorizationStatus;

/**
 * 获取字符串首字母(传入汉字字符串, 返回大写拼音首字母)
 */
+ (NSString *)getFirstLetterFromString:(NSString *)aString;

/**
 * 将字符串数组，按首字母分组，得到“字母”对“相应子字符串数组”的字典
 */
+ (NSDictionary *)getDicWithArray:(NSArray *)arrNames;

@end
