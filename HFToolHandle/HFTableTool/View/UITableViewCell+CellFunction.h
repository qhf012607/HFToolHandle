//
//  UITableViewCell+CellFunction.h
//  HFTool
//
//  Created by qhf on 2017/11/15.
//  Copyright © 2017年 qhf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (CellFunction)

typedef void(^customCall)(id model,NSInteger tag);

@property (nonatomic, copy) customCall customCall;


/**
 重写此方法，注入数据源
 
 @param object 数据源
 */
- (void)inputDataObject:(id)object;


/**
 自定义高度 默认44
 
 @param model 数据源
 @return cell高度
 */
+ (CGFloat)getCellHeight:(id)model;

@end
