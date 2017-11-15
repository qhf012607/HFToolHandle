//
//  MainTableImp.h
//  HFTool
//
//  Created by qhf on 2017/11/15.
//  Copyright © 2017年 qhf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MainTableImp : NSObject<UITableViewDelegate,UITableViewDataSource>
/*
 自定义数据源
 */
@property(nonatomic, strong) id model;


/**
 dataArray 二维数组 list数据源 @[@[@1,@2,@3],@[@4,@5,@6],@[@7,@8,@9]]
 */
@property(nonatomic, strong) NSArray*dataArray;


/**
 返回cell类

 @param tableView tableview
 @param indexpath indexpath
 @return cellClass
 */
- (Class)tableView:(UITableView*)tableView indexPath:(NSIndexPath*)indexpath;


/**
 处理点击事件 滚动事件
 
 @param datablock block
 @param scrollBlock block
 */
- (void)handleData:(void(^)(id model,NSIndexPath *path,UITableView *tableView,NSInteger tagCustome))datablock  scrollBlock:(void(^)(CGFloat offset,UIScrollView *table))scrollBlock;

@end
