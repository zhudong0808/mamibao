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
#import "ETUIKeyboardAccessoryView.h"

@interface MmbJiaoLiuDetailViewController ()

@property (nonatomic,strong) MmbJiaoLiuDetailModel *mmbJiaoLiuDetailModel;
@property (nonatomic,strong) MmbJiaoLiuDetailTableViewDataSource *tableViewDataSource;
@property (nonatomic,strong) MmbJiaoLiuDetailTableViewDelegate *tableViewDelegate;
@property (nonatomic,strong) MmbJiaoLiuDetailItem *subjectItem;
@property (nonatomic,strong) NSString *tid;
@property (nonatomic,strong) UIView *maskView;
@property (nonatomic,strong) ETUIKeyboardAccessoryView *replyView;
@property (nonatomic,strong) UITextView *replyTextView;

@end

@implementation MmbJiaoLiuDetailViewController


- (id)initWithTid:(NSString *)tid {
    if (self = [super init]) {
        _tid = tid;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.naviBar.centerBarItem = [MmbViewUtil simpleLabel:CGRectMake(0, 0, 100, kNaviBarHeight) bf:24 tc:[UIColor whiteColor] t:@"详情"];
    
    self.tableView.frame = CGRectMake(0, self.naviBar.bottom, APP_CONTENT_WIDTH, APP_CONTENT_HEIGHT-44-40);
    [self.view addSubview:self.tableView];
    
    MmbJiaoLiuDetailView *bottomView = [[MmbJiaoLiuDetailView alloc] initWithFrame:CGRectMake(0, APP_CONTENT_HEIGHT+20-40, APP_CONTENT_WIDTH, 40)];
    bottomView.delegate = self;
    [self.view addSubview:bottomView];
    
    [self maskView];
    [self replyView];
    
    //初始化代理
    self.dataSource = [self tableViewDataSource];
    self.delegate = [self tableViewDelegate];
    
    //注册Model
    [self registerModel:self.mmbJiaoLiuDetailModel];
    self.mmbJiaoLiuDetailModel.tid = _tid;
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
    //设置回复按钮操作
    _subjectItem = (MmbJiaoLiuDetailItem *)[model.itemList objectAtIndex:0];
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


#pragma mark - SubMethod
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath component:(NSDictionary *)bundle {
    __block __weak MmbJiaoLiuDetailViewController *blockSelf = self;
    [UIView animateWithDuration:0.3 animations:^(void){
        blockSelf.maskView.alpha = 1;
    }];
    _replyView.hidden = NO;
    [_replyTextView becomeFirstResponder];

}

#pragma mark - MmbJiaoLiuDetailViewDelegate
- (void)onClickReplyBtn {
    [self tableView:self.tableView didSelectRowAtIndexPath:nil component:@{@"tid":_subjectItem.tid,@"pid":@"",@"lou":_subjectItem.lou}];
}


#pragma mark - private
- (UIView *)maskView {
    if (!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_CONTENT_WIDTH, APP_SCREEN_HEIGHT)];
        _maskView.backgroundColor = HEXCOLORA(0x000000, 0.5);
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapMaskView)];
        [_maskView addGestureRecognizer:tapGesture];
        _maskView.alpha = 0;
        [self.view addSubview:_maskView];
    }
    return _maskView;
}

- (void)onTapMaskView {
    __block __weak MmbJiaoLiuDetailViewController *blockSelf = self;
    [UIView animateWithDuration:0.3 animations:^(void){
        blockSelf.maskView.alpha = 0;
        [blockSelf.replyTextView resignFirstResponder];
    }];
}

- (void)onClickCancelBtn {
    __block __weak MmbJiaoLiuDetailViewController *blockSelf = self;
    [UIView animateWithDuration:0.3 animations:^(void){
        blockSelf.maskView.alpha = 0;
        [blockSelf.replyTextView resignFirstResponder];
    }];
}

- (void)onClickSubmitBtn {
    
}

- (ETUIKeyboardAccessoryView *)replyView {
    
    if (!_replyView) {
        _replyView = [[ETUIKeyboardAccessoryView alloc] initWithFrame:CGRectMake(0, 0, APP_CONTENT_WIDTH, 100)];
        _replyView.hidden = YES;
        _replyView.backgroundColor = HEXCOLOR(0XFFFFFF);
        [_maskView addSubview:_replyView];
        
        
        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelBtn.frame = CGRectMake(20, 12, 40, 16);
        cancelBtn.backgroundColor = [UIColor clearColor];
        [cancelBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancelBtn setTitleColor:HEXCOLOR(0X99999) forState:UIControlStateNormal];
        [cancelBtn addTarget:self action:@selector(onClickCancelBtn) forControlEvents:UIControlEventTouchUpInside];
        [_replyView addSubview:cancelBtn];
        
        
        UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        submitBtn.frame = CGRectMake(APP_CONTENT_WIDTH - 20 - 40, 12, 40, 16);
        submitBtn.backgroundColor = [UIColor clearColor];
        [submitBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
        [submitBtn setTitle:@"发送" forState:UIControlStateNormal];
        [submitBtn setTitleColor:HEXCOLOR(0X999999) forState:UIControlStateNormal];
        [submitBtn addTarget:self action:@selector(onClickSubmitBtn) forControlEvents:UIControlEventTouchUpInside];
        [_replyView addSubview:submitBtn];
        
        _replyTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, cancelBtn.bottom+12, APP_CONTENT_WIDTH-2*20, 50)];
        _replyTextView.backgroundColor = HEXCOLOR(0Xf4f4f4);
        [_replyView addSubview:_replyTextView];
        
        
//        _replyTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100/2-20/2, APP_CONTENT_WIDTH-2*20, 20)];
//        _replyTextField.placeholder = @"请输入回复内容";
//        _replyTextField.backgroundColor = HEXCOLOR(0x111111);
//        [_replyView addSubview:_replyTextField];
    }
    return _replyView;
}
@end
