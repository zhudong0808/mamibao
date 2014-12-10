//
//  MmbTableViewCell.m
//  mamibao
//
//  Created by zhudong on 14-7-2.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbTableViewCell.h"

@implementation MmbTableViewCell

////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - public methods

+ (CGFloat)tableView:(UITableView*)tableView variantRowHeightForItem:(id)item AtIndex:(NSIndexPath*)indexPath
{
    return 44;
}

@end
