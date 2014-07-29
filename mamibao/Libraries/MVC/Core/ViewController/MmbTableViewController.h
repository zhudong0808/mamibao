//
//  MmbTableViewController.h
//  mamibao
//
//  Created by zhudong on 14-7-6.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbViewController.h"
#import "UIScrollView+SVPullToRefresh.h"
#import "MmbTableViewDataSource.h"
#import "MmbTableViewDelegate.h"

@interface MmbTableViewController : MmbViewController

/**
 *  tableView
 */
@property (nonatomic,strong) UITableView *tableView;



/**
 *  tableView delegate
 */
@property (nonatomic,strong) MmbTableViewDelegate *delegate;


/**
 *  tableView dataSource
 */
@property (nonatomic,strong) MmbTableViewDataSource *dataSource;

/**
 *  是否需要下拉刷新
 */
@property (nonatomic,assign) BOOL bNeedPullRefresh;


/**
 *  重新加载
 */
-(void)reload;

@end
