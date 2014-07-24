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
    return @{@"methodName":@"testMethod"};
}

-(NSDictionary *)systemParams{
    return @{@"methodName":@"testMethod"};
}

-(NSString *)methodName{
    return @"testMethod";
}

-(NSArray *)parseResponse:(id)JSON error:(NSError *__autoreleasing *)error{
    MmbIndexItem *item = [MmbIndexItem modelWithJSON:JSON];
    NSArray *itemList = [NSArray arrayWithObjects:item, nil];
    return itemList;
}

@end
