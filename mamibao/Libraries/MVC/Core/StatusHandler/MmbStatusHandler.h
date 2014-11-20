//
//  MmbStatusHandler.h
//  mamibao
//
//  Created by zhudong on 14-7-6.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

/**
 *  状态显示工具，显示空、错误、loading等状态页面
 */

#import <Foundation/Foundation.h>
#import "MmbStatusInfo.h"

@protocol MmbStatusDelegate <NSObject>

@optional

-(SEL)selectorForError:(NSError *)error;
-(SEL)selectorForEmpty;

@end


@interface MmbStatusHandler : NSObject

@property (nonatomic,strong) MmbStatusInfo *statusInfo;
@property (nonatomic,weak) id<MmbStatusDelegate> delegate;

- (id)initWithStatusInfo:(MmbStatusInfo *)statusInfo delegate:(id<MmbStatusDelegate>)delegate;
- (void)removeStatusViewFromView:(UIView *)view;
- (void)showLoadingViewInView:(UIView *)parentView frame:(CGRect)frame;

@end
