//
//  FDHttpManager.h
//  FDPublic
//
//  Created by 刘伟 on 15/6/18.
//  Copyright (c) 2015年 timShadow. All rights reserved.
//

#import "FDBaseManager.h"

@interface FDHttpManager : FDBaseManager

+ (id)shareHttpManager;

//POST将parameters放入到urlParams
-(void)POSTURLParams:(NSString *)URLString
          parameters:(NSDictionary *)parameters
             success:(void (^)(id))success
             failure:(void (^)(NSError *))failure;

//POST 字典
- (void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters
    mockFile:(NSString *)mockFileName
     success:(void (^)(id data))success
     failure:(void (^)(NSError *error))failure;

//POST 完整JSON对象
- (void)POST:(NSString *)URLString JSONData:(NSData *)data Key:(NSString*)key
    mockFile:(NSString *)mockFileName
     success:(void (^)(id data))success
     failure:(void (^)(NSError *error))failure;

//POST 字典+文件
- (void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters
       files:(NSArray*)fileUrls
    mockFile:(NSString *)mockFileName
     success:(void (^)(id data))success
     failure:(void (^)(NSError *error))failure;

//POST 完整JSON对象+文件
- (void)POST:(NSString *)URLString JSONData:(NSData *)data Key:(NSString*)key
       files:(NSArray*)fileUrls
    mockFile:(NSString *)mockFileName
     success:(void (^)(id data))success
     failure:(void (^)(NSError *error))failure;

//GET
- (void)GET:(NSString *)URLString parameters:(NSDictionary *)parameters
   mockFile:(NSString *)mockFileName
    success:(void (^)(id data))success
    failure:(void (^)(NSError *error))failure;

@end
