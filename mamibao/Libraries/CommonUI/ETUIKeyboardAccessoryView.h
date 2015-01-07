//
//  ETUIKeyboardAccessoryView.h
//  etaoshopping
//
//  Created by moxin.xt on 12-11-8.
//
//

#import <UIKit/UIKit.h>

@class ETUIKeyboardAccessoryView;

@protocol ETUIKeyboardAccessoryView <NSObject>

@optional

- (void) keyboardAccessoryViewWillAppear:(ETUIKeyboardAccessoryView*)keyboardCoView;
- (void) keyboardAccessoryViewDidAppear:(ETUIKeyboardAccessoryView*)keyboardCoView;
- (void) keyboardAccessoryViewWillDisappear:(ETUIKeyboardAccessoryView*)keyboardCoView;
- (void) keyboardAccessoryViewDidDisappear:(ETUIKeyboardAccessoryView*)keyboardCoView;


@end
@interface ETUIKeyboardAccessoryView : UIView


@property(nonatomic,assign,readonly) BOOL isShowingExpend;
@property(nonatomic,weak) id<ETUIKeyboardAccessoryView> delegate;

@end
