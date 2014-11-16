//
//  MmbLoginViewController.m
//  mamibao
//
//  Created by zhudong on 14-9-30.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbLoginViewController.h"
#import "MmbLoginView.h"

@interface MmbLoginViewController ()

@end

@implementation MmbLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //默认非[self.navigationController.viewControllers count]==0的情况下，也就是vc堆栈中第一个时候不显示默认“返回”按钮的，登录页面用模态弹出，“返回”按钮相当于关闭，需要显示
    [self.naviBar setDefaultLeftBarItem];
    self.naviBar.centerBarItem = [MmbViewUtil simpleLabel:CGRectMake(0, 0, 100, 44) bf:24 tc:[UIColor whiteColor] t:@"登录"];
    
    MmbLoginView *loginView = [[MmbLoginView alloc] initWithFrame:CGRectMake(0, self.naviBar.bottom, APP_CONTENT_WIDTH, APP_CONTENT_HEIGHT - 20)];
    [self.view addSubview:loginView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MmbCustomNaviBarViewDelegate
-(void)backAction:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
    self.loginCompletion(NO);
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
