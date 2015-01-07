//
//  MmbViewController.m
//  mamibao
//
//  Created by zhudong on 14-6-22.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbJiaoLiuViewController.h"
#import "MmbItem.h"
#import "MmbJiaoLiuModel.h"
#import "MmbJiaoLiuItem.h"
#import "MmbJiaoLiuTableViewDataSource.h"
#import "MmbJiaoLiuTableViewDelegate.h"
#import "MmbJiaoLiuDetailViewController.h"

@interface MmbJiaoLiuViewController ()

@property (nonatomic,strong) MmbJiaoLiuModel *mmbJiaoLiuModel;
@property (nonatomic,strong) MmbJiaoLiuTableViewDataSource *tableViewDataSource;
@property (nonatomic,strong) MmbJiaoLiuTableViewDelegate *tableViewDelegate;

@end

@implementation MmbJiaoLiuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.naviBar.centerBarItem = [MmbViewUtil simpleLabel:CGRectMake(0, 0, 100, kNaviBarHeight) bf:24 tc:[UIColor whiteColor] t:@"妈咪交流"];
    
    self.tableView.frame = CGRectMake(0, self.naviBar.bottom, APP_CONTENT_WIDTH, APP_CONTENT_HEIGHT-44);
    [self.view addSubview:self.tableView];
    
    //初始化代理
    self.dataSource = [self tableViewDataSource];
    self.delegate = [self tableViewDelegate];
    
    //注册Model
    [self registerModel:self.mmbJiaoLiuModel];
    self.keyModel = self.mmbJiaoLiuModel;
    
    self.bNeedPullRefresh = YES;
    
    //发起请求
    [self load];
}

#pragma mark - MmbViewController(SubClassing)
- (void)didLoadModel:(MmbModel*)model{
    [super didLoadModel:model];
}

- (void)showEmpty:(MmbModel *)model{
    [super showEmpty:model];
    [self.statusHandler showEmptyViewInView:self.tableView frame:self.tableView.bounds];
}

- (void)showModel:(MmbModel *)model{
    [super showModel:model];
}

- (void)showLoading:(MmbModel *)model{
    
}

- (void)showError:(NSError *)error withModel:(MmbModel*)model{
    
}


#pragma mark - gettters
-(MmbJiaoLiuTableViewDataSource *)tableViewDataSource{
    if (!_tableViewDataSource) {
        _tableViewDataSource = [[MmbJiaoLiuTableViewDataSource alloc]init];
    }
    return _tableViewDataSource;
}

-(MmbJiaoLiuTableViewDelegate *)tableViewDelegate{
    if (!_tableViewDelegate) {
        _tableViewDelegate = [[MmbJiaoLiuTableViewDelegate alloc] init];
    }
    return _tableViewDelegate;
}

-(MmbJiaoLiuModel *)mmbJiaoLiuModel{
    if (!_mmbJiaoLiuModel) {
        _mmbJiaoLiuModel = [[MmbJiaoLiuModel alloc] init];
        _mmbJiaoLiuModel.key = @"MmbJiaoLiuModel";
    }
    return _mmbJiaoLiuModel;
}


#pragma mark -subMethods
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    MmbJiaoLiuTableViewDataSource *dataSource = (MmbJiaoLiuTableViewDataSource *)tableView.dataSource;
    MmbJiaoLiuItem *item = (MmbJiaoLiuItem *)[dataSource itemForCellAtIndexPath:indexPath];
    MmbJiaoLiuDetailViewController *vc = [[MmbJiaoLiuDetailViewController alloc] initWithTid:item.tid];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
