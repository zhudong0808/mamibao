//
//  MmbJiaoLiuDetailView.h
//  mamibao
//
//  Created by zhudong on 14/12/16.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MmbJiaoLiuDetailViewDelegate <NSObject>

- (void)onClickReplyBtn;

@end

@interface MmbJiaoLiuDetailView : UIView

@property (nonatomic, strong) id<MmbJiaoLiuDetailViewDelegate> delegate;


@end
