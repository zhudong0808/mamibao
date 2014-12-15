//
//  MmbTableViewDataSource.h
//  mamibao
//
//  Created by zhudong on 14-7-2.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MmbListModel.h"
#import "MmbTableViewItem.h"

@protocol MmbTableViewDataSource <UITableViewDataSource>

@required

- (Class)cellClassForItem:(MmbTableViewItem*)item AtIndex:(NSIndexPath *)indexPath;

@end


@class MmbTableViewController;

@interface MmbTableViewDataSource : NSObject<MmbTableViewDataSource>

/**
 *  tableView dataSource 对应的controller
 */
@property (nonatomic, weak) MmbTableViewController *controller;

/**
 * <k:NSArray v:section>
 * section到列表数据的映射
 */
@property(nonatomic,strong)  NSDictionary* itemsForSection;

/**
 *  绑定items和databsource
 *
 *  @param model   MmbListModel
 *  @param section model对应的section
 */
-(void)tableViewControllerDidLoadModel:(MmbListModel *)model ForSection:(NSInteger)section;


/**
 *  返回指定的Item
 *
 *  @param indexPath
 *
 *  @return MmbTableViewItem
 */
- (MmbTableViewItem *)itemForCellAtIndexPath:(NSIndexPath *)indexPath;


/**
 *  清除所有数据
 */
-(void)removeAllItems;

@end
