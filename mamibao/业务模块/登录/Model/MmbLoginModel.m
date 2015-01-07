//
//  MmbLoginModel.m
//  mamibao
//
//  Created by zhudong on 14/11/19.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbLoginModel.h"
#import "MmbLoginItem.h"

@implementation MmbLoginModel

-(NSDictionary *)dataParams{
    return @{@"username":_username,@"password":_password};
}

-(NSDictionary *)systemParams{
    return @{@"v":@"1.0"};
}

-(NSString *)methodName{
    return @"mmb.user.login";
}

-(NSArray *)parseResponse:(id)JSON error:(NSError *__autoreleasing *)error{
    MmbLoginItem *loginItem = [[MmbLoginItem alloc] initWithDictionary:JSON];
    NSArray *itemList = [NSArray arrayWithObjects:loginItem, nil];
    return itemList;
}

-(BOOL)useAuth{
    return NO;
}

@end
