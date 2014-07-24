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

@interface MmbIndexViewController ()

@property (nonatomic,strong) MmbIndexModel *mmbIndexModel;

@end

@implementation MmbIndexViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(0, self.naviBar.bottom, 320, 20)];
    testView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:testView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    [label setFont:[UIFont systemFontOfSize:20]];
    label.text = @"哈哈";
    [testView addSubview:label];
    
//    [self registerModel:self.mmbIndexModel];
//    
//    [self load];
}

-(MmbIndexModel *)mmbIndexModel{
    if (!_mmbIndexModel) {
        _mmbIndexModel = [[MmbIndexModel alloc] init];
        _mmbIndexModel.key = @"MmbIndexModel";
    }
    return _mmbIndexModel;
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
}

- (void)showLoading:(MmbModel *)model{
    
}

- (void)showError:(NSError *)error withModel:(MmbModel*)model{
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
