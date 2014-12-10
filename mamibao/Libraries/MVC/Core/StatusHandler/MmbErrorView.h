//
//  TBErrorView.h
//  taobao4iphone
//
//  Created by Cao Tim on 11-10-28.
//  Copyright (c) 2011年 Taobao.com. All rights reserved.
//


@interface MmbErrorView : UIView {
    
    UIImageView*        _imageView;
    UILabel*            _titleLabel;
    UILabel*            _subtitleLabel;
    UIButton*           _actionButton;
    UIView              *_footerView;
    UIView              *_headerView;
}

@property (nonatomic, retain) UILabel   *titleLabel;
@property (nonatomic, retain) UILabel   *subtitleLabel;
@property (nonatomic, retain) UIButton  *actionButton;
@property (nonatomic, retain) UIView    *footerView;
@property (nonatomic, retain) UIView    *headerView;

- (id)initWithImage:(UIImage*)image
              title:(NSString*)title
           subtitle:(NSString*)subtitle
  actionButtonTitle:(NSString*)actionButtonTitle
             target:(id)target
           selector:(SEL)selector;

- (id)initWithImage:(UIImage*)image
              title:(NSString*)title
           subtitle:(NSString*)subtitle
  actionButtonTitle:(NSString*)actionButtonTitle
  actionButtonImage:(UIImage*)actionButtonImage
actionButtonHighligtedImage:(UIImage*)actionButtonHighlightedImage
             target:(id)target
           selector:(SEL)selector;

- (id)initWithImage:(UIImage*)image
              title:(NSString*)title
           subtitle:(NSString*)subtitle
       actionButton:(UIButton*)actionButton;

@end
