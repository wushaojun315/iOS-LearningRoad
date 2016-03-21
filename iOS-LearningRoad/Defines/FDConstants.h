//
//  FDConstants.h
//  FDSupervise
//
//  Created by 刘伟 on 15/6/10.
//  Copyright (c) 2015年 刘伟. All rights reserved.
//

#ifndef FDSupervise_FDConstants_h
#define FDSupervise_FDConstants_h

#define AMAP_KEY  @"e04161c45653178f33fa2f583b3c5031"

#define APP_Frame_Height   [UIScreen mainScreen].bounds.size.height //应用程序的屏幕高度
#define App_Frame_Width    [UIScreen mainScreen].bounds.size.width  //应用程序的屏幕宽度

#define App_Delegate (AppDelegate*)([UIApplication sharedApplication].delegate)

#define Default_Page_Size 20

#define IOS7 [[[UIDevice currentDevice]systemVersion] floatValue] < 8.0

#define PNGImage(fileName) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:@"png"]]
#define JPGImage(fileName) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:@"jpg"]]

#define kGetColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#define sysWidth [UIScreen mainScreen].bounds.size.width
#define sysHeight [UIScreen mainScreen].bounds.size.height

#define sysNoHomeHeight [UIScreen mainScreen].bounds.size.height - 64
#define sysHeightHome [UIScreen mainScreen].bounds.size.height - 50 - 64

#define kKeyBoradHeight 216

#define kSvgHeight(s, k) ((s - k)/2)
#define kSvgWidth(s, k) ((s - k)/2)

#define FontName @"Helvetica"
#define FontName_Bold @"Helvetica-Bold"
#define FontSize 14

#define kFont(size) ([UIFont fontWithName:FontName size:size])

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

#ifndef SINGLETON
#define SINGLETON \
+ (id)sharedInstance { \
static id _shareInstance = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^(void){ \
_shareInstance = [[[self class]alloc] init]; \
}); \
return _shareInstance; \
}
#endif

#ifndef CATEGORY_WEAK_OBJ_PROPERTY
#define CATEGORY_WEAK_OBJ_PROPERTY(propertyGetter,propertySetter) \
-(id)propertyGetter{ \
return objc_getAssociatedObject(self, @selector(propertyGetter)); \
} \
-(void)propertySetter:(id)obj{ \
objc_setAssociatedObject(self, @selector(propertyGetter), obj, OBJC_ASSOCIATION_ASSIGN); \
}
#endif


#define kTipAlert(_S_, ...)     [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:(_S_), ##__VA_ARGS__] delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil] show]

#define WEAKSELF __weak typeof(self) weakSelf = self;

#define Is_App_Login [AppConfig sharedInstance].loginStatus == FDLoginStatusSuccess

#endif
