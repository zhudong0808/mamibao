//
//  MmbTableViewItem.h
//  mamibao
//
//  Created by zhudong on 14-7-2.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbItem.h"

/**
 *  item的类型
 */
typedef NS_ENUM(int, MmbTableViewItemType)
{
    /**
     *  默认类型，子类应该继承这个类型
     */
    kItem_Normal  = 0,
    /**
     *  loading类型，默认仅被父类使用
     */
    kItem_Loading = 1,
    /**
     *  错误类型，默认仅被父类使用
     */
    kItem_Error   = 2,
    /**
     *  自定一类型，默认仅被父类使用
     */
    kItem_Customize = 3
};

@interface MmbTableViewItem : MmbItem<NSCoding>

/**
 *  item的类型
 */
@property (nonatomic,assign) MmbTableViewItemType itemType;


/**
 *  @optional
 *  item的高度，建议在model请求完成后赋值
 */
@property (nonatomic,assign) CGFloat itemHeight;

@end
