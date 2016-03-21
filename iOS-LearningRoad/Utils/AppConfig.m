//
//  AppConfig.m
//  FDPublic
//
//  Created by 刘伟 on 15/6/18.
//  Copyright (c) 2015年 timShadow. All rights reserved.
//

#import "AppConfig.h"

@implementation AppConfig
{
    NSUserDefaults *userDefaults;
}

SINGLETON

- (id)init {
    userDefaults = [[NSUserDefaults alloc] init];
    self.loginStatus = FDLoginStatusNone;
    return [super init];
}

- (void)saveData:(id)data forKey:(NSString*)key {
    if (data && key) {
        NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:data];
        [userDefaults setObject:encodedObject forKey:key];
        [userDefaults synchronize];
    } else if (key) {
        [self removeDataByKey:key];
    }
}

- (id)getDataByKey:(NSString*)key {
    id data;
    if (key) {
        NSData *encodedObject = [userDefaults objectForKey:key];
        if(encodedObject) {
            data = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
        }
    }
    return data;
}

- (void)removeDataByKey:(NSString*)key {
    if (key) {
        [userDefaults removeObjectForKey:key];
    }
}

- (void)saveData:(NSObject*)data {
    [self saveData:data forKey:NSStringFromClass([data class])];
}

- (id)getData:(Class)class {
    return [self getDataByKey:NSStringFromClass(class)];
}

- (void)removeData:(Class)class {
    [self removeDataByKey:NSStringFromClass(class)];
}

- (void)removeUserDefaults {
    NSDictionary *dictionary = [userDefaults dictionaryRepresentation];
    for(NSString* key in [dictionary allKeys]){
        [userDefaults removeObjectForKey:key];
    }
    [userDefaults synchronize];
}

//- (void)setLoginData:(DTOLoginData *)loginData {
//    [self saveData:loginData forKey:NSStringFromClass([DTOLoginData class])];
//}
//
//- (DTOLoginData*)loginData {
//    return [self getData:[DTOLoginData class]];
//}

//- (void)setAppData:(DTOAppInitData *)appData {
//    [self saveData:appData forKey:NSStringFromClass([DTOAppInitData class])];
//}
//
//- (DTOAppInitData*)appData {
//    return [self getData:[DTOAppInitData class]];
//}
//
//- (void)setLoginUserData:(DTOAppLoginUserListData *)loginUserData {
//    [self saveData:loginUserData forKey:NSStringFromClass([DTOAppLoginUserListData class])];
//}
//
//- (DTOAppLoginUserListData*)loginUserData {
//    return [self getData:[DTOAppLoginUserListData class]];
//}

- (void)setLoginStatus:(FDLoginStatus)loginStatus {
    [self saveData:[NSNumber numberWithInteger:loginStatus] forKey:APPCONFIG_LOGINSTATUS];
}

- (FDLoginStatus)loginStatus {
    NSNumber *status = [self getDataByKey:APPCONFIG_LOGINSTATUS];
    return (FDLoginStatus)status.integerValue;
}

@end
