//
//  MmbViewController.m
//  mamibao
//
//  Created by zhudong on 14-6-22.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbJiaoLiuDetailViewController.h"
#import "MmbItem.h"
#import "MmbJiaoLiuDetailModel.h"
#import "MmbJiaoLiuDetailItem.h"
#import "MmbJiaoLiuDetailTableViewDataSource.h"
#import "MmbJiaoLiuDetailTableViewDelegate.h"

@interface MmbJiaoLiuDetailViewController ()

@property (nonatomic,strong) MmbJiaoLiuDetailModel *mmbJiaoLiuDetailModel;
@property (nonatomic,strong) MmbJiaoLiuDetailTableViewDataSource *tableViewDataSource;
@property (nonatomic,strong) MmbJiaoLiuDetailTableViewDelegate *tableViewDelegate;

@end

@implementation MmbJiaoLiuDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.naviBar.centerBarItem = [MmbViewUtil simpleLabel:CGRectMake(0, 0, 100, kNaviBarHeight) bf:24 tc:[UIColor whiteColor] t:@"详情"];
    
    self.tableView.frame = CGRectMake(0, self.naviBar.bottom, APP_CONTENT_WIDTH, APP_CONTENT_HEIGHT-44);
    [self.view addSubview:self.tableView];
    
    //初始化代理
    self.dataSource = [self tableViewDataSource];
    self.delegate = [self tableViewDelegate];
    
    //注册Model
    [self registerModel:self.mmbJiaoLiuDetailModel];
    self.keyModel = self.mmbJiaoLiuDetailModel;
    
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
-(MmbJiaoLiuDetailTableViewDataSource *)tableViewDataSource{
    if (!_tableViewDataSource) {
        _tableViewDataSource = [[MmbJiaoLiuDetailTableViewDataSource alloc]init];
    }
    return _tableViewDataSource;
}

-(MmbJiaoLiuDetailTableViewDelegate *)tableViewDelegate{
    if (!_tableViewDelegate) {
        _tableViewDelegate = [[MmbJiaoLiuDetailTableViewDelegate alloc] init];
    }
    return _tableViewDelegate;
}

-(MmbJiaoLiuDetailModel *)mmbJiaoLiuDetailModel{
    if (!_mmbJiaoLiuDetailModel) {
        _mmbJiaoLiuDetailModel = [[MmbJiaoLiuDetailModel alloc] init];
        _mmbJiaoLiuDetailModel.key = @"MmbJiaoLiuDetailModel";
    }
    return _mmbJiaoLiuDetailModel;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
