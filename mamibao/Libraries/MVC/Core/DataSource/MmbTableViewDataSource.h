//
//  MmbTableViewDataSource.h
//  mamibao
//
//  Created by zhudong on 14-7-2.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MmbListModel.h"

@class MmbTableViewController;
@interface MmbTableViewDataSource : NSObject<UITableViewDataSource>

/**
 *  tableView dataSource 对应的controller
 */
@property (nonatomic,strong) MmbTableViewController *controller;

/**
 *  绑定items和databsource
 *
 *  @param model   MmbListModel
 *  @param section model对应的section
 */
-(void)tableViewControllerDidLoadModel:(MmbListModel *)model ForSection:(NSInteger)section;


/**
 *  清除所有数据
 */
-(void)removeAllItems;

@end
