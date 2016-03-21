//
//  FDEnums.h
//  FDSupervise
//
//  Created by 刘伟 on 15/6/10.
//  Copyright (c) 2015年 刘伟. All rights reserved.
//

#ifndef FDSupervise_FDEnums_h
#define FDSupervise_FDEnums_h

typedef NS_ENUM(NSInteger, FDSexType) {
    FDSexTypeMale = 0,
    FDSexTypeFemale
};

typedef NS_ENUM(NSInteger, FDLoginStatus) {
    FDLoginStatusNone = 0,
    FDLoginStatusSuccess = 1,
    FDLoginStatusFailed = 2,
    FDLoginStatusProcessing
};

typedef NS_ENUM(NSInteger, FDSaftyRating) {
    FDSaftyRatingNone = 21001,
    FDSaftyRatingBad,
    FDSaftyRatingNormal,
    FDSaftyRatingGood
};

typedef NS_ENUM(NSInteger, FDGovInfoType) {
    FDGovInfoTypeNotice = 35002,
    FDGovInfoTypeKnowledge,
    FDGovInfoTypePolicy,
    FDGovInfoTypeDynamic
};

typedef NS_ENUM(NSInteger, FDProcessNodeType) {
    FDProcessNodeTypeStart = 0,
    FDProcessNodeTypeMiddle = 1,
    FDProcessNodeTypeEnd
};

#endif
