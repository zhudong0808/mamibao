//
//  MmbIndexTableViewCell.m
//  mamibao
//
//  Created by zhudong on 14-7-29.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbIndexTableViewCell.h"
#import "MmbIndexItem.h"

@interface MmbIndexTableViewCell(){

}

@property (nonatomic,strong) UILabel *titleLabel;

@end

@implementation MmbIndexTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLabel = [MmbViewUtil simpleLabel:CGRectMake(12, 10, APP_CONTENT_WIDTH -24,40) f:20 tc:[UIColor redColor] t:@""];
        [self addSubview:_titleLabel];
    }
    return self;
}

//setters
-(void)setItem:(MmbIndexItem *)item{
    _titleLabel.text = item.subject;
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
