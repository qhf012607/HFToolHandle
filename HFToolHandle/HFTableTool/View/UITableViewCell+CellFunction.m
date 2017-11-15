//
//  UITableViewCell+CellFunction.m
//  HFTool
//
//  Created by qhf on 2017/11/15.
//  Copyright © 2017年 qhf. All rights reserved.
//

#import "UITableViewCell+CellFunction.h"
#import <objc/runtime.h>

@implementation UITableViewCell (CellFunction)

static const void *DataExtension = &DataExtension;

- (void)setCustomCall:(customCall)customCall{
    objc_setAssociatedObject(self, DataExtension, customCall, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (customCall)customCall{
    return objc_getAssociatedObject(self, DataExtension);
}

/**
 为cell注入data
 
 @param object any object
 */
- (void)inputDataObject:(id)object{
    
}
/**
 返回cell高度  默认44
 
 @param model any object
 @return CGfloat
 */
+ (CGFloat)getCellHeight:(id)model{
    return 44;
}
@end
