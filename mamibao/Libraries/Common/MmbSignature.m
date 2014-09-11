//
//  MmbSignature.m
//  mamibao
//
//  Created by zhudong on 14-8-27.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbSignature.h"
#import "NSHash/NSString+NSHash.h"

#define APP_SECRECT @"abc123"

@implementation MmbSignature

@synthesize params = _params;

-(NSString *)getSignString{
    if ([_params count] == 0) {
        return @"";
    }
    NSMutableString *signString = [NSMutableString string];
    NSArray *sortKeys = [[_params allKeys] sortedArrayUsingSelector:@selector(compare:)];
    for (NSString *key in sortKeys) {
        [signString appendString:[NSString stringWithFormat:@"%@%@",key,[_params objectForKey:key]]];
    }
    [signString appendString:APP_SECRECT];
    return [signString SHA1];
}

@end
