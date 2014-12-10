//
//  MmbTableViewCell.h
//  mamibao
//
//  Created by zhudong on 14-7-2.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MmbTableViewItem.h"

@interface MmbTableViewCell : UITableViewCell

/**
 *  绑定cell和item
 */
@property (nonatomic,strong) MmbTableViewItem *item;


/**
 *  cell高度计算
 *
 *  @param tableView cell所在tableview
 *  @param item      cell对应的数据源
 *  @param indexPath cell的index
 *
 *  @return 高度值
 *  @important 这个方法在UI线程回调，如果需要很复杂的计算，请使用item.itemHeight字段。
 */
+ (CGFloat)tableView:(UITableView*)tableView variantRowHeightForItem:(id)item AtIndex:(NSIndexPath*)indexPath;

@end
