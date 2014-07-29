//
//  MmbViewController.m
//  mamibao
//
//  Created by zhudong on 14-6-22.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbIndexViewController.h"
#import "MmbItem.h"
#import "MmbIndexModel.h"
#import "MmbIndexItem.h"
#import "MmbIndexTableViewDataSource.h"
#import "MmbIndexTableViewDelegate.h"

@interface MmbIndexViewController ()

@property (nonatomic,strong) MmbIndexModel *mmbIndexModel;
@property (nonatomic,strong) MmbIndexTableViewDataSource *tableViewDataSource;
@property (nonatomic,strong) MmbIndexTableViewDelegate *tableViewDelegate;

@end

@implementation MmbIndexViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView.frame = CGRectMake(0, self.naviBar.bottom, APP_CONTENT_WIDTH, APP_CONTENT_HEIGHT-44);
    [self.view addSubview:self.tableView];
    
    //初始化代理
    self.dataSource = [self tableViewDataSource];
    self.delegate = [self tableViewDelegate];
    
    //注册Model
    [self registerModel:self.mmbIndexModel];
    
    //发起请求
    [self load];
}

#pragma mark - MmbViewController(SubClassing)
- (void)didLoadModel:(MmbModel*)model{
    [super didLoadModel:model];
}

- (BOOL)canShowModel:(MmbModel*)model{
    return YES;
}

- (void)showEmpty:(MmbModel *)model{
    
}

- (void)showModel:(MmbModel *)model{
    [super showModel:model];
}

- (void)showLoading:(MmbModel *)model{
    
}

- (void)showError:(NSError *)error withModel:(MmbModel*)model{
    
}


#pragma mark - gettters
-(MmbIndexTableViewDataSource *)tableViewDataSource{
    if (!_tableViewDataSource) {
        _tableViewDataSource = [[MmbIndexTableViewDataSource alloc]init];
    }
    return _tableViewDataSource;
}

-(MmbIndexTableViewDelegate *)tableViewDelegate{
    if (!_tableViewDelegate) {
        _tableViewDelegate = [[MmbIndexTableViewDelegate alloc] init];
    }
    return _tableViewDelegate;
}

-(MmbIndexModel *)mmbIndexModel{
    if (!_mmbIndexModel) {
        _mmbIndexModel = [[MmbIndexModel alloc] init];
        _mmbIndexModel.key = @"MmbIndexModel";
    }
    return _mmbIndexModel;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
