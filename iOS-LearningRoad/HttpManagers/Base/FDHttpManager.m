////
////  FDHttpManager.m
////  FDPublic
////
////  Created by 刘伟 on 15/6/18.
////  Copyright (c) 2015年 timShadow. All rights reserved.
////
//
//#import "FDHttpManager.h"
//#import "AFHTTPRequestOperationManager.h"
//#import "ABUtil.h"
//#import "AppDelegate.h"
////#import "AppConfig.h"
////#import "DTOAppInitData.h"
//
//@implementation FDHttpManager
//{
//    AFHTTPRequestOperationManager *requestManager;
//    NSString *sessionId;
//}
//
//+ (id)shareHttpManager {
//    static FDHttpManager *_shareHttpManager = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^(void){
//        _shareHttpManager = [[FDHttpManager alloc] initWithBaseURL:[NSURL URLWithString:ServiceEndPoint]];
//    });
//    return _shareHttpManager;
//}
//
//- (id)initWithBaseURL:(NSURL *)url {
//    self = [super init];
//    if (!self) {
//        return nil;
//    }
//    
//    requestManager = [AFHTTPRequestOperationManager manager];
//    requestManager.requestSerializer = [AFJSONRequestSerializer serializer];
//    requestManager.responseSerializer = [AFJSONResponseSerializer serializer];
//    requestManager.requestSerializer.timeoutInterval = 30;
//    requestManager.requestSerializer.HTTPMethodsEncodingParametersInURI = [[NSSet alloc] initWithArray:@[@"POST",@"GET", @"HEAD", @"DELETE"]];
//    requestManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
//    
//    [requestManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [requestManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
////    [requestManager.requestSerializer setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
//    
////    [requestManager.requestSerializer setValue:[NSString getMyApplicationBuild] forHTTPHeaderField:@"appVersion"];
////    [requestManager.requestSerializer setValue:@"13812345678" forHTTPHeaderField:@"deviceSn"];
//    return self;
//}
//
//-(void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters mockFile:(NSString *)mockFileName success:(void (^)(id))success failure:(void (^)(NSError *))failure{
//    if (mockFileName) {
//        [self POSTMultipart:URLString parameters:parameters mockFile:mockFileName success:success failure:failure];
//    }else{
//        [self POSTURLParams:URLString parameters:parameters  success:success failure:failure];
//    }
//}
//
//-(void)POSTURLParams:(NSString *)URLString parameters:(NSDictionary *)parameters  success:(void (^)(id))success failure:(void (^)(NSError *))failure
//{
//    
//    [self setSessionId];
//    [requestManager POST:[NSString stringWithFormat:@"%@%@", ServiceEndPoint, [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]
//              parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//                  debug_log([NSString stringWithFormat:@"success====:%@",responseObject]);
//                  [self saveSessionId:operation.response];
//                  NSError *error = [self handleResponse:responseObject];
//                  if (error) {
//                      failure(error);
//                  } else {
//                      FDBaseResult *result = [[FDBaseResult alloc] initWithDictionary:responseObject error:nil];
//                      success(result);
//                  }
//                  
//              } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//                  debug_log([NSString stringWithFormat:@"%@",error]);
//                  [self showError:error];
//                  failure(error);
//              }];
//
//}
//
//- (void)POSTMultipart:(NSString *)URLString parameters:(NSDictionary *)parameters mockFile:(NSString *)mockFileName success:(void (^)(id))success failure:(void (^)(NSError *))failure
//{
//    [self setSessionId];
//    [requestManager POST:[NSString stringWithFormat:@"%@%@", ServiceEndPoint, [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]
//              parameters:parameters
//constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//}
//                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                     debug_log([NSString stringWithFormat:@"success====:%@",responseObject]);
//                     [self saveSessionId:operation.response];
//                     NSError *error = [self handleResponse:responseObject];
//                     if (error) {
//                         failure(error);
//                     } else {
//                         FDBaseResult *result = [[FDBaseResult alloc] initWithDictionary:responseObject error:nil];
//                         success(result);
//                     }
//                 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                     debug_log([NSString stringWithFormat:@"%@",error]);
//                     [self showError:error];
//                     failure(error);
//                 }];
//}
//
//- (void)POST:(NSString *)URLString JSONData:(NSData *)data Key:(NSString*)key mockFile:(NSString *)mockFileName success:(void (^)(id data))success failure:(void (^)(NSError *error))failure
//{
//    [self setSessionId];
//    [requestManager POST:[NSString stringWithFormat:@"%@%@", ServiceEndPoint, [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]
//              parameters:nil
//constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//    [self appendMultiPart:formData WithFormData:data name:key];
//}
//                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                     debug_log([NSString stringWithFormat:@"success====:%@",responseObject]);
//                     NSError *error = [self handleResponse:responseObject];
//                     if (error) {
//                         failure(error);
//                     } else {
//                         FDBaseResult *result = [[FDBaseResult alloc] initWithDictionary:responseObject error:nil];
//                         success(result);
//                     }
//                 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                     debug_log([NSString stringWithFormat:@"%@",error]);
//                     [self showError:error];
//                     failure(error);
//                 }];
//}
//
//- (void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters files:(NSArray*)fileUrls mockFile:(NSString *)mockFileName success:(void (^)(id data))success failure:(void (^)(NSError *error))failure
//{
//    [self setSessionId];
//    [requestManager POST:[NSString stringWithFormat:@"%@%@", ServiceEndPoint, [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]
//              parameters:parameters
//constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//    for (NSURL *url in fileUrls) {
//        NSString *fileName = [[[url absoluteString] componentsSeparatedByString:@"/"] lastObject];
//        [formData appendPartWithFileURL:url name:@"file" fileName:fileName mimeType:@"image/png" error:nil];
//    }
//}
//                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                     debug_log([NSString stringWithFormat:@"success====:%@",responseObject]);
//                     NSError *error = [self handleResponse:responseObject];
//                     if (error) {
//                         failure(error);
//                     } else {
//                         FDBaseResult *result = [[FDBaseResult alloc] initWithDictionary:responseObject error:nil];
//                         success(result);
//                     }
//                 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                     debug_log([NSString stringWithFormat:@"%@",error]);
//                     [self showError:error];
//                     failure(error);
//                 }];
//}
//
//- (void)POST:(NSString *)URLString JSONData:(NSData *)data Key:(NSString*)key files:(NSArray*)fileUrls mockFile:(NSString *)mockFileName success:(void (^)(id data))success failure:(void (^)(NSError *error))failure
//{
//    [self setSessionId];
//    [requestManager POST:[NSString stringWithFormat:@"%@%@", ServiceEndPoint, [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]
//              parameters:nil
//constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//    [self appendMultiPart:formData WithFormData:data name:key];
//    for (NSURL *url in fileUrls) {
//        NSString *fileName = [[[url absoluteString] componentsSeparatedByString:@"/"] lastObject];
//        [formData appendPartWithFileURL:url name:@"file" fileName:fileName mimeType:@"image/png" error:nil];
//    }
//}
//                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                     debug_log([NSString stringWithFormat:@"success====:%@",responseObject]);
//                     NSError *error = [self handleResponse:responseObject];
//                     if (error) {
//                         failure(error);
//                     } else {
//                         FDBaseResult *result = [[FDBaseResult alloc] initWithDictionary:responseObject error:nil];
//                         success(result);
//                     }
//                 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                     debug_log([NSString stringWithFormat:@"%@",error]);
//                     [self showError:error];
//                     failure(error);
//                 }];
//}
//
//- (void)GET:(NSString *)URLString parameters:(NSDictionary *)parameters mockFile:(NSString *)mockFileName success:(void (^)(id))success failure:(void (^)(NSError *))failure
//{
//    [self setSessionId];
//    debug_log([NSString stringWithFormat:@"%@%@", ServiceEndPoint, [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]);
//    [requestManager GET:[NSString stringWithFormat:@"%@%@", ServiceEndPoint, [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]
//             parameters:parameters
//                success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                    debug_log([NSString stringWithFormat:@"success====:%@",responseObject]);
//                    NSError *error = [self handleResponse:responseObject];
//                    if (error) {
//                        failure(error);
//                    } else {
//                        FDBaseResult *result = [[FDBaseResult alloc] initWithDictionary:responseObject error:nil];
//                        success(result);
//                    }
//                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                    debug_log([NSString stringWithFormat:@"%@",error]);
//                    [self showError:error];
//                    failure(error);
//                }];
//}
//
//- (void)appendMultiPart:(id<AFMultipartFormData>)formData WithFormData:(NSData *)data
//                   name:(NSString *)name
//{
//    NSParameterAssert(name);
//    
//    NSMutableDictionary *mutableHeaders = [NSMutableDictionary dictionary];
//    [mutableHeaders setValue:[NSString stringWithFormat:@"form-data; name=\"%@\"", name] forKey:@"Content-Disposition"];
//    [mutableHeaders setValue:@"application/json" forKey:@"Content-Type"];
//    
//    [formData appendPartWithHeaders:mutableHeaders body:data];
//}
//
//- (void)setToken {
////    DTOAppInitData *appData = [AppConfig sharedInstance].appData;
////    if (appData) {
////        [requestManager.requestSerializer setValue:appData.token forHTTPHeaderField:@"token"];
////    }
//}
//
//- (void)saveSessionId:(NSHTTPURLResponse*)response {
////    NSString *cookies = [response.allHeaderFields valueForKey:@"Set-Cookie"];
////    if (cookies) {
////        [[AppConfig sharedInstance] saveData:cookies forKey:APPCONFIG_COOKIES];
////    }
//}
//
//- (void)setSessionId {
////    NSString * cookies = [[AppConfig sharedInstance] getDataByKey:APPCONFIG_COOKIES];
////    if (cookies) {
////        [requestManager.requestSerializer setValue:cookies forHTTPHeaderField:@"Cookie"];
////    }
////    [self setToken];
//}
//
//#pragma mark NetError
//-(id)handleResponse:(id)responseJSON{
//    return [self handleResponse:responseJSON autoShowError:YES];
//}
//
//-(id)handleResponse:(id)responseJSON autoShowError:(BOOL)autoShowError{
//    NSError *error = nil;
//    NSNumber *status = [responseJSON valueForKeyPath:@"status"];
//    NSNumber *resultCode = [responseJSON valueForKeyPath:@"messageCode"];
//    
//    if (status.intValue != 0) {
//        error = [NSError errorWithDomain:ServiceEndPoint code:resultCode.intValue userInfo:responseJSON];
//        if (autoShowError) {
//            [self showError:error];
//        }
//        
//        if (resultCode.intValue == 100000) {//用户未登录
////            [App_Delegate launchLogin];
//        }
//    }
//    return error;
//}
//
//- (NSString *)tipFromError:(NSError *)error{
//    if (error && error.userInfo) {
//        NSMutableString *tipStr = [[NSMutableString alloc] init];
//        if ([error.userInfo objectForKey:@"message"]) {
//            tipStr = [error.userInfo objectForKey:@"message"];
//        }else{
//            if ([error.userInfo objectForKey:@"NSLocalizedDescription"]) {
//                tipStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
//            }else{
//                [tipStr appendFormat:@"ErrorCode%ld", (long)error.code];
//            }
//        }
//        return tipStr;
//    }
//    return nil;
//}
//
//- (BOOL)showError:(NSError *)error{
//    NSString *tipStr = [self tipFromError:error];
////    [self showToast:tipStr];
//    return YES;
//}
//
//@end
