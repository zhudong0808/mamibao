//
//  MmbIndexModel.m
//  mamibao
//
//  Created by zhudong on 14-7-7.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbIndexModel.h"
#import "MmbIndexItem.h"

@implementation MmbIndexModel


-(NSDictionary *)dataParams{
    return @{@"action":@"list",@"type":@"516",@"vieworder":@"lastpost"};
}

-(NSDictionary *)systemParams{
    return @{@"methodName":@"testMethod"};
}

-(NSString *)methodName{
    return @"testMethod";
}

-(NSArray *)parseResponse:(id)JSON error:(NSError *__autoreleasing *)error{
    NSArray *itemList = [MmbIndexItem modelArrayWithJSON:[JSON objectForKey:@"info"]];
    return itemList;
}

@end
