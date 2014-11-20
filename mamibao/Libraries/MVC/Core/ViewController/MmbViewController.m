//
//  MmbViewController.m
//  mamibao
//
//  Created by zhudong on 14-7-6.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbViewController.h"
#import "MmbCustomNaviBarView.h"

@interface MmbViewController ()

@end

@implementation MmbViewController

@synthesize statusHandler = _statusHandler;
@synthesize modelDictInternal = _modelDictInternal;
@synthesize naviBar = _naviBar;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBCOLOR(0xff, 0xf9, 0xf8);
    
    _modelDictInternal = [[NSMutableDictionary alloc]init];
    
    //初始化naviBar
    _naviBar = [[MmbCustomNaviBarView alloc] initWithFrame:CGRectMake(0, 0, APP_CONTENT_WIDTH, isIOS7 ? 64 : 44)];
    _naviBar.delegate = self;
    
    [self.view addSubview:_naviBar];
    
    //配置是否显示返回按钮
    if ([self.navigationController.viewControllers count] == 0) {
        _naviBar.leftBarItem = nil;
    }
}


#pragma mark - public method
-(void)registerModel:(MmbModel *)model{
    model.delegate = self;
    [_modelDictInternal setObject:model forKey:model.key];
}


-(void)load{
    [_modelDictInternal enumerateKeysAndObjectsUsingBlock:^(id key,id obj,BOOL *stop){
        MmbModel *model = (MmbModel *)obj;
        dispatch_async(dispatch_get_main_queue(), ^{
            [model load];
        });
    }];
}

-(void)reload{
    [_modelDictInternal enumerateKeysAndObjectsUsingBlock:^(id key,id obj,BOOL *stop){
        MmbModel *model = (MmbModel *)obj;
        dispatch_async(dispatch_get_main_queue(), ^{
            [model reload];
        });
    }];
}


#pragma mark - MmbModelDelegate

-(void)modelDidStart:(MmbModel *)model{
    [self showLoading:model];
}

-(void)modeldidFinish:(MmbModel *)model{
    [self didLoadModel:model];
    if ([self canShowModel:model]) {
        [self showModel:model];
    } else {
        [self showEmpty:model];
    }
}

-(void)modeldidFail:(MmbModel *)model withError:(NSError *)error{
    [self showError:error withModel:model];
}


#pragma mark - MmbViewController(SubClassing)
- (void)didLoadModel:(MmbModel*)model{

}

- (BOOL)canShowModel:(MmbModel*)model{
    return YES;
}

- (void)showEmpty:(MmbModel *)model{
    [self.statusHandler removeStatusViewFromView:self.view];
}

- (void)showModel:(MmbModel *)model{
    [self.statusHandler removeStatusViewFromView:self.view];
}

- (void)showLoading:(MmbModel *)model{
    [self.statusHandler removeStatusViewFromView:self.view];
}

- (void)showError:(NSError *)error withModel:(MmbModel*)model{
    
    [self.statusHandler removeStatusViewFromView:self.view];
}

#pragma mark - MmbStatusHandler singleton
-(MmbStatusHandler *)statusHandler{
    if (!_statusHandler) {
        _statusHandler = [[MmbStatusHandler alloc] initWithStatusInfo:[[MmbStatusInfo alloc]init] delegate:self];
    }
    return _statusHandler;
}


#pragma makr - MmbCustomNaviBarViewDelegate
-(void)backAction:(id)sender{
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
