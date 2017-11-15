//
//  MainTableImp.m
//  HFTool
//
//  Created by qhf on 2017/11/15.
//  Copyright © 2017年 qhf. All rights reserved.
//

#import "MainTableImp.h"
#import "UITableViewCell+CellFunction.h"
#import <objc/runtime.h>

@interface MainTableImp()

@property(nonatomic, assign)BOOL single;
@property(nonatomic, copy)void (^datablock)(id, NSIndexPath *, UITableView *,NSInteger);
@property(nonatomic, copy)void (^scrollBlock)(CGFloat, UIScrollView *);
@end

@implementation MainTableImp
- (Class)tableView:(UITableView*)tableView indexPath:(NSIndexPath*)indexpath{  // 这个方法会子类有机会重写，默认的 Cell 类型是 HomeScrollCell
    return [UITableViewCell class];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Class cellClass = [self tableView:tableView indexPath:indexPath];
    NSString *className = [NSString stringWithUTF8String:class_getName(cellClass)];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:className];
    if (!cell) {
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:className];
    }
    __weak typeof (self)weakself  = self;
    cell.customCall = ^(id model, NSInteger tag) {
        __strong typeof (self)strongSelf = weakself;
        [strongSelf handleCustomeCall:model IndexPath:indexPath table:tableView tag:tag];;
    };
    NSArray *array = self.dataArray[indexPath.section];
    id model = array[indexPath.row];
    [cell inputDataObject:model];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.scrollBlock) {
        self.scrollBlock(scrollView.contentOffset.y, scrollView);
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *array = self.dataArray[indexPath.section];
    id model = array[indexPath.row];
    if (self.datablock) {
        self.datablock(model, indexPath, tableView,0);
    }
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Class cellClass = [self tableView:tableView indexPath:indexPath];
    NSArray *array = self.dataArray[indexPath.section];
    id model = array[indexPath.row];
    return [cellClass getCellHeight:model];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = self.dataArray[section];
    return array.count;
}

- (void)handleData:(void (^)(id, NSIndexPath *, UITableView *,NSInteger))datablock scrollBlock:(void (^)(CGFloat, UIScrollView *))scrollBlock{
    self.datablock = datablock;
    self.scrollBlock = scrollBlock;
}

- (void)handleCustomeCall:(id)model IndexPath:(NSIndexPath*)indexPath table:(UITableView*)tableView tag:(NSInteger)tag{
    if (self.datablock) {
        self.datablock(model, indexPath, tableView,tag);
    }
}
@end
