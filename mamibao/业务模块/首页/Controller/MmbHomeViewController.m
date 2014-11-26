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
#import "SFHFKeychainUtils.h"
#import "MmbSettingViewController.h"

@interface MmbHomeViewController ()

@property (nonatomic,strong) MmbHomeModel *homeModel;
@property (nonatomic,strong) MmbHomeView *homeView;

@end

@implementation MmbHomeViewController


- (id)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadData) name:kNotificationUserLoggedIn object:nil];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNaviView];
    [self setContainerView];
    [self registerModel:self.homeModel];
    [self loadData];
}


- (void)setNaviView {
    self.naviBar.leftBarItem = nil;
    self.naviBar.centerBarItem = [MmbViewUtil simpleLabel:CGRectMake(0, 0, 100, 44) bf:24 tc:[UIColor whiteColor] t:@"XXX"];
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    settingBtn.frame = CGRectMake(0, 0, 32, 44);
    [settingBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [settingBtn addTarget:self action:@selector(onClickSettingBtn) forControlEvents:UIControlEventTouchUpInside];
    [settingBtn setTitle:@"设置" forState:UIControlStateNormal];
    self.naviBar.rightBarItem = settingBtn;
}

- (void)setContainerView {
    self.tableView.frame = CGRectMake(0, self.naviBar.bottom, APP_CONTENT_WIDTH, APP_CONTENT_HEIGHT-44);
    self.tableView.backgroundColor = [UIColor clearColor];
    self.bNeedPullRefresh = YES;
    [self.view addSubview:self.tableView];
    
    self.tableView.tableHeaderView = [self.homeView getTableHeaderView];
    self.tableView.tableFooterView = [self.homeView getTableFooterView];
   
}

- (void)loadData {    
    if ([[MmbAuthenticateCenter shareInstance] isLogin]) {
        [self load];
    }
}

#pragma mark - private methods
- (void)onClickSettingBtn {
    if ([[MmbAuthenticateCenter shareInstance] isLogin]) {
        [self gotoSettingVC];
    } else {
        [[MmbAuthenticateCenter shareInstance] authenticateWithCompletion:^(BOOL success){
            if (success == YES) {
                [self gotoSettingVC];
            }
        }];
    }
    
}

- (void)gotoSettingVC {
    MmbSettingViewController *settingVC = [[MmbSettingViewController alloc] init];
    [self.navigationController pushViewController:settingVC animated:YES];
}


#pragma mark - MmbViewController(SubClassing)
- (void)didLoadModel:(MmbModel*)model{//不需要调用父类的方法进行数据绑定，所以此处重定义
}

- (BOOL)canShowModel:(MmbModel*)model{//不需要调用父类的方法进行section等的校验，所以此处重定义
    return YES;
}

- (void)showEmpty:(MmbModel *)model{
    [super showEmpty:model];
}

- (void)showModel:(MmbModel *)model{
    //TODO 更新头部用户信息和各模块小标数量
    [super showModel:model];
    MmbHomeItem *item = [model.itemList objectAtIndex:0];
    [self.homeView updateViewWithItem:item];
}

- (void)showLoading:(MmbModel *)model{//因为页面的显示内容非必须，所以不需要loading的页面
    [super showLoading:model];
}

- (void)showError:(NSError *)error withModel:(MmbModel*)model{
    [super showError:error withModel:model];
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
