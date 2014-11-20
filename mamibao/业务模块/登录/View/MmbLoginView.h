//
//  MmbLoginView.h
//  mamibao
//
//  Created by zhudong on 14/11/13.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MmbLoginViewDelegate <NSObject>

- (void)onClickFindPasswordBtn;
- (void)onClickRegisterBtn;
- (void)onClickSubmitBtn;

@end

@interface MmbLoginView : UIView

@property (nonatomic, strong) UITextField *mobileTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, weak) id<MmbLoginViewDelegate> delegate;

@end
