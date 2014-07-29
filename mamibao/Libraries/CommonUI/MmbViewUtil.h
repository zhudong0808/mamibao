//
//  MmbViewUtil.h
//  mamibao
//
//  Created by zhudong on 14-7-29.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MmbViewUtil : NSObject

+(UILabel *)simpleLabel:(CGRect)frame f:(int)size tc:(UIColor *)color t:(NSString *)text;
+(UILabel *)simpleLabel:(CGRect)frame bf:(int)size tc:(UIColor *)color t:(NSString *)text;

@end
