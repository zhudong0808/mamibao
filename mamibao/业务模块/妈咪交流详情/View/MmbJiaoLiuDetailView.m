//
//  MmbJiaoLiuDetailView.m
//  mamibao
//
//  Created by zhudong on 14/12/16.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbJiaoLiuDetailView.h"

#define kMarginLeftOrRight 15

@implementation MmbJiaoLiuDetailView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = HEXCOLOR(0xF9F9F9);
        [MmbViewUtil drawLine:CGRectMake(0, 0, APP_CONTENT_WIDTH, 0.5) onView:self color:HEXCOLOR(0xD0D0D0)];
        UIButton *replyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        replyBtn.frame = CGRectMake(APP_CONTENT_WIDTH-kMarginLeftOrRight-50, 40/2-25/2, 50, 25);
        replyBtn.backgroundColor = HEXCOLOR(0xE33125);
        replyBtn.layer.cornerRadius = 2;
        [replyBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
        [replyBtn setTitle:@"回复" forState:UIControlStateNormal];
        [replyBtn addTarget:self action:@selector(onClickReplyBtn) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:replyBtn];
    }
    return self;
}


- (void)onClickReplyBtn {
    if ([self.delegate respondsToSelector:@selector(onClickReplyBtn)]) {
        [self.delegate onClickReplyBtn];
    }
}

@end
