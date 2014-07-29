//
//  MmbIndexTableViewDataSource.m
//  mamibao
//
//  Created by zhudong on 14-7-29.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//


#import "MmbIndexTableViewDataSource.h"
#import "MmbIndexTableViewCell.h"

@class MmbTableViewItem;

@implementation MmbIndexTableViewDataSource

- (Class)cellClassForItem:(MmbTableViewItem*)item AtIndex:(NSIndexPath *)indexPath{
    return [MmbIndexTableViewCell class];
}

@end
