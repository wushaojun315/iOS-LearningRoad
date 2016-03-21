//
//  AppConfig.h
//  FDPublic
//
//  Created by 刘伟 on 15/6/18.
//  Copyright (c) 2015年 timShadow. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "DTOAppInitData.h"
//#import "DTOLoginData.h"
//#import "DTOAppLoginUserListData.h"

#define APPCONFIG_COOKIES @"cookies"
#define APPCONFIG_LOGINSTATUS @"loginStatus"

@interface AppConfig : NSObject

@property (nonatomic, copy) NSArray *arrTabBarModel;

//@property (nonatomic, strong) DTOLoginData *loginData;
//@property (nonatomic, strong) DTOAppInitData *appData;
//@property (nonatomic, strong) DTOAppLoginUserListData *loginUserData;
//@property (nonatomic, assign) FDLoginStatus loginStatus;

+ (AppConfig*)sharedInstance;

- (void)saveData:(id)data forKey:(NSString*)key;
- (id)getDataByKey:(NSString*)key;
- (void)removeDataByKey:(NSString*)key;

- (void)saveData:(id)data;
- (id)getData:(Class)class;
- (void)removeData:(Class)class;
- (void)removeUserDefaults;

@end
