//
//  MmbCustomNaviBarView.h
//  mamibao
//
//  Created by zhudong on 14-7-23.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MmbCustomNaviBarViewDelegate <NSObject>

@optional

-(void)backAction:(id)sender;

@end


@interface MmbCustomNaviBarView : UIView

/**
 *  导航条左边部分，默认为返回按钮
 */
@property (nonatomic,strong) UIView *leftBarItem;


/**
 *  导航条中间部分
 */
@property (nonatomic,strong) UIView *centerBarItem;


/**
 *  自定义导航的代理对象，强制为viewController
 */
@property (nonatomic,weak) UIViewController<MmbCustomNaviBarViewDelegate> *delegate;




@end
