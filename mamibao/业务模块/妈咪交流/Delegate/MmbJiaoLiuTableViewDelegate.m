//
//  MmbIndexTableViewDelegate.m
//  mamibao
//
//  Created by zhudong on 14-7-29.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbJiaoLiuTableViewDelegate.h"
#import "MmbJiaoLiuDetailViewController.h"

@implementation MmbJiaoLiuTableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MmbJiaoLiuDetailViewController *vc = [[MmbJiaoLiuDetailViewController alloc] init];
    [self.controller.navigationController pushViewController:vc animated:YES];
}

@end
