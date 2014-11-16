//
//  MmbHomeView.h
//  mamibao
//
//  Created by zhudong on 14-7-30.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MmbHomeItem.h"

@interface MmbHomeView : NSObject

-(UIView *)getTableHeaderView;

-(UIView *)getTableFooterView;

-(void)updateViewWithItem:(MmbHomeItem *)homeItem;

@end
