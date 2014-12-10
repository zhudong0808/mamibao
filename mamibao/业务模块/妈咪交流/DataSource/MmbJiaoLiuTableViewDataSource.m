//
//  MmbIndexTableViewDataSource.m
//  mamibao
//
//  Created by zhudong on 14-7-29.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//


#import "MmbJiaoLiuTableViewDataSource.h"
#import "MmbJiaoLiuTableViewCell.h"

@class MmbTableViewItem;

@implementation MmbJiaoLiuTableViewDataSource

- (Class)cellClassForItem:(MmbTableViewItem*)item AtIndex:(NSIndexPath *)indexPath{
    return [MmbJiaoLiuTableViewCell class];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
@end
