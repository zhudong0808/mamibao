//
//  MmbItem.m
//  mamibao
//
//  Created by zhudong on 14-7-1.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbItem.h"

@implementation MmbItem


-(id)initWithDictionary:(NSMutableDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"WARNING: Set value for undefiend key %s", [key UTF8String]);
}

- (void)setNilValueForKey:(NSString *)key
{
    NSLog(@"WARNING: Set nil value for key %s",  [key UTF8String]);
}

- (id)valueForUndefinedKey:(NSString *)key {
    NSLog(@"WARNING: Get value for undefiend key %s", [key UTF8String]);
    return nil;
}

+ (id)modelWithJSON:(NSDictionary *)json {
    return [[[self class] alloc] initWithDictionary:json];
}

+ (id)modelArrayWithJSON:(NSArray *)jsonArray {
    Class cls = [self class];
    NSMutableArray *ret = [[NSMutableArray alloc] initWithCapacity:[jsonArray count]];
    
    for (NSDictionary *dict in jsonArray) {
        [ret addObject:[cls modelWithJSON:dict]];
    }
    
    return ret;
}

@end
