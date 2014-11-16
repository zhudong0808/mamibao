//
//  MmbLoginView.m
//  mamibao
//
//  Created by zhudong on 14/11/13.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbLoginView.h"

#define kMarginLeftAndRight 12
#define kMarginTopAndBottom 12
#define kTextFieldContainerHeight 42

@implementation MmbLoginView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = HEXCOLOR(0xfff9f8);
        UIImageView *defaultIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"defaultIcon"]];
        defaultIconView.frame = CGRectMake(APP_CONTENT_WIDTH/2 - 60/2, 16, 60, 60);
        [self addSubview:defaultIconView];
        
        UIView *mobileBGView = [[UIView alloc] initWithFrame:CGRectMake(kMarginLeftAndRight, defaultIconView.bottom + 10, APP_CONTENT_WIDTH - 2*kMarginLeftAndRight, kTextFieldContainerHeight)];
        mobileBGView.backgroundColor = HEXCOLOR(0xffffff);
        mobileBGView.layer.cornerRadius = 3;
        mobileBGView.layer.borderColor = HEXCOLOR(0xdddddd).CGColor;
        mobileBGView.layer.borderWidth = 0.5;
        [self addSubview:mobileBGView];
        
        UITextField *mobileTextField = [[UITextField alloc] initWithFrame:CGRectMake(kMarginLeftAndRight, kTextFieldContainerHeight/2-20/2, APP_CONTENT_WIDTH-4*kMarginLeftAndRight, 20)];
        mobileTextField.placeholder = @"手机号码";
        mobileTextField.textColor = HEXCOLOR(0x000000);
        mobileTextField.textAlignment = NSTextAlignmentLeft;
        mobileTextField.borderStyle = UITextBorderStyleNone;
        mobileTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        mobileTextField.backgroundColor = [UIColor clearColor];
        mobileTextField.font = [UIFont systemFontOfSize:16];
        mobileTextField.keyboardType = UIKeyboardTypeDecimalPad;
        [mobileBGView addSubview:mobileTextField];
    
        
        UIView *passwordBGView = [[UIView alloc] initWithFrame:CGRectMake(kMarginLeftAndRight, mobileBGView.bottom + kMarginTopAndBottom, APP_CONTENT_WIDTH - 2*kMarginLeftAndRight, kTextFieldContainerHeight)];
        passwordBGView.backgroundColor = HEXCOLOR(0xffffff);
        passwordBGView.layer.cornerRadius = 3;
        passwordBGView.layer.borderColor = HEXCOLOR(0xdddddd).CGColor;
        passwordBGView.layer.borderWidth = 0.5;
        [self addSubview:passwordBGView];
        
        UITextField *passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(kMarginLeftAndRight, kTextFieldContainerHeight/2-20/2, APP_CONTENT_WIDTH-4*kMarginLeftAndRight, 20)];
        passwordTextField.placeholder = @"密码";
        passwordTextField.textColor = HEXCOLOR(0x000000);
        passwordTextField.textAlignment = NSTextAlignmentLeft;
        passwordTextField.borderStyle = UITextBorderStyleNone;
        passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        passwordTextField.backgroundColor = [UIColor clearColor];
        passwordTextField.font = [UIFont systemFontOfSize:16];
        passwordTextField.secureTextEntry = YES;
        [passwordBGView addSubview:passwordTextField];
        
        
        UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        submitBtn.frame = CGRectMake(kMarginLeftAndRight, passwordBGView.bottom + kMarginTopAndBottom, APP_CONTENT_WIDTH - 2*kMarginLeftAndRight, kTextFieldContainerHeight);
        submitBtn.backgroundColor = HEXCOLOR(0xe33125);
        submitBtn.layer.cornerRadius = 3;
        [submitBtn setTitle:@"登录" forState:UIControlStateNormal];
        [submitBtn setTitleColor:HEXCOLOR(0xffffff) forState:UIControlStateNormal];
        submitBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:submitBtn];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
