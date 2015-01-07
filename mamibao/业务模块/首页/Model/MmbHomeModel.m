//
//  MmbHomeModel.m
//  mamibao
//
//  Created by zhudong on 14-7-30.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbHomeModel.h"
#import "MmbHomeItem.h"

@implementation MmbHomeModel

-(NSDictionary *)dataParams{
    return nil;
}

-(NSDictionary *)systemParams{
    return @{@"v":@"1.0"};
}

-(NSString *)methodName{
    return @"mmb.common.home";
}

-(NSArray *)parseResponse:(id)JSON error:(NSError *__autoreleasing *)error{
    MmbHomeItem *homeItem = [[MmbHomeItem alloc] initWithDictionary:JSON];
    NSArray *itemList = [NSArray arrayWithObjects:homeItem, nil];
    return itemList;
}

-(BOOL)useAuth{
    return YES;
}


@end
