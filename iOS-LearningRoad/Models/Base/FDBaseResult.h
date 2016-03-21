//
//  FDBaseResult.h
//  FDPublic
//
//  Created by 刘伟 on 15/6/19.
//  Copyright (c) 2015年 timShadow. All rights reserved.
//

#import "FDBaseModel.h"
//#import "FDResultPage.h"
//#import "FDKeyValueTree.h"

@interface FDBaseResult : FDBaseModel

///.m中已经定义自动将result字段转为body
@property (nonatomic, strong) NSObject<Optional> *body;//result

///新项目需要的字段
@property (nonatomic, strong) NSNumber<Optional>* pageCount;
@property (nonatomic, strong) NSNumber<Optional>* totalRecord;
@property (nonatomic, copy) NSString<Optional> *code;
@property (nonatomic, copy) NSString<Optional> *message;

- (id)getResultObject:(Class)clazz;
//- (FDResultPage *)getResultPage:(Class)clazz;

- (NSArray*)getNestResultArrayList:(Class)clazz;
- (NSArray*)getResultArrayList:(Class)clazz;

//通知公告
- (NSArray*)getResultArrayListByDic:(Class)clazz strKey:(NSString*)strKey;

//通知公告详情，获取包含在body的字典内的对象
- (id)getResultObject:(Class)clazz withKey:(NSString *)key;

@end
