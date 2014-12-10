//
//  MmbHomeView.h
//  mamibao
//
//  Created by zhudong on 14-7-30.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MmbHomeItem.h"

@protocol MmbHomeViewDelegate <NSObject>

- (void)onclickUserInfoView;
- (void)onClickJiaoLiuView;

@end

@interface MmbHomeView : NSObject

@property (nonatomic, weak) id<MmbHomeViewDelegate> delegate;
@property (nonatomic,strong) UIImageView *iconView;
@property (nonatomic,strong) UILabel *userNameLabel;
@property (nonatomic,strong) UILabel *userDescLabel;
@property (nonatomic,strong) UIButton *loginBtn;

-(UIView *)getTableHeaderView;

-(UIView *)getTableFooterView;

-(void)updateViewWithItem:(MmbHomeItem *)homeItem;

@end
