//
//  MmbIndexModel.m
//  mamibao
//
//  Created by zhudong on 14-7-7.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbJiaoLiuDetailModel.h"
#import "MmbJiaoLiuDetailItem.h"
#import "MmbJiaoLiuDetailSubjectTableViewCell.h"
#import "TBCityCoreTextLabel.h"

@implementation MmbJiaoLiuDetailModel


-(NSDictionary *)dataParams{
    return @{@"offset":[NSNumber numberWithInteger:self.currentPageIndex*self.pageSize],@"limit":[NSNumber numberWithInteger:self.pageSize]};
}

-(NSDictionary *)systemParams{
    return @{@"v":@"1.0"};
}

-(NSString *)methodName{
    return @"mmb.jiaoliu.detail";
}

-(NSArray *)parseResponse:(id)JSON error:(NSError *__autoreleasing *)error{
    NSArray *itemList = [MmbJiaoLiuDetailItem modelArrayWithJSON:[JSON objectForKey:@"list"]];
    
    for (MmbJiaoLiuDetailItem *item in itemList) {
        if ([item.tid length] > 0 && [item.pid length] == 0) {
            item.itemHeight = kMarginTop + kIconWidth + kMarginTopSmall + kSubjectHeight + kMarginTopSmall2 + [TBCityCoreTextLabel getContentHeightWithWidth:APP_CONTENT_WIDTH-2*kMarginLeftOrRight withText:item.content withFont:nil] + kMarginTopSmall2 + kBottomViewHeight + kMarginTopSmall2;
        } else {
            item.itemHeight = kMarginTop + kIconWidth + kMarginTopSmall2 + [TBCityCoreTextLabel getContentHeightWithWidth:APP_CONTENT_WIDTH-2*kMarginLeftOrRight withText:item.content withFont:nil] + kMarginTopSmall2+kMarginTopSmall2;
        }
    }
    
    return itemList;
}

@end
