//
//  MmbUserInfoItem.h
//  mamibao
//
//  Created by zhudong on 14/11/25.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbItem.h"

@interface MmbUserInfoItem : MmbItem

/**
 *  头像地址
 */
@property (nonatomic,strong) NSString *iconUrl;


/**
 *  标题（用户名）
 */
@property (nonatomic,strong) NSString *username;


/**
 *  描述
 */
@property (nonatomic,strong) NSString *desc;


/**
 *  是否开启消息通知（1：开启 0：关闭）
 */
@property (nonatomic,assign) NSInteger ifOpenMessage;

@end
