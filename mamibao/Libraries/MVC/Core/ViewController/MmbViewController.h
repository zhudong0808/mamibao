//
//  MmbViewController.h
//  mamibao
//
//  Created by zhudong on 14-7-6.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MmbModel.h"
#import "MmbStatusHandler.h"
#import "MmbCustomNaviBarView.h"

#define kNaviBarHeight 44

@interface MmbViewController : UIViewController<MmbModelDelegate,MmbStatusDelegate,MmbCustomNaviBarViewDelegate>

/**
 *  自定义NavigationBar
 */
@property (nonatomic,strong) MmbCustomNaviBarView *naviBar;


@property (nonatomic,strong) MmbStatusHandler *statusHandler;

/**
 *  注册到当前VC的model的集合
 */
@property (nonatomic,strong) NSMutableDictionary *modelDictInternal;


/**
 *  注册model
 *
 *  @param model model对象
 */
-(void)registerModel:(MmbModel *)model;


/**
 *  加载model数据
 */
-(void)load;

/**
 *  重新加载model数据
 */
-(void)reload;


@end

/**
 sub classing hooks
 */
@interface MmbViewController(Subclassing)

- (void)didLoadModel:(MmbModel*)model;

- (BOOL)canShowModel:(MmbModel*)model;

- (void)showEmpty:(MmbModel *)model;

- (void)showModel:(MmbModel *)model ;

- (void)showLoading:(MmbModel *)model;

- (void)showError:(NSError *)error withModel:(MmbModel*)model;


@end
