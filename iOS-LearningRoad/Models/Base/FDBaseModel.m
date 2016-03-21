//
//  FDBaseModel.m
//  FDPublic
//
//  Created by 刘伟 on 15/6/19.
//  Copyright (c) 2015年 timShadow. All rights reserved.
//

#import "FDBaseModel.h"
//#import "ObjcRuntime.h"
#import "JSONModelClassProperty.h"

@implementation FDBaseModel

//+ (void)swizzleCustomPropertyMethods {
//    Swizzle([FDBaseModel class], @selector(__customSetValue:forProperty:), @selector(customSetValue:forProperty:));
//    Swizzle([FDBaseModel class], @selector(__customGetValue:forProperty:), @selector(customGetValue:forProperty:));
//}
//
//- (BOOL)customSetValue:(id<NSObject>)value forProperty:(JSONModelClassProperty*)property {
//    [self customSetValue:value forProperty:property];
//    if (property.type != [NSString class] || ![value isKindOfClass:[NSString class]]) {
//        property.setterType = kNo;
//        return NO;
//    }
//    NSString *jsonValue = (NSString*)value;
//    [self setValue:[jsonValue URLDecodedString] forKey:property.name];
//    return YES;
//}
//
//- (BOOL)customGetValue:(id<NSObject>*)value forProperty:(JSONModelClassProperty*)property {
//    [self customGetValue:value forProperty:property];
//    if (property.type != [NSString class] || ![*value isKindOfClass:[NSString class]]) {
//        property.setterType = kNo;
//        return NO;
//    }
//    *value = [[self valueForKey:property.name] URLEncodedString];
//    return YES;
//}

@end
