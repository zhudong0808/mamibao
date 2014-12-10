//
//  CoreTextView.m
//  CoreText
//
//  Created by SunX on 14-4-9.
//  Copyright (c) 2014年 SunX. All rights reserved.
//

#import "TBCityCoreTextLabel.h"
#import "UIImageView+WebCache.h"

@interface TBCityCoreTextLabel () <NSXMLParserDelegate>
{
    BOOL         _loadTextFinish;
}

@property (nonatomic,assign) BOOL                           drawText;
@property (nonatomic,copy)   NSMutableAttributedString*     attributedString;

@end

@implementation TBCityCoreTextLabel

- (id)initWithFrame:(CGRect)frame
         withText:(NSString*)string {
    frame.size.height += 3;     //额外增加3个像素，避免用户输入高度不够
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _drawText = YES;
        self.text = string;
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
        withHandle:(CoreTextClickBlock)handle {
    frame.size.height += 3;     //额外增加3个像素，避免用户输入高度不够
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _drawText = YES;
        self.clickBlock = handle;
    }
    return self;
}

+(void)showInView:(UIView*)view
        withFrame:(CGRect)frame
         withText:(NSString*)text
       withHandle:(CoreTextClickBlock)handle {
    TBCityCoreTextLabel *label = [[TBCityCoreTextLabel alloc] initWithFrame:frame withHandle:handle];
    label.text = text;
    [view addSubview:label];
}

-(void)setText:(NSString *)text{
    if (_text!=text) {
        _text = [text copy];
    }
    if ([_text length]<1) {
        return;
    }
    //解析text的内容
    if (_text) {
        for (UIView *view in self.subviews) {
            [view removeFromSuperview];
        }
        self.parser = nil;
        self.parser = [[TBCityCoreTextParser alloc] init];
        self.parser.lineSpace = self.lineSpace;
        self.parser.textColor = self.textColor;
        self.parser.font = self.font;
        [self.parser buildAttributedString:_text];
        self.attributedString = self.parser.attributedString;
    }
}

-(void)attributedStringWithParser:(TBCityCoreTextParser*)parser {
    if (_parser!=parser) {
        _parser = parser;
        self.attributedString = parser.attributedString;
    }
}

-(void)setAttributedString:(NSMutableAttributedString *)attributedString {
    _attributedString = attributedString;
    if (_attributedString) {
        [self setNeedsDisplay];
        self.userInteractionEnabled = self.clickBlock?YES:NO;
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _drawText = YES;
    }
    return self;
}


-(void)drawRect:(CGRect)rect {
    _textHeight = 0.f;
    _textWidth = self.frame.size.width;
    if (!self.drawText||[self.attributedString length]<1) {
        return;
    }
    
    //设置NSMutableAttributedString的所有属性
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //设置字形变换矩阵为CGAffineTransformIdentity，也就是说每一个字形都不做图形变换
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    
    CGAffineTransform flipVertical = CGAffineTransformMake(1,0,0,-1,0,self.bounds.size.height);
    CGContextConcatCTM(context, flipVertical);//将当前context的坐标系进行flip
    
    CTFramesetterRef ctFramesetter = CTFramesetterCreateWithAttributedString((CFMutableAttributedStringRef)self.attributedString);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect bounds = CGRectMake(0.0, 0.0, self.bounds.size.width, self.bounds.size.height);
    CGPathAddRect(path, NULL, bounds);
    
    CTFrameRef ctFrame = CTFramesetterCreateFrame(ctFramesetter,CFRangeMake(0, 0), path, NULL);
    
    //获取实际高度
    CFArrayRef lines = CTFrameGetLines(ctFrame);
    CFIndex lintCount = CFArrayGetCount(lines);
    CGPoint lineOrigins[lintCount];
    CTFrameGetLineOrigins(ctFrame, CFRangeMake(0, 0), lineOrigins);
    
    //最后一行
    CGPoint lineOrigin = lineOrigins[(lintCount-1)];
    //+3是补误差值，
    _textHeight = ceil(self.frame.size.height-lineOrigin.y)+3;
    
    //获取当前label的宽度
    if (lintCount>0){
        CTLineRef line = CFArrayGetValueAtIndex(lines, 0);
        CGRect rect;
        if ([UIDevice currentDevice].systemVersion.floatValue<6.f) {
            rect =  CTLineGetImageBounds(line,context);
        }
        else {
            rect = CTLineGetBoundsWithOptions(line,kCTLineBoundsExcludeTypographicLeading);
        }
        _textWidth = rect.size.width;
    }
    
    //画图片
    [self drawImage:context arrayRef:lines lineOrigins:lineOrigins path:path];
    
    CTFrameDraw(ctFrame, context);
    CFRelease(path);
    CFRelease(ctFrame);
    CFRelease(ctFramesetter);
    
    if (self.drawFinishBlock) {
        self.drawFinishBlock(self);
    }
    if (self.clickBlock) {
        self.clickBlock(nil,self);
    }
}

-(void)drawImage:(CGContextRef)context
        arrayRef:(CFArrayRef)lines
     lineOrigins:(CGPoint[])lineOrigins
            path:(CGMutablePathRef)path{
    //需要画图或者背景色才进入此方法
    if(!self.parser.needDrawExtraView) {
        return;
    }
    for (int i = 0; i < CFArrayGetCount(lines); i++) {
        CTLineRef line = CFArrayGetValueAtIndex(lines, i);
        CFArrayRef runs = CTLineGetGlyphRuns(line);
        CGPoint lineOrigin = lineOrigins[i];
        //查看每行的CTRun
        for (int j = 0; j < CFArrayGetCount(runs); j++) {
            CTRunRef run = CFArrayGetValueAtIndex(runs, j);
            
            //每个run的frame
            CGFloat runAscent;
            CGFloat runDescent;
            CGRect runRect;
            runRect.size.width = CTRunGetTypographicBounds(run, CFRangeMake(0,0), &runAscent, &runDescent, NULL);
            runRect=CGRectMake(lineOrigin.x + CTLineGetOffsetForStringIndex(line,
                                                                            CTRunGetStringRange(run).location, NULL),
                               lineOrigin.y - runDescent, runRect.size.width, runAscent + runDescent);
            
            NSDictionary* attributes = (NSDictionary*)CTRunGetAttributes(run);
            NSString *imageUrl = [attributes objectForKey:@"imageUrl"];
            //计算每行的实际宽度
            //图片渲染逻辑
            if (imageUrl) {
                CGRect imageDrawRect;
                imageDrawRect.size = CGSizeFromString(attributes[@"imageSize"]);
                imageDrawRect.origin.x = roundf(runRect.origin.x + lineOrigin.x);
                imageDrawRect.origin.y =  lineOrigin.y - 2;
                UIImage *image;
                //本地资源图片
                if ([imageUrl hasPrefix:@"bundle://"]) {
                    image = [UIImage imageNamed:[imageUrl stringByReplacingOccurrencesOfString:@"bundle://" withString:@""]];
                }
                //网络图片 SDWebImage 实现
                else if ([imageUrl hasPrefix:@"http://"]) {
                    //下载是一个异步的过程，所以不能用draw实现，因为context的坐标系是反过来的，所以需要这样调整y轴
                    imageDrawRect.origin.y = self.frame.size.height - lineOrigin.y - imageDrawRect.size.height;
                    UIImageView *imageView =  [[UIImageView alloc] initWithFrame:imageDrawRect];
                    imageView.contentMode = UIViewContentModeScaleAspectFit;
                    imageView.clipsToBounds = YES;
                    [self addSubview:imageView];
                    [imageView setImageWithURL:[NSURL URLWithString:imageUrl]];
                }
                else if([imageUrl hasPrefix:@"file://"]) {
                    image = [UIImage imageWithContentsOfFile:imageUrl];
                }
                //本地缓存图片
                else if(self.imageDic){
                    image = self.imageDic[imageUrl];
                }
                if (image) {
                    CGContextDrawImage(context, imageDrawRect, image.CGImage);
                }
            }
            UIColor *bgColor = [attributes objectForKey:@"bgColor"];
            if (bgColor) {
                const CGFloat *components = CGColorGetComponents(bgColor.CGColor);
                //画一个矩形
                runRect.origin.y += 1; //这里有点奇怪，像素位不准
                CGContextSetRGBFillColor(context,components[0], components[1], components[2], 1.0);
                CGContextFillRect(context, runRect);
            }
            
            NSString *midLine = attributes[@"midLine"];
            if (midLine) {
                UIColor *midLineColor = [attributes objectForKey:@"midLineColor"];
                const CGFloat *component =  CGColorGetComponents(midLineColor.CGColor);
                //中划线
                CGContextSetRGBStrokeColor(context, component[0], component[1], component[2], 1.0);
                CGContextSetLineWidth(context, [midLine floatValue]);
                CGContextMoveToPoint(context, runRect.origin.x, runRect.origin.y+runRect.size.height/2);
                CGContextAddLineToPoint(context, runRect.origin.x+runRect.size.width, runRect.origin.y+runRect.size.height/2);
                CGContextStrokePath(context);
            }
        }
    }
}

#pragma mark -
//接受触摸事件
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //没有href标签直接跳出touch
    if (!self.clickBlock) {
        return;
    }
    
    CTFramesetterRef ctFramesetter = CTFramesetterCreateWithAttributedString((CFMutableAttributedStringRef)self.attributedString);
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect bounds = CGRectMake(0.0, 0.0, self.bounds.size.width, self.bounds.size.height);
    CGPathAddRect(path, NULL, bounds);
    CTFrameRef ctFrame = CTFramesetterCreateFrame(ctFramesetter,CFRangeMake(0, 0), path, NULL);
    
    //获取UITouch对象
    UITouch *touch = [touches anyObject];
    //获取触摸点击当前view的坐标位置
    CGPoint location = [touch locationInView:self];
    //获取每一行
    CFArrayRef lines = CTFrameGetLines(ctFrame);
    CGPoint origins[CFArrayGetCount(lines)];
    //获取每行的原点坐标
    CTFrameGetLineOrigins(ctFrame, CFRangeMake(0, 0), origins);
    CTLineRef line = NULL;
    CGPoint lineOrigin = CGPointZero;
    //获取整个CTFrame的大小
    CGRect rect = CGPathGetBoundingBox(path);
    for (int i= 0; i < CFArrayGetCount(lines); i++)
    {
        CGPoint origin = origins[i];
        //坐标转换，把每行的原点坐标转换为uiview的坐标体系
        CGFloat y = rect.origin.y + rect.size.height - origin.y;
        //判断点击的位置处于那一行范围内
        if ((location.y <= y) && (location.x >= origin.x))
        {
            line = CFArrayGetValueAtIndex(lines, i);
            lineOrigin = origin;
            break;
        }
    }
    location.x -= lineOrigin.x;
    //获取点击位置所处的字符位置，就是相当于点击了第几个字符
    CFIndex index = CTLineGetStringIndexForPosition(line, location);
    //判断index在哪个attribute的区间
    for (TBCityCoreTextAttribute *attr in self.parser.nodesArray) {
        if (index>=attr.attributeRange.location
            &&index<=(attr.attributeRange.location+attr.attributeRange.length)
            &&attr.href) {
            self.clickBlock(attr.href,self);
            break;
        }
    }
    CFRelease(path);
    CFRelease(ctFrame);
    CFRelease(ctFramesetter);
}



#pragma mark -
+(CGFloat)getContentHeightWithWidth:(CGFloat)width
                           withText:(NSString*)string
                           withFont:(UIFont*)font{
    if ([string length]<1) {
        return 0;
    }
    TBCityCoreTextLabel *view = [[TBCityCoreTextLabel alloc] initWithFrame:CGRectMake(0, 0, width, 2000)];
    view.font = font;
    view.drawText = NO;
    view.text = string;
    
    if ([view.attributedString length]<1) {
        NSLog(@"====XML无法解析内容或者内容为空====%@",string);
        return 0;
    }
    
    CTFramesetterRef ctFramesetter = CTFramesetterCreateWithAttributedString((CFMutableAttributedStringRef)view.attributedString);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect bounds = CGRectMake(0.0, 0.0, view.bounds.size.width, view.bounds.size.height);
    CGPathAddRect(path, NULL, bounds);
    
    CTFrameRef ctFrame = CTFramesetterCreateFrame(ctFramesetter,CFRangeMake(0, 0), path, NULL);
    CFArrayRef lines = CTFrameGetLines(ctFrame);
    CGPoint lineOrigins[CFArrayGetCount(lines)];
    CTFrameGetLineOrigins(ctFrame, CFRangeMake(0, 0), lineOrigins);
    CGPoint lineOrigin = lineOrigins[(CFArrayGetCount(lines)-1)];
    //+3是补误差值，
    CGFloat height = ceil(view.frame.size.height-lineOrigin.y)+3;
    
    CFRelease(path);
    CFRelease(ctFrame);
    CFRelease(ctFramesetter);
    
    return height;
}

#pragma mark -

+(CGFloat)getContentWidthWithText:(NSString*)string withFont:(UIFont*)font{
    if ([string length]<1) {
        return 0;
    }
    TBCityCoreTextLabel *view = [[TBCityCoreTextLabel alloc] initWithFrame:CGRectMake(0, 0, 2000, 2000)];
    view.font = font;
    view.drawText = NO;
    view.text = string;
    
    if ([view.attributedString length]<1) {
        NSLog(@"====XML无法解析内容或者内容为空====%@",string);
        return 0;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CTFramesetterRef ctFramesetter = CTFramesetterCreateWithAttributedString((CFMutableAttributedStringRef)view.attributedString);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect bounds = CGRectMake(0.0, 0.0, view.bounds.size.width, view.bounds.size.height);
    CGPathAddRect(path, NULL, bounds);
    
    CTFrameRef ctFrame = CTFramesetterCreateFrame(ctFramesetter,CFRangeMake(0, 0), path, NULL);
    CFArrayRef lines = CTFrameGetLines(ctFrame);
    
    //计算第一行的CTRun的宽度
    CTLineRef line = CFArrayGetValueAtIndex(lines, 0);
    
    CGRect rect;
    if ([UIDevice currentDevice].systemName.floatValue<6.f) {
        rect =  CTLineGetImageBounds(line,context);
    }
    else {
        rect = CTLineGetBoundsWithOptions(line,kCTLineBoundsExcludeTypographicLeading);
    }
    CFRelease(path);
    CFRelease(ctFrame);
    CFRelease(ctFramesetter);
    
    return rect.size.width;
}

@end


@implementation NSString (NSStringAddition)

/**
 *  去掉xml的特殊字符
 *
 *  @return string
 */
-(NSString*)xmlEscapeString {
    return [NSString stringWithFormat:@"<![CDATA[%@]]>",self];
}

@end
