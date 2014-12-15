//
//  MmbTableViewDelegate.m
//  mamibao
//
//  Created by zhudong on 14-7-29.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbTableViewDelegate.h"
#import "MmbTableViewDataSource.h"
#import "MmbTableViewItem.h"
#import "MmbTableViewCell.h"
#import "MmbTableViewController.h"


@implementation MmbTableViewDelegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Class cls;
    
    if ([tableView.dataSource isKindOfClass:[MmbTableViewDataSource class]]) {
        MmbTableViewDataSource *dataSource = (MmbTableViewDataSource *)tableView.dataSource;
        MmbTableViewItem *item = [dataSource itemForCellAtIndexPath:indexPath];
        if (item.itemHeight > 0) {
            return item.itemHeight;
        } else {
            cls = [dataSource cellClassForItem:item AtIndex:indexPath];
            if ([cls isSubclassOfClass:[MmbTableViewCell class]]) {
                return [cls tableView:tableView variantRowHeightForItem:item AtIndex:indexPath];
            } else {
                return 44;
            }
        }
    } else {
        return 44;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    MmbTableViewDataSource *dataSource = (MmbTableViewDataSource *)tableView.dataSource;
    NSArray *items = dataSource.itemsForSection[@(indexPath.section)];
    if (items.count-1 == indexPath.row) {
        [self.controller loadMore];
    }
}

@end
