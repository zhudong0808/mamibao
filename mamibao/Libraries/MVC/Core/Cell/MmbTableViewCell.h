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

@end
