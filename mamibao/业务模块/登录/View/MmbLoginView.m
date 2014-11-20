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

@interface MmbLoginView(){
}

@property (nonatomic, strong) UIButton *submitBtn;

@end

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
        [_mobileTextField addTarget:self action:@selector(updateSubmitBtn) forControlEvents:UIControlEventEditingChanged];
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
        [_passwordTextField addTarget:self action:@selector(updateSubmitBtn) forControlEvents:UIControlEventEditingChanged];
        [passwordBGView addSubview:_passwordTextField];
        
        
        _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _submitBtn.frame = CGRectMake(kMarginLeftAndRight, passwordBGView.bottom + kMarginTopAndBottom, APP_CONTENT_WIDTH - 2*kMarginLeftAndRight, kTextFieldContainerHeight);
        _submitBtn.backgroundColor = HEXCOLOR(0xcccccc);
        _submitBtn.layer.cornerRadius = 3;
        [_submitBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_submitBtn setTitleColor:HEXCOLOR(0xffffff) forState:UIControlStateNormal];
        _submitBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _submitBtn.enabled = NO;
        [_submitBtn addTarget:self action:@selector(onClickSubmitBtn) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_submitBtn];
        
        
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
    if ([self.delegate respondsToSelector:@selector(onClickRegisterBtn)]) {
        [self.delegate onClickRegisterBtn];
    }
}

- (void)updateSubmitBtn {
    if ([_mobileTextField.text length] > 0 || [_passwordTextField.text length] > 0) {
        _submitBtn.enabled = YES;
        _submitBtn.backgroundColor = HEXCOLOR(0xe33125);
    } else if ([_mobileTextField.text length] == 0 && [_passwordTextField.text length] == 0) {
        _submitBtn.enabled = NO;
        _submitBtn.backgroundColor = HEXCOLOR(0xcccccc);
    }
}

- (void)onClickSubmitBtn {
    NSString *mobileRegex = @"^((1[3|5|8|7][0-9])\\d{8}$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",mobileRegex];
    BOOL isMobile = [predicate evaluateWithObject:_mobileTextField.text];
    if (isMobile == NO) {
        [MmbGlobal showProgressHUD:@"手机号码格式错误" duration:2.0];
        return;
    } else {
        if ([self.delegate respondsToSelector:@selector(onClickSubmitBtn)]) {
            [self.delegate onClickSubmitBtn];
        }
    }
}

@end
