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
        
        _mobileTextField = [[UITextField alloc] initWithFrame:CGRectMake(kMarginLeftAndRight, kTextFieldContainerHeight/2-20/2, APP_CONTENT_WIDTH-4*kMarginLeftAndRight, 20)];
        _mobileTextField.placeholder = @"手机号码";
        _mobileTextField.textColor = HEXCOLOR(0x000000);
        _mobileTextField.textAlignment = NSTextAlignmentLeft;
        _mobileTextField.borderStyle = UITextBorderStyleNone;
        _mobileTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _mobileTextField.backgroundColor = [UIColor clearColor];
        _mobileTextField.font = [UIFont systemFontOfSize:16];
        _mobileTextField.keyboardType = UIKeyboardTypeDecimalPad;
        [mobileBGView addSubview:_mobileTextField];
    
        
        UIView *passwordBGView = [[UIView alloc] initWithFrame:CGRectMake(kMarginLeftAndRight, mobileBGView.bottom + kMarginTopAndBottom, APP_CONTENT_WIDTH - 2*kMarginLeftAndRight, kTextFieldContainerHeight)];
        passwordBGView.backgroundColor = HEXCOLOR(0xffffff);
        passwordBGView.layer.cornerRadius = 3;
        passwordBGView.layer.borderColor = HEXCOLOR(0xdddddd).CGColor;
        passwordBGView.layer.borderWidth = 0.5;
        [self addSubview:passwordBGView];
        
        _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(kMarginLeftAndRight, kTextFieldContainerHeight/2-20/2, APP_CONTENT_WIDTH-4*kMarginLeftAndRight, 20)];
        _passwordTextField.placeholder = @"密码";
        _passwordTextField.textColor = HEXCOLOR(0x000000);
        _passwordTextField.textAlignment = NSTextAlignmentLeft;
        _passwordTextField.borderStyle = UITextBorderStyleNone;
        _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTextField.backgroundColor = [UIColor clearColor];
        _passwordTextField.font = [UIFont systemFontOfSize:16];
        _passwordTextField.secureTextEntry = YES;
        [passwordBGView addSubview:_passwordTextField];
        
        
        UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        submitBtn.frame = CGRectMake(kMarginLeftAndRight, passwordBGView.bottom + kMarginTopAndBottom, APP_CONTENT_WIDTH - 2*kMarginLeftAndRight, kTextFieldContainerHeight);
        submitBtn.backgroundColor = HEXCOLOR(0xe33125);
        submitBtn.layer.cornerRadius = 3;
        [submitBtn setTitle:@"登录" forState:UIControlStateNormal];
        [submitBtn setTitleColor:HEXCOLOR(0xffffff) forState:UIControlStateNormal];
        submitBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:submitBtn];
        
        
        UIButton *findPasswordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        findPasswordBtn.frame = CGRectMake(kMarginLeftAndRight, self.height - 25 - 12, 60, 12);
        findPasswordBtn.backgroundColor = [UIColor clearColor];
        [findPasswordBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
        [findPasswordBtn setTitleColor:HEXCOLOR(0xe60000) forState:UIControlStateNormal];
        findPasswordBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [findPasswordBtn addTarget:self action:@selector(onClickFindPasswordBtn) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:findPasswordBtn];
        
        UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        registerBtn.frame = CGRectMake(APP_CONTENT_WIDTH - kMarginLeftAndRight - 60, findPasswordBtn.top, 60, 12);
        registerBtn.backgroundColor = [UIColor clearColor];
        [registerBtn setTitle:@"加入妈咪宝" forState:UIControlStateNormal];
        [registerBtn setTitleColor:HEXCOLOR(0xe60000) forState:UIControlStateNormal];
        registerBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [registerBtn addTarget:self action:@selector(onClickRegisterBtn) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:registerBtn];
        
        
    }
    return self;
}

- (void)onClickFindPasswordBtn {
    if ([self.delegate respondsToSelector:@selector(onClickFindPasswordBtn)]) {
        [self.delegate onClickFindPasswordBtn];
    }
}

- (void)onClickRegisterBtn {
    if ([self.delegate respondsToSelector:@selector(onCLickRegisterBtn)]) {
        [self.delegate onCLickRegisterBtn];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
