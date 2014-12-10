//
//  TBCityCoreTextPaser.h
//  iCoupon
//
//  Created by SunX on 14/11/20.
//  Copyright (c) 2014年 Taobao.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBCityCoreTextAttribute.h"

@interface TBCityCoreTextParser : NSObject 

/**
 *  行距，行与行之间的间隔，默认是0
 */
@property (nonatomic,assign) CGFloat                        lineSpace;
/**
 *  Label的默认font
 */
@property (nonatomic,strong) UIFont*                        font;
/**
 *  Label默认的颜色
 */
@property (nonatomic,strong) UIColor*                       textColor;
/**
 *  是否需要draw其他特殊的view  img 背景色等
 */
@property (nonatomic,assign) BOOL                           needDrawExtraView;
/**
 *  CoreText的内容
 */
@property (nonatomic,strong) NSMutableAttributedString*     attributedString;
/**
 *  节点数组
 */
@property (nonatomic,strong) NSMutableArray*                nodesArray;

/**
 *  创建AttributedString
 */
-(void)buildAttributedString:(NSString*)string;
+(TBCityCoreTextParser*)buildAttributedString:(NSString*)string;

@end
