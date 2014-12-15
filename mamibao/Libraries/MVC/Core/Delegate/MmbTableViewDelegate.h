//
//  MmbTableViewDelegate.h
//  mamibao
//
//  Created by zhudong on 14-7-29.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MmbTableViewController;

@interface MmbTableViewDelegate : NSObject<UITableViewDelegate>

/**
 * a weak reference to view controller
 */
@property (nonatomic, weak) MmbTableViewController* controller;

@end
