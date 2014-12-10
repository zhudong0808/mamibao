//
//  MmbIndexTableViewCell.m
//  mamibao
//
//  Created by zhudong on 14-7-29.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbJiaoLiuTableViewCell.h"
#import "MmbJiaoLiuItem.h"
#import "TBCityCoreTextLabel.h"

#define kMarginLeftOrRight 15

@interface MmbJiaoLiuTableViewCell(){

}

@property (nonatomic, strong) UILabel *subjectLabel;

@property (nonatomic, strong) TBCityCoreTextLabel *leftCoreTextLabel;

@property (nonatomic, strong) TBCityCoreTextLabel *rightCoreTextLabel;

@end

@implementation MmbJiaoLiuTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _subjectLabel = [MmbViewUtil simpleLabel:CGRectMake(kMarginLeftOrRight, 10, APP_CONTENT_WIDTH -2 * kMarginLeftOrRight,20) f:16 tc:HEXCOLOR(0x000000) t:@""];
        [self addSubview:_subjectLabel];
        
        _leftCoreTextLabel = [[TBCityCoreTextLabel alloc] initWithFrame:CGRectMake(kMarginLeftOrRight, self.height - 10, APP_CONTENT_WIDTH/2 - kMarginLeftOrRight, 15)];
        _leftCoreTextLabel.textColor = HEXCOLOR(0x999999);
        _leftCoreTextLabel.font = [UIFont systemFontOfSize:12];
        _leftCoreTextLabel.text = @"";
        [self addSubview:_leftCoreTextLabel];
        
        _rightCoreTextLabel = [[TBCityCoreTextLabel alloc] initWithFrame:CGRectMake(APP_CONTENT_WIDTH/2, self.height - 12, APP_CONTENT_WIDTH/2 - kMarginLeftOrRight, 15)];
        _rightCoreTextLabel.textColor = HEXCOLOR(0x999999);
        _rightCoreTextLabel.font = [UIFont systemFontOfSize:12];
        _rightCoreTextLabel.text = @"";
        _rightCoreTextLabel.drawFinishBlock = ^(TBCityCoreTextLabel* label){
            label.left = APP_CONTENT_WIDTH - kMarginLeftOrRight - label.textWidth;
        };
        [self addSubview:_rightCoreTextLabel];
        
        [MmbViewUtil drawLine:CGRectMake(0, 55-1, APP_CONTENT_WIDTH, 0.5) onView:self color:HEXCOLOR(0xebe5e0)];
    }
    return self;
}

//setters
-(void)setItem:(MmbJiaoLiuItem *)item{
    _subjectLabel.text = item.subject;
    _leftCoreTextLabel.text = [NSString stringWithFormat:@"<a color='0xf89791'>%@</a>:%@",item.author,item.replyTime];
    _rightCoreTextLabel.text = [NSString stringWithFormat:@"<img src='bundle://readIcon' width='15' height='10' /> %@    <img src='bundle://replyIcon' width='13' height='11' /> %@",item.readCount,item.replyCount];
}

#pragma mark - override
+ (CGFloat)tableView:(UITableView*)tableView variantRowHeightForItem:(id)item AtIndex:(NSIndexPath*)indexPath {
    return 55;
}

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
