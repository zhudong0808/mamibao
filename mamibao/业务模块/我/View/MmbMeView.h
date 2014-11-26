//
//  MmbSettingView.h
//  mamibao
//
//  Created by zhudong on 14/11/25.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MmbUserInfoItem.h"

@protocol MmbMeViewDelegate <NSObject>

- (void)onClickLoginoutBtn;
- (void)onClickUserInfoBtn;

@end

@interface MmbMeView : NSObject

@property (nonatomic, weak) id<MmbMeViewDelegate> delegate;

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *userDescLabel;
@property (nonatomic, strong) UIButton *loginoutBtn;
@property (nonatomic, strong) UIButton *loginBtn;

- (UIView *)getTableHeaderView;

- (void)updateViewWithItem:(MmbUserInfoItem *)userItem;

@end
