//
//  MmbStatusHandler.m
//  mamibao
//
//  Created by zhudong on 14-7-6.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbStatusHandler.h"

#define kErrorViewTag           12306
#define kEmptyViewTag           12307
#define kLoadingViewTag         12308

@implementation MmbStatusHandler

@synthesize statusInfo = _statusInfo;
@synthesize delegate = _delegate;


- (id)initWithStatusInfo:(MmbStatusInfo *)statusInfo delegate:(id<MmbStatusDelegate>)delegate {
    if (self = [super init]) {
        self.statusInfo = statusInfo;
        self.delegate = delegate;
    }
    return self;
}

- (void)removeStatusViewFromView:(UIView *)view {
    [self removeStatusViewFromView:view hideLoading:YES];
}

- (void)showLoadingViewInView:(UIView *)parentView frame:(CGRect)frame {
    UIView *loadingView = [parentView viewWithTag:kLoadingViewTag];
    [loadingView removeFromSuperview];
    
    if (frame.size.height==0) {
        frame = CGRectMake(0, 0, parentView.width, parentView.height*2.0/3);
    }
    UIView* view = [self loadingView:frame];
    view.tag = kLoadingViewTag;
    [parentView addSubview:view];
    return;
}
//
//- (UIView *)showViewforError:(NSError *)error inView:(UIView *)parentView frame:(CGRect)frame {
//    if(error && [error isKindOfClass:[TBErrorResponse class]]) {
//        TBErrorResponse *tbError = (TBErrorResponse *)error;
//        if ([tbError isInvalidSIDError]) {
//            return nil;
//        }
//    }
//    
//    return [self showViewforError:error inView:parentView frame:frame actionTarget:self.delegate actionSelector:[self.delegate selectorForError:error]];
//}
//
//
//- (UIView *)showViewforError:(NSError *)error inView:(UIView *)parentView frame:(CGRect)frame actionTarget:(id)actionTarget actionSelector:(SEL)actionSelector {
//    UIView *errorView = [parentView viewWithTag:kErrorViewTag];
//    [errorView removeFromSuperview];
//    
//    UIView* view = [self errorViewWithFrame:frame error:error actionTarget:actionTarget actionSelector:actionSelector];
//    view.tag = kErrorViewTag;
//    [parentView addSubview:view];
//    return view;
//}


#pragma mark - private methods
- (void)hideLoadingView {
}

- (void)removeStatusViewFromView:(UIView *)parentView hideLoading:(BOOL)hideLoading{
    UIView *errorView = nil;
    UIView* emptyView = nil;
    UIView *loadingView = nil;
    for (UIView* subView in parentView.subviews) {
        if (kErrorViewTag == subView.tag) {
            errorView = subView;
        }
        if (kEmptyViewTag == subView.tag) {
            emptyView = subView;
        }
        if (kLoadingViewTag == subView.tag) {
            loadingView = subView;
        }
    }
    
    [errorView removeFromSuperview];
    [emptyView removeFromSuperview];
    [loadingView removeFromSuperview];
    
    if (hideLoading) {
        [self hideLoadingView];
    }
}

- (UIView *)loadingView:(CGRect)frame {
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,APP_SCREEN_WIDTH, 200)];
    contentView.backgroundColor = [UIColor clearColor];
    contentView.left = frame.origin.x + (frame.size.width-contentView.width)/2;
    contentView.top = frame.origin.y +(frame.size.height-contentView.height)/2;
    
    UIActivityIndicatorView *act = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [act startAnimating];
    [contentView addSubview:act];
    act.left =(contentView.width-act.width)/2;
    act.top = (contentView.height-act.height)/2;
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, act.bottom+5,contentView.width, 20)];
    title.backgroundColor = [UIColor clearColor];
    title.textColor = RGBCOLOR(0x66, 0x66, 0x66);
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont systemFontOfSize:14];
    title.text = @"加载中...";
    [contentView addSubview:title];
    
    return contentView;
}

//- (UIView *)errorViewWithFrame:(CGRect)frame error:(NSError *)error actionTarget:(id)actionTarget actionSelector:(SEL)actionSelector {
//    
//    NSString* title = @"";
//    NSString* subtitle = @"";
//    UIImage* image = nil;
//    NSString* btnTitle = @"";
//    
//    title = [self.errorInfo titleForError:error];
//    subtitle = [self.errorInfo subTitleForError:error];
//    image = [self.errorInfo imageForError:error];
//    btnTitle = [self.errorInfo actionButtonTitleForError:error];
//    //////////////////////////////////////////////////////////////////////////////////////////////////////
//    
//    
//    if (title.length || subtitle.length || image) {
//        TBCityErrorView * aErrorView;
//        if (self.selectorForErrorBlock!=0) {
//            aErrorView = [[TBCityErrorView alloc] initWithImage:image
//                                                          title:title
//                                                       subtitle:subtitle
//                                              actionButtonTitle:btnTitle
//                                                         target:self
//                                                       selector:@selector(selectorForError:)];
//        } else{
//            
//            aErrorView = [[TBCityErrorView alloc] initWithImage:image
//                                                          title:title
//                                                       subtitle:subtitle
//                                              actionButtonTitle:btnTitle
//                                                         target:actionTarget
//                                                       selector:actionSelector];
//        }
//        
//        aErrorView.backgroundColor = [UIColor colorWithWhite:245/255.0f alpha:1.0f];
//        aErrorView.frame = frame;
//        return aErrorView;
//    }
//    return nil;
//}



@end
