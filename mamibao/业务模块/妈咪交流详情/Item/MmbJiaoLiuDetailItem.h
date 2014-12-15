//
//  MmbIndexItem.h
//  mamibao
//
//  Created by zhudong on 14-7-9.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbTableViewItem.h"

@interface MmbJiaoLiuDetailItem : MmbTableViewItem

/**
 *  标题
 */
@property (nonatomic, strong) NSString *subject;

/**
 *  内容
 */
@property (nonatomic, strong) NSString *content;

/**
 *  用户头像地址
 */
@property (nonatomic, strong) NSString *iconUrl;

/**
 *  作者名称
 */
@property (nonatomic, strong) NSString *author;

/**
 *  用户的描述内容
 */
@property (nonatomic, strong) NSString *desc;

/**
 *  格式化的发表时间
 */
@property (nonatomic, strong) NSString *postTime;

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

/**
 *  帖子回复ID
 */
@property (nonatomic, strong) NSString *pid;


/**
 *  楼层名称
 */
@property (nonatomic, strong) NSString *lou;



@end
