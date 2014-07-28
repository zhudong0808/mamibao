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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置默认的导航条左边按钮为返回按钮
        [self setDefaultLeftBarItem];
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
    _centerBarItem = centerBarItem;
    if (_centerBarItem) {
        [self addSubview:_centerBarItem];
    }
}

-(void)setDefaultLeftBarItem{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(5, isIOS7?33:13, 50, 18);
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
