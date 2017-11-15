//
//  CustomIpm.m
//  HFTool
//
//  Created by qhf on 2017/11/15.
//  Copyright © 2017年 qhf. All rights reserved.
//

#import "CustomIpm.h"
#import "HomeShopCell.h"
@implementation CustomIpm
- (Class)tableView:(UITableView*)tableView indexPath:(NSIndexPath*)indexpath{  // 这个方法会子类有机会重写，默认的 Cell 类型是 HomeScrollCell
    return [HomeShopCell class];
}
@end
