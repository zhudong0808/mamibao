//
//  MmbHomeItem.h
//  mamibao
//
//  Created by zhudong on 14-9-11.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbItem.h"

@interface MmbHomeItem : MmbItem

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
 *  知识库模块更新数
 */
@property (nonatomic,assign) NSInteger *zhishiCount;


/**
 *  专家在线更新数
 */
@property (nonatomic,assign) NSInteger *zhuanjiaCount;


/**
 *  成长记录更新数
 */
@property (nonatomic,assign) NSInteger *chengzhangCount;


/**
 *  妈咪交流更新数
 */
@property (nonatomic,assign) NSInteger *jiaoliuCount;


@end
