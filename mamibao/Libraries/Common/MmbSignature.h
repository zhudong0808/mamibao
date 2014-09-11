//
//  MmbSignature.h
//  mamibao
//
//  Created by zhudong on 14-8-27.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MmbSignature : NSObject

/**
 *  需要签名的参数
 */
@property (nonatomic,strong) NSDictionary *params;


/**
 *  获取签名字符串
 *
 *  @return 签名字符串
 */
-(NSString *)getSignString;

@end
