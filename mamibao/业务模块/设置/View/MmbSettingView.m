//
//  MmbSettingView.m
//  mamibao
//
//  Created by zhudong on 14/11/25.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbSettingView.h"


#define kCellPitch 10

@interface MmbSettingView(){

}

@property (nonatomic, strong) UISwitch *messageSwitch;

@end

@implementation MmbSettingView

- (UIView *)getTableHeaderView {
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_CONTENT_WIDTH, APP_CONTENT_HEIGHT - 44)];
    containerView.backgroundColor = [UIColor clearColor];
    
    UIButton *userInfoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    userInfoBtn.frame = CGRectMake(0, kCellPitch, APP_CONTENT_WIDTH, 80);
    userInfoBtn.backgroundColor = [UIColor whiteColor];
    [userInfoBtn addTarget:self action:@selector(onclickUserInfoBtn) forControlEvents:UIControlEventTouchUpInside];
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
    [_loginBtn addTarget:self action:@selector(onclickUserInfoBtn) forControlEvents:UIControlEventTouchUpInside];
    [userInfoBtn addSubview:_loginBtn];
    
    UILabel *loginBtnLabel = [MmbViewUtil simpleLabel:CGRectMake(90/2-60/2, 30/2-14/2, 60, 14) f:14 tc:HEXCOLOR(0xe33125) t:@"立即登录"];
    loginBtnLabel.textAlignment = NSTextAlignmentCenter;
    loginBtnLabel.backgroundColor = [UIColor clearColor];
    [_loginBtn addSubview:loginBtnLabel];
    
    //箭头图标
    UIImageView *arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
    arrowImageView.frame = CGRectMake(APP_CONTENT_WIDTH-32, 90/2-18/2-2, 18, 18);
    [userInfoBtn addSubview:arrowImageView];
    
    [MmbViewUtil drawLine:CGRectMake(0, 80-0.5, APP_CONTENT_WIDTH, 0.5) onView:userInfoBtn color:HEXCOLOR(0xdddddd)];
    
    
    UIView *messageView = [[UIView alloc] initWithFrame:CGRectMake(0, userInfoBtn.bottom + kCellPitch, APP_CONTENT_WIDTH, 45)];
    messageView.backgroundColor = [UIColor whiteColor];
    [MmbViewUtil drawLine:CGRectMake(0, 0, APP_CONTENT_WIDTH, 0.5) onView:messageView color:HEXCOLOR(0xdddddd)];
    UILabel *messageTitle = [MmbViewUtil simpleLabel:CGRectMake(15, 45/2-16/2, 70, 16) f:16 tc:HEXCOLOR(0x000000) t:@"消息通知"];
    [messageView addSubview:messageTitle];
    
    _messageSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(APP_CONTENT_WIDTH-15-50, 45/2-30/2, 50, 30)];
    [messageView addSubview:_messageSwitch];
    
    [MmbViewUtil drawLine:CGRectMake(0, 45-0.5, APP_CONTENT_WIDTH, 0.5) onView:messageView color:HEXCOLOR(0xdddddd)];
    
    [containerView addSubview:messageView];
    
    UIView *otherBtnView = [[UIView alloc] initWithFrame:CGRectMake(0, messageView.bottom + kCellPitch, APP_CONTENT_WIDTH, 90)];
    otherBtnView.backgroundColor = [UIColor whiteColor];
    [containerView addSubview:otherBtnView];
    
    UIButton *feedbackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    feedbackBtn.frame = CGRectMake(0, 0, APP_CONTENT_WIDTH, 45);
    [otherBtnView addSubview:feedbackBtn];
    [MmbViewUtil drawLine:CGRectMake(0, 0, APP_CONTENT_WIDTH, 0.5) onView:feedbackBtn color:HEXCOLOR(0xdddddd)];
    UILabel *feedbackTitle = [MmbViewUtil simpleLabel:CGRectMake(15, 45/2-16/2, 70, 16) f:16 tc:HEXCOLOR(0x000000) t:@"提交反馈"];
    [feedbackBtn addSubview:feedbackTitle];
    UIImageView *feedbackArrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
    feedbackArrowImageView.frame = CGRectMake(APP_CONTENT_WIDTH-32, 45/2-18/2, 18, 18);
    [feedbackBtn addSubview:feedbackArrowImageView];
    [MmbViewUtil drawLine:CGRectMake(0, 45-0.5, APP_CONTENT_WIDTH, 0.5) onView:feedbackBtn color:HEXCOLOR(0xdddddd)];
    
    UIButton *aboutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    aboutBtn.frame = CGRectMake(0, feedbackBtn.bottom, APP_CONTENT_WIDTH, 45);
    [otherBtnView addSubview:aboutBtn];
    UILabel *aboutTitle = [MmbViewUtil simpleLabel:CGRectMake(15, 45/2-16/2, 70, 16) f:16 tc:HEXCOLOR(0x000000) t:@"关于我们"];
    [aboutBtn addSubview:aboutTitle];
    UIImageView *aboutArrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
    aboutArrowImageView.frame = CGRectMake(APP_CONTENT_WIDTH-32, 45/2-18/2, 18, 18);
    [aboutBtn addSubview:aboutArrowImageView];
    [MmbViewUtil drawLine:CGRectMake(0, 45-0.5, APP_CONTENT_WIDTH, 0.5) onView:aboutBtn color:HEXCOLOR(0xdddddd)];
    
    return containerView;
}

- (void)updateViewWithItem:(MmbUserInfoItem *)userItem{
    [_iconView sd_setImageWithURL:[NSURL URLWithString:userItem.iconUrl] placeholderImage:[UIImage imageNamed:@"defaultIcon.png"]];
    _userNameLabel.text = userItem.username;
    _userDescLabel.text = userItem.desc;
    if (userItem.ifOpenMessage == 1) {
        _messageSwitch.on = YES;
    } else {
        _messageSwitch.on = NO;
    }
    _loginBtn.hidden = YES;
    
}

- (void)onclickUserInfoBtn {
    if ([self.delegate respondsToSelector:@selector(onclickUserInfoBtn)]) {
        [self.delegate onclickUserInfoBtn];
    }
}


@end
