//
//  TBErrorView.m
//  taobao4iphone
//
//  Created by Cao Tim on 11-10-28.
//  Copyright (c) 2011年 Taobao.com. All rights reserved.
//

#import "MmbErrorView.h"

@implementation MmbErrorView

@synthesize titleLabel = _titleLabel;
@synthesize subtitleLabel = _subtitleLabel;
@synthesize actionButton = _actionButton;
@synthesize footerView = _footerView;
@synthesize headerView = _headerView;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma -
#pragma mark NSObject


- (UIImage *)resizableImageFromImage:(UIImage *)image withCapInsets:(UIEdgeInsets)capInsets {
    if ([image respondsToSelector:@selector(resizableImageWithCapInsets:)]) {
        return [image resizableImageWithCapInsets:capInsets];
    }else{
        return [image stretchableImageWithLeftCapWidth:capInsets.left topCapHeight:capInsets.top];
    }
}


- (id)initWithImage:(UIImage*)image title:(NSString*)title subtitle:(NSString*)subtitle actionButtonTitle:(NSString*)actionButtonTitle target:(id)target selector:(SEL)selector {
    UIImage *actionImage = [self resizableImageFromImage:[UIImage imageNamed:@"LLActionButtonBg.png"] withCapInsets:UIEdgeInsetsMake(0, 4, 0, 4)];
    UIImage *actionHighlightImage = [self resizableImageFromImage:[UIImage imageNamed:@"LLActionButtonBgHighlighted.png"] withCapInsets:UIEdgeInsetsMake(0, 4, 0, 4)];
    
    
    return [self initWithImage:image
                         title:title
                      subtitle:subtitle
             actionButtonTitle:actionButtonTitle
             actionButtonImage:actionImage
   actionButtonHighligtedImage:actionHighlightImage
                        target:target
                      selector:selector];
}


- (id)initWithImage:(UIImage*)image title:(NSString*)title subtitle:(NSString*)subtitle actionButtonTitle:(NSString*)actionButtonTitle actionButtonImage:(UIImage*)actionButtonImage actionButtonHighligtedImage:(UIImage*)actionButtonHighlightedImage target:(id)target selector:(SEL)selector {
    UIButton* actionButton = nil;
    if (target && selector) {
        actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [actionButton setTitle:actionButtonTitle forState:UIControlStateNormal];
        [actionButton setTitleColor:[UIColor colorWithRed:95/255.0f green:100/255.0f blue:110/255.0f alpha:1.0f] forState:UIControlStateNormal];
        [actionButton setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
        actionButton.titleLabel.shadowOffset = CGSizeMake(0, 1);
        actionButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [actionButton setTitleEdgeInsets:UIEdgeInsetsMake(10, 20, 10, 20)];
        [actionButton setBackgroundImage:actionButtonImage forState:UIControlStateNormal];
        [actionButton setBackgroundImage:actionButtonHighlightedImage forState:UIControlStateSelected];
        [actionButton setBackgroundImage:actionButtonHighlightedImage forState:UIControlStateHighlighted];
        [actionButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    return [self initWithImage:image title:title subtitle:subtitle actionButton:actionButton];
}

- (id)initWithImage:(UIImage*)image title:(NSString*)title subtitle:(NSString*)subtitle actionButton:(UIButton*)actionButton {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _imageView = [[UIImageView alloc] initWithImage:image];
        _imageView.backgroundColor = self.backgroundColor;
        [self addSubview:_imageView];
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [_titleLabel setFrame:CGRectMake(0, 0, self.size.width, 10)];
        _titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _titleLabel.backgroundColor = self.backgroundColor;
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.textColor = [UIColor colorWithRed:.24 green:.26 blue:.27 alpha:1];
        _titleLabel.textAlignment = UITextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
        _titleLabel.text = title;
        [self addSubview:_titleLabel];
        
        _subtitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _subtitleLabel.backgroundColor = self.backgroundColor;
        _subtitleLabel.font = [UIFont systemFontOfSize:14];
        _subtitleLabel.textColor = [UIColor colorWithWhite:170/255.0f alpha:1.0f];
        _subtitleLabel.textAlignment = UITextAlignmentCenter;
        _subtitleLabel.numberOfLines = 0;
        _subtitleLabel.text = subtitle;
        [_subtitleLabel setFrame:CGRectMake(0, 0, self.size.width, 10)];
        _subtitleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addSubview:_subtitleLabel];
        if (actionButton) {
            _actionButton = actionButton;
            _actionButton.backgroundColor = self.backgroundColor;
            [self addSubview:_actionButton];
        }
    }
    return self;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma -
#pragma mark UIView

- (void)layoutSubviews {
    [_imageView sizeToFit];
    [_titleLabel sizeToFit];
    [_subtitleLabel sizeToFit];
    [_actionButton sizeToFit];

    CGFloat headerMargin = _headerView ? 10 : 0;
    CGFloat margin1 = 3;                               // margin below image view
    CGFloat margin2 = _titleLabel.height>0 ? 12 : 0;    // margin below title view
    CGFloat margin3 = _subtitleLabel.height>0 ? 12 : 0; // margin below sub title view
    CGFloat margin4 = 20;                               // margin below action button
    CGFloat footerMargin = _footerView ? 10.0f : 0;
    [self addSubview:_headerView];
    [self addSubview:_footerView];
    
    CGFloat totalHeight = _headerView.size.height + headerMargin + _imageView.height + margin1 + _titleLabel.height + margin2 + _subtitleLabel.height + margin3 + _actionButton.height + (_actionButton?margin4:0) + _footerView.size.height + footerMargin;
    
    CGFloat top = floor(self.height/2 - totalHeight/2);
    
    _headerView.frame = CGRectMake(floor(self.width/2.0f - _headerView.width/2.0f), top, _headerView.width, _headerView.height);
    
    top = top + _headerView.height + headerMargin;
    _imageView.frame = CGRectMake(floor(self.width/2 - _imageView.width/2), top, 
                                  _imageView.width, _imageView.height);
    top = _imageView.bottom + margin1;
    _titleLabel.frame = CGRectMake(0, top,
                                   self.size.width, _titleLabel.height);
    top = _titleLabel.bottom + margin2;
    _subtitleLabel.frame = CGRectMake(10, top,
                                      self.size.width - 20, _subtitleLabel.height);
    
    top = _subtitleLabel.bottom + margin3;
    _actionButton.frame = CGRectMake(floor(self.width/2 - _actionButton.width/2), top,
                                     _actionButton.width, _actionButton.height);
    
    top = top + _actionButton.height + footerMargin;
    _footerView.frame = CGRectMake(floor(self.width/2.0f - _footerView.width/2.0f), top, _footerView.width, _footerView.height);
}

@end
