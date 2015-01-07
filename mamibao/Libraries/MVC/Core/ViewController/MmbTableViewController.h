//
//  MmbTableViewController.h
//  mamibao
//
//  Created by zhudong on 14-7-6.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbViewController.h"
#import "UIScrollView+SVPullToRefresh.h"
#import "MmbListModel.h"



@class MmbTableViewDataSource;
@class MmbTableViewDelegate;

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
 *  用来翻页的model，必须不为空
 */
@property (nonatomic, strong) MmbListModel *keyModel;

/**
 *  是否需要下拉刷新
 */
@property (nonatomic,assign) BOOL bNeedPullRefresh;


/**
 *  重新加载
 */
- (void)reload;

/**
 *  加载更多
 */
- (void)loadMore;

@end

@interface MmbTableViewController(UITableView)

/**
 * tableview cell的点击事件
 */
- (void)tableView:(UITableView *)tableView  didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
/**
 * tableview cell的UI组件点击，bunlde中存放了自定义的参数
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath component:(NSDictionary*)bundle;


@end
