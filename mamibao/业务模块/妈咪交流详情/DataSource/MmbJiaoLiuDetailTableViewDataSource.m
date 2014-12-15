//
//  MmbIndexTableViewDataSource.m
//  mamibao
//
//  Created by zhudong on 14-7-29.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//


#import "MmbJiaoLiuDetailTableViewDataSource.h"
#import "MmbJiaoLiuDetailSubjectTableViewCell.h"
#import "MmbJiaoLiuDetailReplyTableViewCell.h"
#import "MmbJiaoliuDetailItem.h"

@class MmbTableViewItem;

@implementation MmbJiaoLiuDetailTableViewDataSource

- (Class)cellClassForItem:(MmbTableViewItem*)item AtIndex:(NSIndexPath *)indexPath{
    MmbJiaoLiuDetailItem *detailItem = (MmbJiaoLiuDetailItem *)item;
    if ([detailItem.tid length] > 0 && [detailItem.pid length] == 0) {
        return [MmbJiaoLiuDetailSubjectTableViewCell class];
    } else {
        return [MmbJiaoLiuDetailReplyTableViewCell class];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
@end
