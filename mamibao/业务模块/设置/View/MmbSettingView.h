//
//  MmbSettingView.h
//  mamibao
//
//  Created by zhudong on 14/11/25.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MmbUserInfoItem.h"

@protocol MmbSettingViewDelegate <NSObject>

- (void)onclickUserInfoBtn;

@end

@interface MmbSettingView : NSObject

@property (nonatomic, weak) id<MmbSettingViewDelegate> delegate;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *userDescLabel;
@property (nonatomic, strong) UIButton *loginBtn;

- (UIView *)getTableHeaderView;

- (void)updateViewWithItem:(MmbUserInfoItem *)userItem;

@end
