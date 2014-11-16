//
//  MmbHomeViewController.m
//  mamibao
//
//  Created by zhudong on 14-7-29.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbHomeViewController.h"
#import "MmbHomeView.h"
#import "MmbHomeModel.h"
#import "MmbhomeItem.h"

@interface MmbHomeViewController ()

@property (nonatomic,strong) MmbHomeModel *homeModel;
@property (nonatomic,strong) MmbHomeView *homeView;

@end

@implementation MmbHomeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNaviView];
    [self setContainerView];
    [self registerModel:self.homeModel];
    [self loadData];
}


-(void)setNaviView{
    self.naviBar.centerBarItem = [MmbViewUtil simpleLabel:CGRectMake(0, 0, 100, 44) bf:24 tc:[UIColor whiteColor] t:@"XXX"];
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    settingBtn.frame = CGRectMake(0, 0, 32, 44);
    [settingBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [settingBtn addTarget:self action:@selector(settingAction) forControlEvents:UIControlEventTouchUpInside];
    [settingBtn setTitle:@"设置" forState:UIControlStateNormal];
    self.naviBar.rightBarItem = settingBtn;
}

-(void)setContainerView{
    self.tableView.frame = CGRectMake(0, self.naviBar.bottom, APP_CONTENT_WIDTH, APP_CONTENT_HEIGHT-44);
    self.tableView.backgroundColor = [UIColor clearColor];
    self.bNeedPullRefresh = YES;
    [self.view addSubview:self.tableView];
    
    self.tableView.tableHeaderView = [self.homeView getTableHeaderView];
    self.tableView.tableFooterView = [self.homeView getTableFooterView];
   
}

-(void)loadData{
//    if ([[MmbAuthenticateCenter shareInstance] isLogin]) {
        [self load];
//    }
}




-(void)settingAction{
    
}


#pragma mark - MmbViewController(SubClassing)
- (void)didLoadModel:(MmbModel*)model{
}

- (BOOL)canShowModel:(MmbModel*)model{
    return YES;
}

- (void)showEmpty:(MmbModel *)model{
}

- (void)showModel:(MmbModel *)model{
    //TODO 更新头部用户信息和各模块小标数量
    [super showModel:model];
    MmbHomeItem *item = [model.itemList objectAtIndex:0];
    [self.homeView updateViewWithItem:item];
}

- (void)showLoading:(MmbModel *)model{
    
}

- (void)showError:(NSError *)error withModel:(MmbModel*)model{
    
}

#pragma mark - model init
-(MmbHomeModel *)homeModel{
    if (!_homeModel) {
        _homeModel = [[MmbHomeModel alloc] init];
        _homeModel.key = @"MmbHomeModel";
    }
    return _homeModel;
}

-(MmbHomeView *)homeView{
    if (!_homeView) {
        _homeView = [[MmbHomeView alloc] init];
    }
    return _homeView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
