//
//  MmbListModel.m
//  mamibao
//
//  Created by zhudong on 14-7-29.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbListModel.h"

@implementation MmbListModel

-(id)init{
    if (self = [super init]) {
        self.pageSize = 20; // 默认
    }
    return self;
}

- (BOOL)parse:(id)JSON {
    
    NSError *error = nil;
    
    NSArray *list = [self parseResponse:JSON error:&error];
    if (error) {
        [self requestDidFailWithError:error];
    } else {
        [self.itemList addObjectsFromArray:list];
    }
    
    _hasMore = list.count > 0;
    
    return YES;
    
}


- (void)reload
{
    self.currentPageIndex = 0;
    [super reload];
}

- (void)loadMore {
    if (_hasMore) {
        self.currentPageIndex += 1;
        [super loadMore];
    }
}


@end
