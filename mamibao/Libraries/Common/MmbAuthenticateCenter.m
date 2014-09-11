//
//  MmbAuthenticateCenter.m
//  mamibao
//
//  Created by zhudong on 14-7-30.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbAuthenticateCenter.h"
#import "SFHFKeychainUtils.h"

@implementation MmbAuthenticateCenter

+(MmbAuthenticateCenter *)shareInstance{
    static MmbAuthenticateCenter *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[MmbAuthenticateCenter alloc] init];
    });
    return instance;
}

+(BOOL)isLogin{
    NSString *password = [SFHFKeychainUtils getPasswordForUsername:keyChainEncryptString andServiceName:keyChainServiceName error:nil];
    if ([password length] > 0) {
        return YES;
    }
    return NO;
}



@end
