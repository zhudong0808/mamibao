//
//  MmbIndexModel.m
//  mamibao
//
//  Created by zhudong on 14-7-7.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbJiaoLiuModel.h"
#import "MmbJiaoLiuItem.h"

@implementation MmbJiaoLiuModel


-(NSDictionary *)dataParams{
    return @{@"offset":[NSNumber numberWithInteger:self.currentPageIndex*self.pageSize],@"limit":[NSNumber numberWithInteger:self.pageSize]};
}

-(NSDictionary *)systemParams{
    return @{@"v":@"1.0"};
}

-(NSString *)methodName{
    return @"mmb.forum.jiaoliu";
}

-(NSArray *)parseResponse:(id)JSON error:(NSError *__autoreleasing *)error{
    NSArray *itemList = [MmbJiaoLiuItem modelArrayWithJSON:[JSON objectForKey:@"list"]];
    return itemList;
}

@end
