//
//  MmbSettingView.h
//  mamibao
//
//  Created by zhudong on 14/11/25.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MmbUserInfoItem.h"

@interface MmbSettingView : NSObject


- (UIView *)getTableHeaderView;

- (void)updateViewWithItem:(MmbUserInfoItem *)userItem;

@end
