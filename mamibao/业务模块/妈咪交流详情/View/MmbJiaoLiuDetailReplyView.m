//
//  MmbJiaoLiuDetailReplyView.m
//  mamibao
//
//  Created by zhudong on 14/12/29.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbJiaoLiuDetailReplyView.h"

@implementation MmbJiaoLiuDetailReplyView

+ (UIView *)maskView {
    UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_CONTENT_WIDTH, APP_SCREEN_HEIGHT)];
    maskView.backgroundColor = HEXCOLORA(0x000000, 0.5);
    return maskView;
}

@end
