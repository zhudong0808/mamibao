//
//  MmbSettingViewController.m
//  mamibao
//
//  Created by zhudong on 14/11/25.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbMeViewController.h"
#import "UIScrollView+SVPullToRefresh.h"
#import "MmbUserInfoModel.h"
#import "MmbUserInfoItem.h"

@interface MmbMeViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MmbMeView *meView;
@property (nonatomic, strong) MmbUserInfoModel *userInfoModel;

@end

@implementation MmbMeViewController

- (id)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doLoginOut) name:kNotificationUserLoggedOut object:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviView];
    [self setContainerView];
    [self registerModel:self.userInfoModel];
    [self load];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - MmbViewController(SubClassing)
- (void)showEmpty:(MmbModel *)model{
    [self.tableView.pullToRefreshView stopAnimating];
    [super showEmpty:model];
}

- (void)showModel:(MmbModel *)model{
    [self.tableView.pullToRefreshView stopAnimating];
    [super showModel:model];
    MmbUserInfoItem *item = [model.itemList objectAtIndex:0];
    [self.meView updateViewWithItem:item];
}

- (void)showLoading:(MmbModel *)model{
    [super showLoading:model];
    [self.statusHandler showLoadingViewInView:self.view frame:self.view.bounds];
}

- (void)showError:(NSError *)error withModel:(MmbModel*)model{
    [self.tableView.pullToRefreshView stopAnimating];
    [super showError:error withModel:model];
    [MmbGlobal showProgressHUD:error.localizedDescription duration:1.0];
}

#pragma mark - private method
- (void)setNaviView {
    self.naviBar.centerBarItem = [MmbViewUtil simpleLabel:CGRectMake(0, 0, 100, kNaviBarHeight) bf:24 tc:[UIColor whiteColor] t:@"我"];
}

- (void)setContainerView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.naviBar.bottom, APP_CONTENT_WIDTH, APP_CONTENT_HEIGHT-44) style:UITableViewStylePlain];
    _tableView.separatorStyle = NO;
    _tableView.backgroundColor = HEXCOLOR(0xfff9f8);
    __weak typeof(self) weakSelf = self;
    [_tableView addPullToRefreshWithActionHandler:^{
        [weakSelf reload];
    }];
    [self.view addSubview:_tableView];
    
    _tableView.tableHeaderView = [self.meView getTableHeaderView];
}

- (MmbMeView *)meView {
    if (!_meView) {
        _meView = [[MmbMeView alloc] init];
        _meView.delegate = self;
    }
    return _meView;
}

- (MmbUserInfoModel *)userInfoModel {
    if (!_userInfoModel) {
        _userInfoModel = [[MmbUserInfoModel alloc] init];
        _userInfoModel.key = @"userInfoModel";
    }
    return _userInfoModel;
}

#pragma mark - delegate
- (void)onClickLoginoutBtn {
    [[MmbAuthenticateCenter shareInstance] clearAllSession];
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationUserLoggedOut object:nil];
    [[MmbAuthenticateCenter shareInstance] authenticateWithCompletion:^(BOOL success){
        if (success == YES) {
            [self load];
        }
    }];
}

- (void)onClickUserInfoBtn {
    [[MmbAuthenticateCenter shareInstance] clearAllSession];
    [[MmbAuthenticateCenter shareInstance] authenticateWithCompletion:^(BOOL success){
        if (success == YES) {
            [self load];
        }
    }];
}

- (void)doLoginOut {
    [self.meView.iconView sd_setImageWithURL:[NSURL URLWithString:nil] placeholderImage:[UIImage imageNamed:@"defaultIcon.png"]];
    self.meView.userNameLabel.text = @"";
    self.meView.userDescLabel.text = @"";
    self.meView.loginoutBtn.hidden = YES;
    self.meView.loginBtn.hidden = NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
