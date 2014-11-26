//
//  TBCityPreprocessorMacros.h
//  mamibao
//
//  Created by zhudong on 14-7-30.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//


#import "MmbMVCConfig.h"
#import "UIViewAdditions.h"
#import "MmbViewUtil.h"
#import "MmbGlobal.h"
#import "MmbAuthenticateCenter.h"
#import <SDWebImage/UIImageView+WebCache.h>


// 系统设置相关
#define APP_SCREEN_BOUNDS   [[UIScreen mainScreen] bounds]
#define APP_SCREEN_HEIGHT   (APP_SCREEN_BOUNDS.size.height)
#define APP_SCREEN_WIDTH    (APP_SCREEN_BOUNDS.size.width)
#define APP_STATUS_FRAME    [UIApplication sharedApplication].statusBarFrame
#define APP_CONTENT_WIDTH   (APP_SCREEN_BOUNDS.size.width)
#define APP_CONTENT_HEIGHT  (APP_SCREEN_BOUNDS.size.height-20)

#define isIOS7 [[UIDevice currentDevice].systemVersion floatValue] > 6.9

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f \
alpha:(a)]

#define HEXCOLORA(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:a]
#define HEXCOLOR(rgbValue) HEXCOLORA(rgbValue, 1.0)


#define keyChainEncryptString @"keyChainEncryptString"
#define keyChainServiceName   @"keyChainServiceName"

#define kNotificationUserLoggedIn    @"NOTIFICATION_USER_LOGGED_IN"
#define kNotificationUserLoggedOut   @"NOTIFICATION_USER_LOGGED_OUT"


#define ifDebug @"1"