//
//  MmbTableViewItem.m
//  mamibao
//
//  Created by zhudong on 14-7-2.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbTableViewItem.h"

@implementation MmbTableViewItem

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:@(self.itemHeight) forKey:@"itemHeight"];
}


- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.itemHeight = ((NSNumber *)[aDecoder decodeObjectForKey:@"itemHeight"]).floatValue;
    }
    return self;
}

@end
