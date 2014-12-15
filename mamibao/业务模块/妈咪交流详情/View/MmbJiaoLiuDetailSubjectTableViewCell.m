//
//  MmbIndexTableViewCell.m
//  mamibao
//
//  Created by zhudong on 14-7-29.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbJiaoLiuDetailSubjectTableViewCell.h"
#import "MmbJiaoLiuDetailItem.h"
#import "TBCityCoreTextLabel.h"

@interface MmbJiaoLiuDetailSubjectTableViewCell(){

}

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *authorLabel;

@property (nonatomic, strong) UILabel *desc;

@property (nonatomic, strong) UILabel *subjectLabel;

@property (nonatomic, strong) TBCityCoreTextLabel *contentTextLabel;

@property (nonatomic, strong) TBCityCoreTextLabel *leftCoreTextLabel;

@property (nonatomic, strong) TBCityCoreTextLabel *rightCoreTextLabel;

@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation MmbJiaoLiuDetailSubjectTableViewCell

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
        
        
        _subjectLabel = [MmbViewUtil simpleLabel:CGRectMake(kMarginLeftOrRight, _iconImageView.bottom+kMarginTopSmall, APP_CONTENT_WIDTH - 2*kMarginLeftOrRight, kSubjectHeight) bf:16 tc:HEXCOLOR(0x000000) t:@""];
        _subjectLabel.textAlignment = NSTextAlignmentLeft;
        _subjectLabel.numberOfLines = 2;
        [self addSubview:_subjectLabel];
        
        
        _contentTextLabel = [[TBCityCoreTextLabel alloc] initWithFrame:CGRectMake(kMarginLeftOrRight, _subjectLabel.bottom + kMarginTopSmall2, APP_CONTENT_WIDTH - 2*kMarginLeftOrRight, 20)];
        _contentTextLabel.textColor = HEXCOLOR(0x333333);
        _contentTextLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_contentTextLabel];
        
        _leftCoreTextLabel = [[TBCityCoreTextLabel alloc] initWithFrame:CGRectMake(kMarginLeftOrRight, _contentTextLabel.bottom, APP_CONTENT_WIDTH/2 - kMarginLeftOrRight, 15)];
        _leftCoreTextLabel.textColor = HEXCOLOR(0x999999);
        _leftCoreTextLabel.font = [UIFont systemFontOfSize:12];
        _leftCoreTextLabel.text = @"";
        [self addSubview:_leftCoreTextLabel];

        _rightCoreTextLabel = [[TBCityCoreTextLabel alloc] initWithFrame:CGRectMake(APP_CONTENT_WIDTH/2, _contentTextLabel.bottom, APP_CONTENT_WIDTH/2 - kMarginLeftOrRight, 15)];
        _rightCoreTextLabel.textColor = HEXCOLOR(0x999999);
        _rightCoreTextLabel.font = [UIFont systemFontOfSize:12];
        _rightCoreTextLabel.text = @"";
        _rightCoreTextLabel.drawFinishBlock = ^(TBCityCoreTextLabel* label){
            label.left = APP_CONTENT_WIDTH - kMarginLeftOrRight - label.textWidth;
        };
        [self addSubview:_rightCoreTextLabel];
        
        _bottomLine = [MmbViewUtil drawLine:CGRectMake(0, self.height-1, APP_CONTENT_WIDTH, 0.5) onView:self color:HEXCOLOR(0xebe5e0)];
    }
    return self;
}

//setters
-(void)setItem:(MmbJiaoLiuDetailItem *)item{
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:item.iconUrl] placeholderImage:[UIImage imageNamed:@"defaultIcon.png"]];
    _authorLabel.text = item.author;
    _desc.text = item.desc;
    _subjectLabel.text = item.subject;
    _contentTextLabel.text = item.content;
    CGFloat contentHeight = [TBCityCoreTextLabel getContentHeightWithWidth:APP_CONTENT_WIDTH-2*kMarginLeftOrRight withText:_contentTextLabel.text withFont:nil];
    _contentTextLabel.frame = CGRectMake(kMarginLeftOrRight, _subjectLabel.bottom + 10, APP_CONTENT_WIDTH-2*kMarginLeftOrRight, contentHeight);
    
    _leftCoreTextLabel.frame = CGRectMake(kMarginLeftOrRight, _contentTextLabel.bottom + kMarginTopSmall2, APP_CONTENT_WIDTH/2 - kMarginLeftOrRight, 15);
    _leftCoreTextLabel.text = item.postTime;
    
    _rightCoreTextLabel.frame = CGRectMake(APP_CONTENT_WIDTH/2, _contentTextLabel.bottom + kMarginTopSmall2, APP_CONTENT_WIDTH/2 - kMarginLeftOrRight, 15);
    _rightCoreTextLabel.text = [NSString stringWithFormat:@"<img src='bundle://readIcon' width='15' height='10' /> %@    <img src='bundle://replyIcon' width='13' height='11' /> %@",item.readCount,item.replyCount];
    
    _bottomLine.frame = CGRectMake(0, self.height-1, APP_CONTENT_WIDTH, 0.5);
}

#pragma mark - override

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
