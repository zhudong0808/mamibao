//
//  MmbTableViewController.m
//  mamibao
//
//  Created by zhudong on 14-7-6.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbTableViewController.h"

@interface MmbTableViewController ()

@end

@implementation MmbTableViewController

@synthesize dataSource = _dataSource;
@synthesize delegate = _delegate;
@synthesize bNeedPullRefresh = _bNeedPullRefresh;

#pragma mark - setters
-(void)setDataSource:(MmbTableViewDataSource *)dataSource{
    _dataSource = dataSource;
    _dataSource.controller = self;
    self.tableView.dataSource = dataSource;
}

-(void)setDelegate:(MmbTableViewDelegate *)delegate{
    _delegate = delegate;
    self.tableView.delegate = delegate;
}


-(void)setBNeedPullRefresh:(BOOL)bNeedPullRefresh{
    _bNeedPullRefresh = bNeedPullRefresh;
    if (bNeedPullRefresh == YES) {
        self.tableView.dataSource = self.dataSource;
        self.tableView.delegate = self.delegate;
        __weak typeof(self) weakSelf = self;
        [self.tableView addPullToRefreshWithActionHandler:^{
            [weakSelf reload];
        }];
    }
}

-(void)load{
    [super load];
}

-(void)reload{
    [self.dataSource removeAllItems];
    [self reloadTableView];
    [super reload];
}


#pragma mark - getters
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.opaque  = YES;
        _tableView.separatorStyle = NO;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.dataSource = nil;
        _tableView.delegate = nil;
    }
    return _tableView;
}

-(MmbTableViewDataSource *)dataSource{
    if (!_dataSource) {
        _dataSource = [[MmbTableViewDataSource alloc] init];
    }
    return _dataSource;
}

-(MmbTableViewDelegate *)delegate{
    if (!_delegate) {
        _delegate = [[MmbTableViewDelegate alloc] init];
    }
    return _delegate;
}


-(void)reloadTableView{
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.delegate;
    [self.tableView reloadData];
}


#pragma mark - MmbViewController(SubClassing)

/**
 *  showModel的前的预处理（datasource数据绑定）
 *
 *  @param model 请求Model
 */
-(void)didLoadModel:(MmbListModel *)model{
    [self.dataSource tableViewControllerDidLoadModel:model ForSection:model.section];
}


-(void)showModel:(MmbModel *)model{
    [super showModel:model];
    [self reloadTableView];
    [self endRefreshing];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)beginRefreshing{
    [self.tableView.pullToRefreshView startAnimating];
}

-(void)endRefreshing{
    [self.tableView.pullToRefreshView stopAnimating];
}

@end
