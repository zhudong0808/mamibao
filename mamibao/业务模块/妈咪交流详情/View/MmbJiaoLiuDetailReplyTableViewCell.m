//
//  MmbJiaoLiuDetailReplyTableViewCell.m
//  mamibao
//
//  Created by zhudong on 14/12/15.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbJiaoLiuDetailReplyTableViewCell.h"
#import "MmbJiaoLiuDetailItem.h"
#import "TBCityCoreTextLabel.h"


@interface MmbJiaoLiuDetailReplyTableViewCell(){
    
}

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *authorLabel;

@property (nonatomic, strong) UILabel *desc;

@property (nonatomic, strong) UILabel *louLabel;

@property (nonatomic, strong) UILabel *dateLabel;

@property (nonatomic, strong) UILabel *subjectLabel;

@property (nonatomic, strong) UIView *bottomLine;

@property (nonatomic, strong) TBCityCoreTextLabel *contentTextLabel;

@property (nonatomic, strong) UIImageView *replyActionIconView;

@property (nonatomic, strong) UIButton *replyBtn;

@property (nonatomic, strong) NSString *tid;

@property (nonatomic, strong) NSString *pid;

@property (nonatomic, strong) NSString *lou;


@end

@implementation MmbJiaoLiuDetailReplyTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"defaultIcon"]];
        _iconImageView.frame = CGRectMake(kMarginLeftOrRight, kMarginTop, kIconWidth, kIconWidth);
        [self addSubview:_iconImageView];
        
        _authorLabel = [MmbViewUtil simpleLabel:CGRectMake(_iconImageView.right + 5, _iconImageView.top-2, 100, 20) bf:16 tc:HEXCOLOR(0x000000) t:@""];
        [self addSubview:_authorLabel];
        
        _desc = [MmbViewUtil simpleLabel:CGRectMake(_authorLabel.left, _authorLabel.bottom, APP_CONTENT_WIDTH-100 - _iconImageView.right,20) f:14 tc:HEXCOLOR(0x999999) t:@""];
        [self addSubview:_desc];
        
        _louLabel = [MmbViewUtil simpleLabel:CGRectMake(APP_CONTENT_WIDTH-kMarginLeftOrRight-100, _authorLabel.top, 100, 12) f:12 tc:HEXCOLOR(0x999999) t:@""];
        _louLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:_louLabel];
        
        _dateLabel = [MmbViewUtil simpleLabel:CGRectMake(APP_CONTENT_WIDTH-kMarginLeftOrRight-100, _desc.top, 100, 12) f:12 tc:HEXCOLOR(0x999999) t:@""];
        _dateLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:_dateLabel];
        
//        _subjectLabel = [MmbViewUtil simpleLabel:CGRectMake(kMarginLeftOrRight, _iconImageView.bottom+kMarginTopSmall, APP_CONTENT_WIDTH - 2*kMarginLeftOrRight, kSubjectHeight) bf:16 tc:HEXCOLOR(0x000000) t:@""];
//        _subjectLabel.textAlignment = NSTextAlignmentLeft;
//        _subjectLabel.numberOfLines = 2;
//        [self addSubview:_subjectLabel];
        
        _contentTextLabel = [[TBCityCoreTextLabel alloc] initWithFrame:CGRectMake(kMarginLeftOrRight, _iconImageView.bottom + kMarginTopSmall2, APP_CONTENT_WIDTH - 2*kMarginLeftOrRight, 20)];
        _contentTextLabel.textColor = HEXCOLOR(0x333333);
        _contentTextLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_contentTextLabel];
        
        _replyActionIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"replyActionIcon"]];
        _replyActionIconView.frame = CGRectMake(kMarginLeftOrRight, _contentTextLabel.bottom+5, 13, 12);
        [self addSubview:_replyActionIconView];
        
        _replyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _replyBtn.frame = CGRectMake(_replyActionIconView.right + 2, _replyActionIconView.top, 30, 12);
        [_replyBtn setTitle:@"回复" forState:UIControlStateNormal];
        [_replyBtn setTitleColor:HEXCOLOR(0xF89791) forState:UIControlStateNormal];
        [_replyBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [_replyBtn addTarget:self action:@selector(onclickReplyBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_replyBtn];
        
        _bottomLine = [MmbViewUtil drawLine:CGRectMake(0, self.height-1, APP_CONTENT_WIDTH, 0.5) onView:self color:HEXCOLOR(0xebe5e0)];
    }
    return self;
}

//setters
-(void)setItem:(MmbJiaoLiuDetailItem *)item{
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:item.iconUrl] placeholderImage:[UIImage imageNamed:@"defaultIcon.png"]];
    _authorLabel.text = item.author;
    _desc.text = item.desc;
    _louLabel.text = item.lou;
    _dateLabel.text = item.postTime;
    _contentTextLabel.text = item.content;
    CGFloat contentHeight = [TBCityCoreTextLabel getContentHeightWithWidth:APP_CONTENT_WIDTH-2*kMarginLeftOrRight withText:_contentTextLabel.text withFont:nil];
    _contentTextLabel.frame = CGRectMake(kMarginLeftOrRight, _iconImageView.bottom+kMarginTopSmall2, APP_CONTENT_WIDTH-2*kMarginLeftOrRight, contentHeight+kMarginTopSmall2);
    _replyActionIconView.frame = CGRectMake(kMarginLeftOrRight, _contentTextLabel.bottom + 5, 13, 12);
    _replyBtn.frame = CGRectMake(_replyActionIconView.right + 2, _replyActionIconView.top, 30, 12);
    _replyBtn.tag = [item.pid intValue];
    _bottomLine.frame = CGRectMake(0, item.itemHeight-1, APP_CONTENT_WIDTH, 0.5);
    
    _tid = item.tid;
    _pid = item.pid;
    _lou = item.lou;
    
}

- (void)onclickReplyBtn:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(onCellComponentClickedAtIndex:Bundle:)]) {
        [self.delegate onCellComponentClickedAtIndex:nil Bundle:@{@"tid":_tid,@"pid":_pid,@"lou":_lou}];
    }
}


@end
