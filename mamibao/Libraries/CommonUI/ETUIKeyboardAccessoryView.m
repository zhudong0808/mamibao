//
//  ETUIKeyboardAccessoryView.m
//  etaoshopping
//
//  Created by moxin.xt on 12-11-8.
//
//

#import "ETUIKeyboardAccessoryView.h"

@implementation ETUIKeyboardAccessoryView

@synthesize delegate = _delegate;

- (void)dealloc
{
    _delegate = nil;
    //Unregister notifications
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - private


- (void) keyboardWillAppear:(NSNotification*)notification{
    
    //Get begin, ending rect and animation duration
    CGRect beginRect = [[notification.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endRect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat animDuration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    //Transform rects to local coordinates
    beginRect = [self fixKeyboardRect:beginRect];
    endRect = [self fixKeyboardRect:endRect];
    
    if (endRect.size.height == 252) {
        _isShowingExpend = YES;
    }
    else
        _isShowingExpend = NO;
    
    //Get this view begin and end rect
    CGRect selfBeginRect = CGRectMake(beginRect.origin.x,
                                      beginRect.origin.y - self.frame.size.height,
                                      beginRect.size.width,
                                      self.frame.size.height);
    CGRect selfEndingRect = CGRectMake(endRect.origin.x,
                                       endRect.origin.y - self.frame.size.height,
                                       endRect.size.width,
                                       self.frame.size.height);
    
    //Set view position and hidden
    self.frame = selfBeginRect;
    self.alpha = 0.0f;
    [self setHidden:NO];
    
    //If it's rotating, begin animation from current state
    UIViewAnimationOptions options = UIViewAnimationOptionAllowAnimatedContent;
    
    //Start the animation
    if ([self.delegate respondsToSelector:@selector(keyboardAccessoryViewWillAppear:)])
        [self.delegate keyboardAccessoryViewWillAppear:self];
//    [UIView animateWithDuration:animDuration delay:0.0f
//                        options:options
//                     animations:^(void){
//                         self.frame = selfEndingRect;
//                         self.alpha = 1.0f;
//                     }
//                     completion:^(BOOL finished){
                         self.frame = selfEndingRect;
                         self.alpha = 1.0f;
                         if ([self.delegate respondsToSelector:@selector(keyboardAccessoryViewDidAppear:)])
                             [self.delegate keyboardAccessoryViewDidAppear:self];
//                     }];
    
}


- (void) keyboardWillDisappear:(NSNotification*)notification
{

        //Get begin, ending rect and animation duration
        CGRect beginRect = [[notification.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
        CGRect endRect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
        CGFloat animDuration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
        
        //Transform rects to local coordinates
        beginRect = [self fixKeyboardRect:beginRect];
        endRect = [self fixKeyboardRect:endRect];
        
        //Get this view begin and end rect
        CGRect selfBeginRect = CGRectMake(beginRect.origin.x,
                                          beginRect.origin.y - self.frame.size.height,
                                          beginRect.size.width,
                                          self.frame.size.height);
        CGRect selfEndingRect = CGRectMake(endRect.origin.x,
                                           endRect.origin.y - self.frame.size.height,
                                           endRect.size.width,
                                           self.frame.size.height);
        
        //Set view position and hidden
        self.frame = selfBeginRect;
        self.alpha = 1.0f;
        
        
        //Animation options
        UIViewAnimationOptions options = UIViewAnimationOptionAllowAnimatedContent;
        
        //Animate view
        if ([self.delegate respondsToSelector:@selector(keyboardAccessoryViewWillDisappear:)])
            [self.delegate keyboardAccessoryViewWillDisappear:self];
        [UIView animateWithDuration:animDuration delay:0.0f
                            options:options
                         animations:^(void){
                             self.frame = selfEndingRect;
                             self.alpha = 0.0f;
                         }
                         completion:^(BOOL finished){
                             self.frame = selfEndingRect;
                             self.alpha = 0.0f;
                             [self setHidden:YES];
                             if ([self.delegate respondsToSelector:@selector(keyboardAccessoryViewDidDisappear:)])
                                 [self.delegate keyboardAccessoryViewDidDisappear:self];
                         }];
}


- (CGRect) fixKeyboardRect:(CGRect)originalRect{
    
    //Get the UIWindow by going through the superviews
    UIView * referenceView = self.superview;
    while ((referenceView != nil) && ![referenceView isKindOfClass:[UIWindow class]]){
        referenceView = referenceView.superview;
    }
    
    //If we finally got a UIWindow
    CGRect newRect = originalRect;
    if ([referenceView isKindOfClass:[UIWindow class]]){
        //Convert the received rect using the window
        UIWindow * myWindow = (UIWindow*)referenceView;
        newRect = [myWindow convertRect:originalRect toView:self.superview];
    }
    
    //Return the new rect (or the original if we couldn't find the Window -> this should never happen if the view is present)
    return newRect;
}



@end
