//
//  MmbCustomNaviBarView.m
//  mamibao
//
//  Created by zhudong on 14-7-23.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbCustomNaviBarView.h"

@implementation MmbCustomNaviBarView

@synthesize leftBarItem = _leftBarItem;
@synthesize centerBarItem = _centerBarItem;
@synthesize rightBarItem = _rightBarItem;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置默认的导航条左边按钮为返回按钮
        [self setDefaultLeftBarItem];
        self.backgroundColor = RGBCOLOR(0xe3, 0x31, 0x25);
    }
    return self;
}

-(void)setLeftBarItem:(UIView *)leftBarItem{
    if (_leftBarItem) {
        [_leftBarItem removeFromSuperview];
        _leftBarItem = nil;
    }
    _leftBarItem = leftBarItem;
    if (_leftBarItem) {
        [self addSubview:_leftBarItem];
    }
}

-(void)setCenterBarItem:(UIView *)centerBarItem{
    if (_centerBarItem) {
        [_centerBarItem removeFromSuperview];
        _centerBarItem = nil;
    }
    centerBarItem.frame = CGRectMake(APP_CONTENT_WIDTH/2-100/2, isIOS7?20:0, 100, 44);
    centerBarItem.backgroundColor = [UIColor clearColor];
    if ([centerBarItem isKindOfClass:[UILabel class]]) {
        UILabel *centerBarItemLabel  = (UILabel *)centerBarItem;
        centerBarItemLabel.textAlignment = NSTextAlignmentCenter;
        _centerBarItem = centerBarItemLabel;
    } else {
        _centerBarItem = centerBarItem;
    }
    if (_centerBarItem) {
        [self addSubview:_centerBarItem];
    }
}

-(void)setRightBarItem:(UIView *)rightBarItem{
    if (_rightBarItem) {
        [_rightBarItem removeFromSuperview];
        _rightBarItem = nil;
    }
    if (rightBarItem.width > 0) {
        rightBarItem.frame = CGRectMake(APP_CONTENT_WIDTH-12-rightBarItem.width, isIOS7?20:0, rightBarItem.width, 44);
    } else {
        rightBarItem.frame = CGRectMake(210, isIOS7?20:0, APP_CONTENT_WIDTH-210-12, 44);
    }
    rightBarItem.backgroundColor = [UIColor clearColor];
    if ([rightBarItem isKindOfClass:[UILabel class]]) {
        UILabel *rightBarItemLabel = (UILabel *)rightBarItem;
        rightBarItemLabel.textAlignment = NSTextAlignmentRight;
        _rightBarItem = rightBarItemLabel;
    } else {
        _rightBarItem = rightBarItem;
    }
    if (_rightBarItem) {
        [self addSubview:_rightBarItem];
    }
}

-(void)setDefaultLeftBarItem{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(5, isIOS7?20:0, 50, 40);
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [backBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self setLeftBarItem:backBtn];
}

-(void)backAction:(id)sender{
    if ([self.delegate respondsToSelector:@selector(backAction:)]) {
        [self.delegate backAction:sender];
    }
}

@end
