//
//  MmbViewController.h
//  mamibao
//
//  Created by zhudong on 14-6-22.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MmbTableViewController.h"
#import "MmbJiaoLiuDetailView.h"
#import "MmbJiaoLiuDetailReplyTableViewCell.h"


@interface MmbJiaoLiuDetailViewController : MmbTableViewController<MmbJiaoLiuDetailViewDelegate>

- (id)initWithTid:(NSString *)tid;

@end
