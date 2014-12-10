//
//  MmbStatusInfo.m
//  mamibao
//
//  Created by zhudong on 14-7-6.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbStatusInfo.h"

@implementation MmbStatusInfo

- (NSString *)titleForEmpty {
    return @"暂时没有数据";
}

- (NSString *)subTitleForEmpty{
    return nil;
}

- (NSString *)actionButtonTitleForEmpty {
    return nil;
}

- (UIImage *)imageForEmpty {
    return [UIImage imageNamed:@"LLDefaultFailure"];
}


@end
