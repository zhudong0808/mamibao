//
//  MmbAuthenticateCenter.h
//  mamibao
//
//  Created by zhudong on 14-7-30.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MmbLoginViewController.h"

@interface MmbAuthenticateCenter : NSObject

/**
 *  单例
 *
 *  @return 用户认证中心实例
 */
+(MmbAuthenticateCenter *)shareInstance;

/**
 *  获取sid
 *
 *  @return sid
 */
+ (NSString *)getEncryptString;

/**
 *  是否登录
 *
 *  @return YES:登录 NO:未登录
 */
- (BOOL)isLogin;

/**
 *  登录认证，回调
 *
 *  @param completion 回调处理内容
 */
- (void)authenticateWithCompletion:(MmbLoginCompletion)completion;

/**
 *  清空sid
 */
- (void)clearAllSession;
@end
