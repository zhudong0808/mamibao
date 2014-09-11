//
//  MmbItemList.m
//  mamibao
//
//  Created by zhudong on 14-7-4.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbItemList.h"

@implementation MmbItemList

@synthesize array = _array;

+(id)array{
    return [[MmbItemList alloc] init];
}

-(void)reset{
    [self removeAllObjects];
    self.currentPage = 0;
    self.totalCount = 0;
}

#pragma mark -
#pragma mark Get

- (NSMutableArray *)array {
    if (!_array) {
        _array = [NSMutableArray array];
    }
    
    return _array;
}

#pragma mark - public method
-(void)removeAllObjects{
    [self.array removeAllObjects];
}

- (void)addObjectsFromArray:(NSArray *)otherArray{
    [self.array addObjectsFromArray:otherArray];
}

- (id)objectAtIndex:(NSUInteger)index{
    return  [self.array objectAtIndex:index];
}
@end
