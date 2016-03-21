//
//  FDBaseResult.m
//  FDPublic
//
//  Created by 刘伟 on 15/6/19.
//  Copyright (c) 2015年 timShadow. All rights reserved.
//

#import "FDBaseResult.h"

@implementation FDBaseResult

+ (JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"result": @"body"
                                                       }];
}

- (id)getResultObject:(Class)clazz {
    id object;
    
    if(clazz && !isNull(self.body)) {
        __autoreleasing NSError *err = nil;
        object = [[[clazz class] alloc] initWithDictionary:(id)self.body error:&err];
        if(err){
//            debug_log(err.description);
        }
    }
    
    return object;
}

//- (FDResultPage *)getResultPage:(Class)clazz {
//    FDResultPage *resultPage;
//    
//    if(clazz && !isNull(self.body)) {
//        __autoreleasing NSError *err = nil;
//        resultPage = [[FDResultPage alloc] initWithDictionary:(id)self.body error:&err];
//        if(resultPage.list) {
//            resultPage.list = [clazz arrayOfModelsFromDictionaries:resultPage.list];
//        }
//        if(err){
//            debug_log(err.description);
//        }
//    }
//    
//    return resultPage;
//}


//获取类似此类型数据：食材追溯会用到
//{
//    body:
//      [
//            [
//                {},
//                {},
//                {}
//             ],
//            [
//                {},
//                {}
//            ],
//            [
//                {}
//            ],
//            [
//                {},
//                {}
//             ]
//      ]};
- (NSArray*)getNestResultArrayList:(Class)clazz{
    NSMutableArray *resultArr = [[NSMutableArray alloc] init];
    if(clazz &&!isNull(self.body)){
        if([self.body isKindOfClass:[NSArray class]]){
            NSArray*arr = (NSArray*)self.body;
            for(id data in arr){
                [resultArr addObject:[clazz arrayOfModelsFromDictionaries:data]];
            }
        }
    }
    return  resultArr;
}

- (NSArray*)getResultArrayList:(Class)clazz{
    return [clazz arrayOfModelsFromDictionaries:(NSArray*)self.body]; ;
}

//通知公告
- (NSArray*)getResultArrayListByDic:(Class)clazz strKey:(NSString*)strKey
{
//    if([self.body isKindOfClass:[NSDictionary class]])
//    {
//        if (strKey.length != 0)
//        {
//            NSDictionary *dic = (NSDictionary*)self.body;
//            NSArray *arr = [dic objectForKey:strKey];
//            return [clazz arrayOfModelsFromDictionaries:arr];
//        }
//    }
//    return nil;
    
    NSArray *arr = nil;
    
    if(clazz && !isNull(self.body)) {
        __autoreleasing NSError *err = nil;
        if([self.body isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *dic = (NSDictionary*)self.body;
            NSArray *jsonArr = [dic objectForKey:strKey];
            if (jsonArr)
            {
                arr = [clazz arrayOfModelsFromDictionaries:jsonArr];
            }
        }
        if(err){
            debug_log(err.description);
        }
    }
    
    return arr;
}

//通知公告详情, body为字典，获取字典对应key中的对象
/**
 {
 "code": "200",
 "message": "请求成功",
 "result": {
    "result": {
        "bulletinId": "ff808181510e0be00151192c65810152",
        "content": "会议通知：会议议题(标题)：129_test_006，会议时间：，会议地点：，参会人员：",
        "deptname": "信息中心",
        "openrange": "本局",
        "orgname": "河北省工商行政管理局",
        "regdate": "2015-11-18",
        "title": "会议通知"
    },
    "docAttachVoList": []
 }
 }
 */
- (id)getResultObject:(Class)clazz withKey:(NSString *)key
{
    id object;
    
    if(clazz && !isNull(self.body)) {
        __autoreleasing NSError *err = nil;
        if([self.body isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *dict = ((NSDictionary *)self.body)[key];
            object = [[[clazz class] alloc] initWithDictionary:dict error:&err];
        }
        if(err){
            debug_log(err.description);
        }
    }
    
    return object;
}
@end
