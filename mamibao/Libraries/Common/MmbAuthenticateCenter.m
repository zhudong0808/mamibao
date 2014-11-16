//
//  MmbAuthenticateCenter.m
//  mamibao
//
//  Created by zhudong on 14-7-30.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbAuthenticateCenter.h"
#import "SFHFKeychainUtils.h"
#import "MmbAppDelegate.h"

@interface MmbAuthenticateCenter(){
}

/**
 *  标识当前是否在登录页面
 */
@property (nonatomic,assign) BOOL isAuthenticating;

/**
 *  登录的viewController
 */
@property (nonatomic,strong) MmbLoginViewController *loginViewController;

@end

@implementation MmbAuthenticateCenter

+(MmbAuthenticateCenter *)shareInstance{
    static MmbAuthenticateCenter *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[MmbAuthenticateCenter alloc] init];
    });
    return instance;
}

+ (NSString *)getEncryptString{
    NSString *password = [SFHFKeychainUtils getPasswordForUsername:keyChainEncryptString andServiceName:keyChainServiceName error:nil];
    if ([password length] > 0) {
        return password;
    }
    return @"";
}

- (BOOL)isLogin{
    NSString *password = [SFHFKeychainUtils getPasswordForUsername:keyChainEncryptString andServiceName:keyChainServiceName error:nil];
    if ([password length] > 0) {
        return YES;
    }
    return NO;
}

- (void)clearAllSession{
    [SFHFKeychainUtils deleteItemForUsername:keyChainEncryptString andServiceName:keyChainServiceName error:nil];
}

- (void)authenticateWithCompletion:(MmbLoginCompletion)completion{
    if (![self isLogin]) {
        [self manualLoginWithCompletion:completion];
    } else
    {
        completion(YES);
    }
}

- (void)manualLoginWithCompletion:(MmbLoginCompletion)completion{
    __weak __block typeof(self) blockSelf = self;
    self.loginViewController.loginCompletion = ^(BOOL success){
        blockSelf.isAuthenticating = NO;
        completion(success);
    };
    if (!self.isAuthenticating) {
        self.isAuthenticating = YES;
        [self clearAllSession];
        MmbAppDelegate *appDelegate = (MmbAppDelegate *)[UIApplication sharedApplication].delegate;
        UIWindow *window = appDelegate.window;
        if (!window.rootViewController.presentedViewController) {
            [window.rootViewController presentViewController:self.loginViewController animated:YES completion:nil];
        }
        self.isAuthenticating = NO;
    }
}


- (MmbLoginViewController *)loginViewController{
    if (!_loginViewController) {
        _loginViewController = [[MmbLoginViewController alloc] init];
    }
    return _loginViewController;
}

@end
