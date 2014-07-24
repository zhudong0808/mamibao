//
//  MmbTableViewDataSource.m
//  mamibao
//
//  Created by zhudong on 14-7-2.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbTableViewDataSource.h"
#import "MmbTableViewItem.h"
#import "MmbTableViewCell.h"

@interface MmbTableViewDataSource(){
}

@property (nonatomic,strong) NSMutableDictionary *itemsForSectionInternal;
@property (nonatomic,strong) NSMutableDictionary *totalCountForSectionInternal;

@end

@implementation MmbTableViewDataSource


- (id)init{
    if (self = [super init]) {
        _itemsForSectionInternal = [[NSMutableDictionary alloc] init];
        _totalCountForSectionInternal = [[NSMutableDictionary alloc] init];
    }
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *items = _itemsForSectionInternal[@(section)];
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //拿到当前item
    MmbTableViewItem *item = [self itemForCellAtIndexPath:indexPath];
    //拿到当前cell的类型
    Class cellClass = [self cellClassForItem:item AtIndex:indexPath];
    //拿到name
    NSString* identifier = NSStringFromClass(cellClass);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (cell == nil)
    {
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    //TODO
    return cell;
}


#pragma mark - private method 
// item for index
- (MmbTableViewItem *)itemForCellAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *items = _itemsForSectionInternal[@(indexPath.section)];
    MmbTableViewItem *item = nil;
    if (indexPath.row < items.count) {
        item = items[indexPath.row];
    } else {
        item = [[MmbTableViewItem alloc] init];
    }
    return item;
}


// cell for index
- (Class)cellClassForItem:(MmbTableViewItem*)item AtIndex:(NSIndexPath *)indexPath
{
//    if (item.itemType == kItem_Normal) {
//        //TODO
//        //return [TBCitySBTableViewCell class];
//    }
//    else if (item.itemType == kItem_Loading) {
//        //TODO
//        //return [TBCitySBTableViewLoadingCell class];
//    }
//    else if (item.itemType == kItem_Error)
//    {
//        //TODO
//        //return [TBCitySBTableViewErrorCell class];
//    }
//    else if (item.itemType == kItem_Customize)
//    {
//        //TODO
//        //return [TBCitySBTableViewCustomizedCell class];
//    }
//    else
    return [MmbTableViewCell class];
}


@end
