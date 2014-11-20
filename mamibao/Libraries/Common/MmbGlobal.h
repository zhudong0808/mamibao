//
//  MmbGlobal.h
//  mamibao
//
//  Created by zhudong on 14/11/18.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <Foundation/Foundation.h>

UIWindow *mainWindow();

@interface MmbGlobal : NSObject

+ (void)showProgressHUD:(NSString *)aString duration:(CGFloat)duration;

@end
