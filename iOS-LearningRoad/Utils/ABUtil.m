//
//  ABUtil.m
//  GSMoblieManager
//
//  Created by Ken on 16/1/20.
//  Copyright © 2016年 Ken. All rights reserved.
//

#import "ABUtil.h"

#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>


@implementation ABUtil


+ (id)getViewController:(NSString*)vc fromStoryBoard:(NSString*)sb {
    
    if(!vc || !sb) return nil;
    
    id newViewController = nil;
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:sb bundle:nil];
    newViewController = [storyBoard instantiateViewControllerWithIdentifier:vc];
    
    return newViewController;
}

+ (NSString*)stringTrim:(NSString*)str
{
    return nil;
}

+ (BOOL)checkPhotoLibraryAuthorizationStatus
{
    if ([ALAssetsLibrary respondsToSelector:@selector(authorizationStatus)]) {
        ALAuthorizationStatus authStatus = [ALAssetsLibrary authorizationStatus];
        if (ALAuthorizationStatusDenied == authStatus ||
            ALAuthorizationStatusRestricted == authStatus) {
            [self showSettingAlertStr:@"请在iPhone的“设置->隐私->照片”中打开本应用的访问权限"];
            return NO;
        }
    }
    return YES;
}

+ (BOOL)checkCameraAuthorizationStatus
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
//        kTipAlert(@"该设备不支持拍照");
        return NO;
    }
    
    if ([AVCaptureDevice respondsToSelector:@selector(authorizationStatusForMediaType:)]) {
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (AVAuthorizationStatusDenied == authStatus ||
            AVAuthorizationStatusRestricted == authStatus) {
            [self showSettingAlertStr:@"请在iPhone的“设置->隐私->相机”中打开本应用的访问权限"];
            return NO;
        }
    }
    
    return YES;
}

+ (void)showSettingAlertStr:(NSString *)tipStr{
    //iOS8+系统下可跳转到‘设置’页面，否则只弹出提示窗即可
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1) {
//        UIAlertView *alertView = [UIAlertView bk_alertViewWithTitle:@"提示" message:tipStr];
//        [alertView bk_setCancelButtonWithTitle:@"取消" handler:nil];
//        [alertView bk_addButtonWithTitle:@"设置" handler:nil];
//        [alertView bk_setDidDismissBlock:^(UIAlertView *alert, NSInteger index) {
//            if (index == 1) {
//                UIApplication *app = [UIApplication sharedApplication];
//                NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
//                if ([app canOpenURL:settingsURL]) {
//                    [app openURL:settingsURL];
//                }
//            }
//        }];
//        [alertView show];
    }else{
        kTipAlert(@"%@", tipStr);
    }
}

//获取字符串首字母(传入汉字字符串, 返回大写拼音首字母)
+ (NSString *)getFirstLetterFromString:(NSString *)aString
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *strPinYin = [str capitalizedString];
    //获取并返回首字母
    return [strPinYin substringToIndex:1];
}

//将字符串数组，按首字母分组，得到“字母”对“相应子字符串数组”的字典
+ (NSDictionary *)getDicWithArray:(NSArray *)arrNames
{
    NSMutableDictionary *dictFirstLetterToNames = [NSMutableDictionary dictionary];
    for (NSString *name in arrNames)
    {
        //获取到姓名的大写首字母
        NSString *strFirstLetter = [ABUtil getFirstLetterFromString:name];
        //如果该字母对应的模型不为空（即签名已经有过该首字母的名字了）
        //则将这个姓名加入到这个首字母对应的姓名数组中
        if (dictFirstLetterToNames[strFirstLetter])
        {
            [dictFirstLetterToNames[strFirstLetter] addObject:name];
        }
        else//没有出现过该首字母，则往字典中新增一组key-value
        {
            //新建一个可变长数组，用于存储该首字母对应的姓名
            NSMutableArray *arrGroupNames = [NSMutableArray arrayWithObject:name];
            //将首字母-姓名数组作为key-value加入到字典中
            [dictFirstLetterToNames setObject:arrGroupNames forKey:strFirstLetter];
        }
    }
    return dictFirstLetterToNames;
}

@end
