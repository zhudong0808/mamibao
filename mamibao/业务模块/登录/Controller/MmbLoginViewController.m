//
//  MmbLoginViewController.m
//  mamibao
//
//  Created by zhudong on 14-9-30.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbLoginViewController.h"
#import "MmbLoginModel.h"
#import "MmbLoginItem.h"
#import "SFHFKeychainUtils.h"

@interface MmbLoginViewController ()

@property (nonatomic, strong) MmbLoginView *loginView;
@property (nonatomic, strong) MmbLoginModel *loginModel;

@end

@implementation MmbLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //默认非[self.navigationController.viewControllers count]==0的情况下，也就是vc堆栈中第一个时候不显示默认“返回”按钮的，登录页面用模态弹出，“返回”按钮相当于关闭，需要显示
    [self.naviBar setDefaultLeftBarItem];
    self.naviBar.centerBarItem = [MmbViewUtil simpleLabel:CGRectMake(0, 0, 100, 44) bf:24 tc:[UIColor whiteColor] t:@"登录"];
    
    _loginView = [[MmbLoginView alloc] initWithFrame:CGRectMake(0, self.naviBar.bottom, APP_CONTENT_WIDTH, APP_CONTENT_HEIGHT - 20 - 44)];
    _loginView.delegate = self;
    [self.view addSubview:_loginView];
    
    UIGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disableEditing)];
    [self.view addGestureRecognizer:gesture];
    
    [self registerModel:self.loginModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MmbViewController(SubClassing)
- (void)showLoading:(MmbModel *)model {
    [super showLoading:model];
    [self.statusHandler showLoadingViewInView:self.view frame:self.view.bounds];
}

- (void)showModel:(MmbModel *)model {
    [super showModel:model];
    MmbLoginItem *loginItem = (MmbLoginItem *)[model.itemList objectAtIndex:0];
    [SFHFKeychainUtils storeUsername:keyChainEncryptString andPassword:loginItem.sid forServiceName:keyChainServiceName updateExisting:YES error:nil];
    [MmbGlobal showProgressHUD:@"登录成功" duration:1.0];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationUserLoggedIn object:nil];
    
    if (self.loginCompletion) {
        self.loginCompletion(YES);
    }
    self.loginCompletion = nil;
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)showError:(NSError *)error withModel:(MmbModel *)model {
    [super showError:error withModel:model];
    [SFHFKeychainUtils deleteItemForUsername:keyChainEncryptString andServiceName:keyChainServiceName error:nil];
    [MmbGlobal showProgressHUD:error.localizedDescription duration:1.0];
}


#pragma mark - private methods
- (void)disableEditing {
    [_loginView.mobileTextField resignFirstResponder];
    [_loginView.passwordTextField resignFirstResponder];
}

#pragma mark - MmbCustomNaviBarViewDelegate
- (void)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    self.loginCompletion(NO);
}


#pragma mark - getter
- (MmbLoginModel *)loginModel {
    if (!_loginModel) {
        _loginModel = [[MmbLoginModel alloc] init];
        _loginModel.key = @"_loginModel_";
    }
    return _loginModel;
}


#pragma mark - MmbLoginViewDelegate
- (void)onClickFindPasswordBtn {
    //TODO
}

- (void)onClickRegisterBtn {
    //TODO
}

- (void)onClickSubmitBtn {
    self.loginModel.username = _loginView.mobileTextField.text;
    self.loginModel.password = _loginView.passwordTextField.text;
    [self load];
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
