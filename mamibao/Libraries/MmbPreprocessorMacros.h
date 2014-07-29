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