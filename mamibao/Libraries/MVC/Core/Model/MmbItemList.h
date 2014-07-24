//
//  MmbItemList.h
//  mamibao
//
//  Created by zhudong on 14-7-4.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol MmbMockedNSMutableArray <NSObject>

+ (id)array;

@optional
- (NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)index;
- (void)addObject:(id)anObject;
- (void)addObjectsFromArray:(NSArray *)otherArray;
- (void)removeAllObjects;
- (void)removeObject:(id)anObject;

@end


@interface MmbItemList : NSObject<MmbMockedNSMutableArray>

/**
 *  存储主要数据的数组
 */
@property (nonatomic,strong,readonly) NSMutableArray *array;

/**
 *  当前页码
 */
@property (nonatomic,assign) NSUInteger currentPage;

/**
 *  记录总数
 */
@property (nonatomic,assign) NSUInteger totalCount;

/**
 *  每页条数
 */
@property (nonatomic,assign) NSUInteger pageSize;



/**
 *  创建对象实例，这里不用单例，如调用方有单例需求，自己实现
 *
 *  @return MmbItemList
 */
+(id)array;


/**
 *  重置
 */
-(void)reset;


/**
 *  删除array中所有数据
 */
-(void)removeAllObjects;

@end
