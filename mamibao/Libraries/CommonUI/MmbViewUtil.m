//
//  MmbViewUtil.m
//  mamibao
//
//  Created by zhudong on 14-7-29.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbViewUtil.h"

@implementation MmbViewUtil

+(UILabel *)simpleLabel:(CGRect)frame f:(int)size tc:(UIColor *)color t:(NSString *)text{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:size];
    label.textColor = color;
    label.text = text;
    
    return label;
}
+(UILabel *)simpleLabel:(CGRect)frame bf:(int)size tc:(UIColor *)color t:(NSString *)text{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:size];
    label.textColor = color;
    label.text = text;
    
    return label;
}

+(BOOL)isRetina{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 4)
    {
        return  NO;
    }
    else
    {
        return [[UIScreen mainScreen] scale] > 1;
    }
}


+(UIView *)drawLine:(CGRect)frame onView:(UIView *)pView color:(UIColor *)color{
    UIView *line = [[UIView alloc] initWithFrame:frame];
    if (![[self class] isRetina]) {
        line.width = line.width<1?1:line.width;
        line.height = line.height<1?1:line.height;
    }
    line.backgroundColor = color;
    [pView addSubview:line];
    return line;
}

@end
