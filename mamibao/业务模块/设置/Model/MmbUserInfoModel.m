//
//  MmbSettingModel.m
//  mamibao
//
//  Created by zhudong on 14/11/25.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbUserInfoModel.h"
#import "MmbUserInfoItem.h"

@implementation MmbUserInfoModel

-(NSDictionary *)dataParams{
    return nil;
}

-(NSDictionary *)systemParams{
    return @{@"v":@"1.0"};
}

-(NSString *)methodName{
    return @"mmb.userInfo";
}

-(NSArray *)parseResponse:(id)JSON error:(NSError *__autoreleasing *)error{
    MmbUserInfoItem *userItem = [[MmbUserInfoItem alloc] initWithDictionary:JSON];
    NSArray *itemList = [NSArray arrayWithObjects:userItem, nil];
    return itemList;
}

-(BOOL)useAuth{
    return YES;
}

@end
