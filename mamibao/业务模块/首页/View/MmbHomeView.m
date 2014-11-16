//
//  MmbHomeView.m
//  mamibao
//
//  Created by zhudong on 14-7-30.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbHomeView.h"

#define TABLE_FOOTER_VIEW_HEIGHT (APP_CONTENT_HEIGHT-44-90)

@interface MmbHomeView(){
}

@property (nonatomic,strong) UIView *tableHeaderView;
@property (nonatomic,strong) UIView *tableFooterView;
@property (nonatomic,strong) UIImageView *iconView;
@property (nonatomic,strong) UILabel *userNameLabel;
@property (nonatomic,strong) UILabel *userDescLabel;
@property (nonatomic,strong) UIButton *zhishiView;
@property (nonatomic,strong) UIButton *zhuanjiaView;
@property (nonatomic,strong) UIButton *chengzhangView;
@property (nonatomic,strong) UIButton *jiaoliuView;

@end

@implementation MmbHomeView

-(UIView *)getTableHeaderView{
    if (!_tableHeaderView) {
        _tableHeaderView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, APP_CONTENT_WIDTH, 90)];
        _tableHeaderView.backgroundColor = [UIColor clearColor];
        [MmbViewUtil drawLine:CGRectMake(0, 10-0.5, APP_CONTENT_WIDTH, 0.5) onView:_tableHeaderView color:RGBCOLOR(0xdd, 0xdd, 0xdd)];
        UIView *userInfoView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, APP_CONTENT_WIDTH, 80)];
        userInfoView.backgroundColor = [UIColor whiteColor];
        [_tableHeaderView addSubview:userInfoView];
        
        
        //头像
        _iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"defaultIcon"]];
        _iconView.frame = CGRectMake(15, 10, 60, 60);
        [userInfoView addSubview:_iconView];
        
        //用户名称
        _userNameLabel = [MmbViewUtil simpleLabel:CGRectMake(_iconView.right+10, 15, 200, 20) f:15 tc:RGBCOLOR(0x00, 0x00, 0x00) t:@"小宝君"];
        [userInfoView addSubview:_userNameLabel];
        
        //用户描述
        _userDescLabel = [MmbViewUtil simpleLabel:CGRectMake(_userNameLabel.left, _userNameLabel.bottom+5, 200, 30) f:12 tc:RGBCOLOR(0x99, 0x99, 0x99) t:@"我的人生目标是捡很多很多很多肥皂成为人类的肥皂大师"];
        _userDescLabel.numberOfLines = 2;
        [userInfoView addSubview:_userDescLabel];
        
        //箭头图标
        UIImageView *arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
        arrowImageView.frame = CGRectMake(APP_CONTENT_WIDTH-32, 90/2-18/2, 18, 18);
        [userInfoView addSubview:arrowImageView];
        
        [MmbViewUtil drawLine:CGRectMake(0, 80-0.5, APP_CONTENT_WIDTH, 0.5) onView:userInfoView color:RGBCOLOR(0xdd, 0xdd, 0xdd)];
        
    }
    return _tableHeaderView;
}

-(UIView *)getTableFooterView{
    if (!_tableFooterView) {
        _tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_CONTENT_WIDTH, TABLE_FOOTER_VIEW_HEIGHT)];
        _tableFooterView.backgroundColor = [UIColor clearColor];
        [MmbViewUtil drawLine:CGRectMake(0, 8-0.5, APP_CONTENT_WIDTH, 0.5) onView:_tableFooterView color:RGBCOLOR(0xdd, 0xdd, 0xdd)];
        
        UIView *btnContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 8, APP_CONTENT_WIDTH, TABLE_FOOTER_VIEW_HEIGHT-8)];
        btnContainerView.backgroundColor = [UIColor whiteColor];
        [_tableFooterView addSubview:btnContainerView];
        
        //知识库
        [btnContainerView addSubview:self.zhishiView];
        //专家在线
        [btnContainerView addSubview:self.zhuanjiaView];
        //成长记录
        [btnContainerView addSubview:self.chengzhangView];
        //妈咪交流
        [btnContainerView addSubview:self.jiaoliuView];
        
        [MmbViewUtil drawLine:CGRectMake(0, (TABLE_FOOTER_VIEW_HEIGHT-8)/2, APP_CONTENT_WIDTH, 0.5) onView:btnContainerView color:RGBCOLOR(0xdd, 0xdd, 0xdd)];
        [MmbViewUtil drawLine:CGRectMake(APP_CONTENT_WIDTH/2, 0, 0.5,TABLE_FOOTER_VIEW_HEIGHT-8) onView:btnContainerView color:RGBCOLOR(0xdd, 0xdd, 0xdd)];
        
    }
    return _tableFooterView;
}

-(UIButton *)zhishiView{
    if (!_zhishiView) {
        _zhishiView = [UIButton buttonWithType:UIButtonTypeCustom];
        _zhishiView.frame = CGRectMake(0, 0, APP_CONTENT_WIDTH/2, (TABLE_FOOTER_VIEW_HEIGHT-8)/2);
        UIImageView *btnImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhishi"]];
        btnImageView.frame = CGRectMake(APP_CONTENT_WIDTH/4-30/2, 30, 30, 30);
        [_zhishiView addSubview:btnImageView];
        
        UILabel *btnTitleLabel = [MmbViewUtil simpleLabel:CGRectMake(10, btnImageView.bottom+30, APP_CONTENT_WIDTH/2-20, 15) f:15 tc:RGBCOLOR(0x00, 0x00, 0x00) t:@"知识库"];
        btnTitleLabel.textAlignment = NSTextAlignmentCenter;
        [_zhishiView addSubview:btnTitleLabel];
        
        UILabel *btnDescLabel = [MmbViewUtil simpleLabel:CGRectMake(0, btnTitleLabel.bottom, APP_CONTENT_WIDTH/2, 30) f:9 tc:RGBCOLOR(0xb0, 0xb0, 0xb0) t:@"育儿知识库，帮助妈妈"];
        btnDescLabel.textAlignment = NSTextAlignmentCenter;
        btnDescLabel.numberOfLines = 2;
        [_zhishiView addSubview:btnDescLabel];
    }
    return _zhishiView;
}

-(UIButton *)zhuanjiaView{
    if (!_zhuanjiaView) {
        _zhuanjiaView = [UIButton buttonWithType:UIButtonTypeCustom];
        _zhuanjiaView.frame = CGRectMake(APP_CONTENT_WIDTH/2, 0, APP_CONTENT_WIDTH/2, (TABLE_FOOTER_VIEW_HEIGHT-8)/2);
        UIImageView *btnImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhuanjia"]];
        btnImageView.frame = CGRectMake(APP_CONTENT_WIDTH/4-30/2, 30, 30, 30);
        [_zhuanjiaView addSubview:btnImageView];
        
        UILabel *btnTitleLabel = [MmbViewUtil simpleLabel:CGRectMake(0, btnImageView.bottom+30, APP_CONTENT_WIDTH/2, 15) f:15 tc:RGBCOLOR(0x00, 0x00, 0x00) t:@"专家在线"];
        btnTitleLabel.textAlignment = NSTextAlignmentCenter;
        [_zhuanjiaView addSubview:btnTitleLabel];
        
        UILabel *btnDescLabel = [MmbViewUtil simpleLabel:CGRectMake(10, btnTitleLabel.bottom, APP_CONTENT_WIDTH/2-20, 30) f:9 tc:RGBCOLOR(0xb0, 0xb0, 0xb0) t:@"公立医院医生、育婴专家组成的专业团队，为您解答"];
        btnDescLabel.textAlignment = NSTextAlignmentCenter;
        btnDescLabel.numberOfLines = 2;
        [_zhuanjiaView addSubview:btnDescLabel];
    }
    return _zhuanjiaView;
}

-(UIButton *)chengzhangView{
    if (!_chengzhangView) {
        _chengzhangView = [UIButton buttonWithType:UIButtonTypeCustom];
        _chengzhangView.frame = CGRectMake(0, _zhishiView.bottom, APP_CONTENT_WIDTH/2, (TABLE_FOOTER_VIEW_HEIGHT-8)/2);
        UIImageView *btnImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chengzhang"]];
        btnImageView.frame = CGRectMake(APP_CONTENT_WIDTH/4-30/2, 30, 30, 30);
        [_chengzhangView addSubview:btnImageView];
        
        UILabel *btnTitleLabel = [MmbViewUtil simpleLabel:CGRectMake(0, btnImageView.bottom+30, APP_CONTENT_WIDTH/2, 15) f:15 tc:RGBCOLOR(0x00, 0x00, 0x00) t:@"成长记录"];
        btnTitleLabel.textAlignment = NSTextAlignmentCenter;
        [_chengzhangView addSubview:btnTitleLabel];
        
        UILabel *btnDescLabel = [MmbViewUtil simpleLabel:CGRectMake(10, btnTitleLabel.bottom, APP_CONTENT_WIDTH/2-20, 30) f:9 tc:RGBCOLOR(0xb0, 0xb0, 0xb0) t:@"记录美好成长点滴"];
        btnDescLabel.textAlignment = NSTextAlignmentCenter;
        btnDescLabel.numberOfLines = 2;
        [_chengzhangView addSubview:btnDescLabel];
    }
    return _chengzhangView;
}

-(UIButton *)jiaoliuView{
    if (!_jiaoliuView) {
        _jiaoliuView = [UIButton buttonWithType:UIButtonTypeCustom];
        _jiaoliuView.frame = CGRectMake(APP_CONTENT_WIDTH/2, _zhishiView.bottom, APP_CONTENT_WIDTH/2, (TABLE_FOOTER_VIEW_HEIGHT-8)/2);
        UIImageView *btnImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jiaoliu"]];
        btnImageView.frame = CGRectMake(APP_CONTENT_WIDTH/4-30/2, 30, 30, 30);
        [_jiaoliuView addSubview:btnImageView];
        
        UILabel *btnTitleLabel = [MmbViewUtil simpleLabel:CGRectMake(0, btnImageView.bottom+30, APP_CONTENT_WIDTH/2, 15) f:15 tc:RGBCOLOR(0x00, 0x00, 0x00) t:@"妈咪交流"];
        btnTitleLabel.textAlignment = NSTextAlignmentCenter;
        [_jiaoliuView addSubview:btnTitleLabel];
        
        UILabel *btnDescLabel = [MmbViewUtil simpleLabel:CGRectMake(10, btnTitleLabel.bottom, APP_CONTENT_WIDTH/2-20, 30) f:9 tc:RGBCOLOR(0xb0, 0xb0, 0xb0) t:@"妈咪们经验分享"];
        btnDescLabel.textAlignment = NSTextAlignmentCenter;
        btnDescLabel.numberOfLines = 2;
        [_jiaoliuView addSubview:btnDescLabel];
    }
    return _jiaoliuView;
}

-(void)updateViewWithItem:(MmbHomeItem *)homeItem{
    _userNameLabel.text = homeItem.username;
    _userDescLabel.text = homeItem.desc;
}


@end
