//
//  MmbStatusHandler.m
//  mamibao
//
//  Created by zhudong on 14-7-6.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbStatusHandler.h"

@implementation MmbStatusHandler

@synthesize statusInfo = _statusInfo;
@synthesize delegate = _delegate;


-(id)initWithStatusInfo:(MmbStatusInfo *)statusInfo delegate:(id<MmbStatusDelegate>)delegate{
    if (self = [super init]) {
        self.statusInfo = statusInfo;
        self.delegate = delegate;
    }
    return self;
}

@end
