//
//  MmbGlobal.m
//  mamibao
//
//  Created by zhudong on 14/11/18.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbGlobal.h"
#import "MBProgressHUD.h"

UIWindow *mainWindow() {
    id appDelegate = [UIApplication sharedApplication].delegate;
    if (appDelegate && [appDelegate respondsToSelector:@selector(window)]) {
        return [appDelegate window];
    }
    
    NSArray *windows = [UIApplication sharedApplication].windows;
    if ([windows count] == 1) {
        return [windows firstObject];
    }
    else {
        for (UIWindow *window in windows) {
            if (window.windowLevel == UIWindowLevelNormal) {
                return window;
            }
        }
    }
    return nil;
}

static MBProgressHUD  *s_progressHUD = nil;

@implementation MmbGlobal

+ (void)showProgressHUD:(NSString *)aString duration:(CGFloat)duration {
    [self hideProgressHUD];
    MBProgressHUD *progressHUD = [[MBProgressHUD alloc] initWithView:mainWindow()];
    [mainWindow() addSubview:progressHUD];
    progressHUD.mode = MBProgressHUDModeText;
    progressHUD.animationType = MBProgressHUDAnimationZoom;
    progressHUD.labelText = aString;
    progressHUD.removeFromSuperViewOnHide = YES;
    progressHUD.opacity = 0.5;
    [progressHUD show:NO];
    [progressHUD hide:YES afterDelay:duration];
}

+ (void)hideProgressHUD {
    if (s_progressHUD) {
        [s_progressHUD hide:YES];
    }
}

@end
