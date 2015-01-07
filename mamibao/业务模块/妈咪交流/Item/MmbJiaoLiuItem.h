//
//  MmbIndexItem.h
//  mamibao
//
//  Created by zhudong on 14-7-9.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbTableViewItem.h"

@interface MmbJiaoLiuItem : MmbTableViewItem

/**
 *  标题
 */
@property (nonatomic, strong) NSString *subject;

/**
 *  作者名称
 */
@property (nonatomic, strong) NSString *author;

/**
 *  格式化的回复时间
 */
@property (nonatomic, strong) NSString *replyTime;

/**
 *  阅读数
 */
@property (nonatomic, strong) NSString *readCount;

/**
 *  回复数
 */
@property (nonatomic ,strong) NSString *replyCount;


/**
 *  帖子ID
 */
@property (nonatomic, strong) NSString *tid;



@end
