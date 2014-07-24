//
//  MmbItem.h
//  mamibao
//
//  Created by zhudong on 14-7-1.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MmbItem : NSObject

-(id)initWithDictionary:(NSMutableDictionary *)dict;

/**
 *  实例化普通item对象，并返回对象
 *
 *  @param json 服务端返回的json数据
 *
 *  @return item对象
 */
+ (id)modelWithJSON:(NSDictionary *)json;


/**
 *  实例化多个普通item对象，添加到数组并返回
 *
 *  @param jsonArray 服务端返回的json数据，数组形式
 *
 *  @return item对象数组
 */
+ (id)modelArrayWithJSON:(NSArray *)jsonArray;




@end
