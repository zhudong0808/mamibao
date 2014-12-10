//
//  MmbListModel.h
//  mamibao
//
//  Created by zhudong on 14-7-29.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbModel.h"

@interface MmbListModel : MmbModel


/**
 *  是否有更多
 */
@property (nonatomic, readonly) BOOL hasMore;


/**
 * 分页当前页数
 */
@property(nonatomic, assign) NSInteger currentPageIndex;

/**
 *  分页个数，默认20
 */
@property(nonatomic, assign) NSInteger pageSize;

/**
 *  对应的section
 */
@property(nonatomic, assign) NSInteger sectionNumber;


@end
