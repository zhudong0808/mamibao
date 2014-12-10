//
//  CoreTextView.h
//  CoreText
//
//  Created by SunX on 14-4-9.
//  Copyright (c) 2014年 SunX. All rights reserved.
//

/**
 *  特别提醒，此Label会额外增加3个像素高度，目的是避免富文本有图片的时候高度不对的问题，
 *  如需精确的高度，请获取textHeight
 */

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "TBCityCoreTextAttribute.h"
#import "TBCityCoreTextParser.h"
@class TBCityCoreTextLabel;
/**
 *  文本点击回调block
 *
 *  @param href  点击的地址
 *  @param label 点击的label
 */
typedef void(^CoreTextClickBlock) (NSString *href,TBCityCoreTextLabel* label);
typedef void(^CoreTextDrawFinishBlock) (TBCityCoreTextLabel* label);

@interface TBCityCoreTextLabel : UIView

/**
 *  text
 */
@property (nonatomic,copy)   NSString*                      text;
/**
 *  parser，xml解析器
 */
@property (nonatomic,strong) TBCityCoreTextParser*          parser;
/**
 *  行距，行与行之间的间隔，默认是0
 */
@property (nonatomic,assign) CGFloat                        lineSpace;
/**
 *  内容的实际高度 此属性获取实际渲染高度
 */
@property (nonatomic,assign) CGFloat                        textHeight;
/**
 *  内容的实际宽度 此属性获取实际渲染宽度
 */
@property (nonatomic,assign) CGFloat                        textWidth;
/**
 *  Label的默认font
 */
@property (nonatomic,strong) UIFont*                        font;
/**
 *  Label默认的颜色
 */
@property (nonatomic,strong) UIColor*                       textColor;
/**
 *  点击回调，需要设置userInteractionEnabled = YES
 */
@property (nonatomic,copy)   CoreTextClickBlock             clickBlock;
/**
 *  drawRect完成回调
 */
@property (nonatomic,copy)   CoreTextDrawFinishBlock        drawFinishBlock;

/**
 *  为了支持IconFont,以及传入UIImage
 *  demo:  
    TBCityCoreTextLabel *core = [TBCityCoreTextLabel alloc] initWithFrame:xxxx];
    core.imageDic = @{@"iconfontImage":[UIImage iconfont:xxx]};
    core.text = "<img src='iconfontImage' width='12' height='12'/> 这里是传入UImage demo";
 *
 */
@property (nonatomic,strong) NSDictionary*                  imageDic;

/**
 *  通过parser更新界面，省略初始化时间
 */
-(void)attributedStringWithParser:(TBCityCoreTextParser*)parser;

/**
 *  初始化
 *
 *  @param frame
 *  @param handle 接受点击回调
 *
 *  @return
 */
-(id)initWithFrame:(CGRect)frame
        withHandle:(CoreTextClickBlock)handle;

/**
 *  初始化
 *
 *  @param frame
 *  @param text
 *
 *  @return
 */
-(id)initWithFrame:(CGRect)frame
          withText:(NSString*)text;

/**
 *  初始化
 *
 *  @param view   加载到哪个view上
 *  @param frame  CGRect
 *  @param text   文本内容
 *  @param handle 点击事件回调block
 *
 */
+(void)showInView:(UIView*)view
        withFrame:(CGRect)frame
         withText:(NSString*)text
       withHandle:(CoreTextClickBlock)handle;

/**
 *  指定宽度【计算】某个文本的实际高度，
 *  这个方法不会触发渲染
 *  @param width  指定文本的宽度
 *  @param string xml内容
 *  @param font   默认的字体
 *  @return CGFloat
 */
+(CGFloat)getContentHeightWithWidth:(CGFloat)width
                         withText:(NSString*)text
                           withFont:(UIFont*)font;

/**
 *  计算某个富文本的实际宽度，这个方法不会触发渲染
 *
 *  @param string xml内容
 *  @param font   默认的字体
 *  @return CGFloat
 */
//+(CGFloat)getContentWidthWithText:(NSString*)text
//                         withFont:(UIFont*)font;


@end


@interface NSString (NSStringAddition)

/**
 *  去掉xml的特殊字符
 *
 *  @return string
 */
-(NSString*)xmlEscapeString;

@end


