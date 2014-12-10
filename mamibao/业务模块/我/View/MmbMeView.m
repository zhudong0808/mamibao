//
//  MmbSettingView.m
//  mamibao
//
//  Created by zhudong on 14/11/25.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbMeView.h"


#define kCellPitch 10

@interface MmbMeView(){

}

@end

@implementation MmbMeView

- (UIView *)getTableHeaderView {
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_CONTENT_WIDTH, APP_CONTENT_HEIGHT - 44)];
    containerView.backgroundColor = [UIColor clearColor];
    
    UIButton *userInfoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    userInfoBtn.frame = CGRectMake(0, kCellPitch, APP_CONTENT_WIDTH, 80);
    userInfoBtn.backgroundColor = [UIColor whiteColor];
    [userInfoBtn addTarget:self action:@selector(onClickUserInfoBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [containerView addSubview:userInfoBtn];
    
    [MmbViewUtil drawLine:CGRectMake(0, 0, APP_CONTENT_WIDTH, 0.5) onView:userInfoBtn color:HEXCOLOR(0xdddddd)];
    
    //头像
    _iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"defaultIcon"]];
    _iconView.frame = CGRectMake(15, 10, 60, 60);
    [userInfoBtn addSubview:_iconView];
    
    //用户名称
    _userNameLabel = [MmbViewUtil simpleLabel:CGRectMake(_iconView.right+10, 15, 200, 20) f:15 tc:RGBCOLOR(0x00, 0x00, 0x00) t:@""];
    [userInfoBtn addSubview:_userNameLabel];
    
    //用户描述
    _userDescLabel = [MmbViewUtil simpleLabel:CGRectMake(_userNameLabel.left, _userNameLabel.bottom+5, 200, 30) f:12 tc:RGBCOLOR(0x99, 0x99, 0x99) t:@""];
    _userDescLabel.numberOfLines = 2;
    [userInfoBtn addSubview:_userDescLabel];
    
    //登录按钮
    _loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(_iconView.right+15, _iconView.top + (60/2-30/2), 90, 30)];
    _loginBtn.backgroundColor = [UIColor clearColor];
    _loginBtn.layer.borderColor = HEXCOLOR(0xe33125).CGColor;
    _loginBtn.layer.borderWidth = 1;
    _loginBtn.layer.cornerRadius = 2;
    _loginBtn.hidden = YES;
    [_loginBtn addTarget:self action:@selector(onClickUserInfoBtn) forControlEvents:UIControlEventTouchUpInside];
    [userInfoBtn addSubview:_loginBtn];
    
    UILabel *loginBtnLabel = [MmbViewUtil simpleLabel:CGRectMake(90/2-60/2, 30/2-14/2, 60, 14) f:14 tc:HEXCOLOR(0xe33125) t:@"立即登录"];
    loginBtnLabel.textAlignment = NSTextAlignmentCenter;
    loginBtnLabel.backgroundColor = [UIColor clearColor];
    [_loginBtn addSubview:loginBtnLabel];
    
    [MmbViewUtil drawLine:CGRectMake(0, 80-0.5, APP_CONTENT_WIDTH, 0.5) onView:userInfoBtn color:HEXCOLOR(0xdddddd)];

    
    UIView *otherBtnView = [[UIView alloc] initWithFrame:CGRectMake(0, userInfoBtn.bottom + kCellPitch, APP_CONTENT_WIDTH, 45*3)];
    otherBtnView.backgroundColor = [UIColor whiteColor];
    [containerView addSubview:otherBtnView];
    
    UIButton *jiluBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    jiluBtn.frame = CGRectMake(0, 0, APP_CONTENT_WIDTH, 45);
    [otherBtnView addSubview:jiluBtn];
    [MmbViewUtil drawLine:CGRectMake(0, 0, APP_CONTENT_WIDTH, 0.5) onView:jiluBtn color:HEXCOLOR(0xdddddd)];
    UIImageView *jiluImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jilu"]];
    jiluImageView.frame = CGRectMake(20, 45/2-30/2, 30, 30);
    [jiluBtn addSubview:jiluImageView];
    UILabel *jiluTitle = [MmbViewUtil simpleLabel:CGRectMake(jiluImageView.right + 15, 45/2-16/2, 70, 16) f:16 tc:HEXCOLOR(0x000000) t:@"我的记录"];
    [jiluBtn addSubview:jiluTitle];
    UIImageView *jiluArrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
    jiluArrowImageView.frame = CGRectMake(APP_CONTENT_WIDTH-32, 45/2-18/2, 18, 18);
    [jiluBtn addSubview:jiluArrowImageView];
    
    UIButton *zhutiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    zhutiBtn.frame = CGRectMake(0, jiluBtn.bottom, APP_CONTENT_WIDTH, 45);
    [otherBtnView addSubview:zhutiBtn];
    [MmbViewUtil drawLine:CGRectMake(0, 0, APP_CONTENT_WIDTH, 0.5) onView:zhutiBtn color:HEXCOLOR(0xdddddd)];
    UIImageView *zhutiImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhuti"]];
    zhutiImageView.frame = CGRectMake(20, 45/2-30/2, 30, 30);
    [zhutiBtn addSubview:zhutiImageView];
    UILabel *zhutiTitle = [MmbViewUtil simpleLabel:CGRectMake(zhutiImageView.right + 15, 45/2-16/2, 70, 16) f:16 tc:HEXCOLOR(0x000000) t:@"我的主题"];
    [zhutiBtn addSubview:zhutiTitle];
    UIImageView *zhutiArrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
    zhutiArrowImageView.frame = CGRectMake(APP_CONTENT_WIDTH-32, 45/2-18/2, 18, 18);
    [zhutiBtn addSubview:zhutiArrowImageView];
    
    UIButton *shoucangBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shoucangBtn.frame = CGRectMake(0, zhutiBtn.bottom, APP_CONTENT_WIDTH, 45);
    [otherBtnView addSubview:shoucangBtn];
    [MmbViewUtil drawLine:CGRectMake(0, 0, APP_CONTENT_WIDTH, 0.5) onView:shoucangBtn color:HEXCOLOR(0xdddddd)];
    UIImageView *shoucangImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shoucang"]];
    shoucangImageView.frame = CGRectMake(20, 45/2-30/2, 30, 30);
    [shoucangBtn addSubview:shoucangImageView];
    UILabel *shoucangTitle = [MmbViewUtil simpleLabel:CGRectMake(shoucangImageView.right + 15, 45/2-16/2, 70, 16) f:16 tc:HEXCOLOR(0x000000) t:@"我的收藏"];
    [shoucangBtn addSubview:shoucangTitle];
    UIImageView *shoucangArrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
    shoucangArrowImageView.frame = CGRectMake(APP_CONTENT_WIDTH-32, 45/2-18/2, 18, 18);
    [shoucangBtn addSubview:shoucangArrowImageView];
    [MmbViewUtil drawLine:CGRectMake(0, 45-0.5, APP_CONTENT_WIDTH, 0.5) onView:shoucangBtn color:HEXCOLOR(0xdddddd)];
    
    UIButton *shezhiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shezhiBtn.frame = CGRectMake(0, otherBtnView.bottom + kCellPitch, APP_CONTENT_WIDTH, 45);
    shezhiBtn.backgroundColor = [UIColor whiteColor];
    [containerView addSubview:shezhiBtn];
    [MmbViewUtil drawLine:CGRectMake(0, 0, APP_CONTENT_WIDTH, 0.5) onView:shezhiBtn color:HEXCOLOR(0xdddddd)];
    UIImageView *shezhiImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shezhi"]];
    shezhiImageView.frame = CGRectMake(20, 45/2-30/2, 30, 30);
    [shezhiBtn addSubview:shezhiImageView];
    UILabel *shezhiTitle = [MmbViewUtil simpleLabel:CGRectMake(shezhiImageView.right + 15, 45/2-16/2, 70, 16) f:16 tc:HEXCOLOR(0x000000) t:@"设置"];
    [shezhiBtn addSubview:shezhiTitle];
    UIImageView *shezhiArrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
    shezhiArrowImageView.frame = CGRectMake(APP_CONTENT_WIDTH-32, 45/2-18/2, 18, 18);
    [shezhiBtn addSubview:shezhiArrowImageView];
    [MmbViewUtil drawLine:CGRectMake(0, 45-0.5, APP_CONTENT_WIDTH, 0.5) onView:shezhiBtn color:HEXCOLOR(0xdddddd)];
    
    _loginoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginoutBtn.frame = CGRectMake(15, shezhiBtn.bottom + 40, APP_CONTENT_WIDTH - 15*2, 45);
    _loginoutBtn.backgroundColor = [UIColor whiteColor];
    _loginoutBtn.layer.borderWidth = 0.5;
    _loginoutBtn.layer.borderColor = HEXCOLOR(0xdddddd).CGColor;
    [_loginoutBtn setTitle:@"退出当前账号" forState:UIControlStateNormal];
    [_loginoutBtn setTitleColor:HEXCOLOR(0xe60000) forState:UIControlStateNormal];
    [_loginoutBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [_loginoutBtn addTarget:self action:@selector(onClickLoginoutBtn) forControlEvents:UIControlEventTouchUpInside];
    [containerView addSubview:_loginoutBtn];
    
    return containerView;
}

- (void)updateViewWithItem:(MmbUserInfoItem *)userItem{
    [_iconView sd_setImageWithURL:[NSURL URLWithString:userItem.iconUrl] placeholderImage:[UIImage imageNamed:@"defaultIcon.png"]];
    _userNameLabel.text = userItem.username;
    _userDescLabel.text = userItem.desc;
    _loginoutBtn.hidden = NO;
    _loginBtn.hidden = YES;
}

- (void)onClickLoginoutBtn {
    if ([self.delegate respondsToSelector:@selector(onClickLoginoutBtn)]) {
        [self.delegate onClickLoginoutBtn];
    }
}

- (void)onClickUserInfoBtn {
    if ([self.delegate respondsToSelector:@selector(onClickUserInfoBtn)]) {
        [self.delegate onClickUserInfoBtn];
    }
}


@end
