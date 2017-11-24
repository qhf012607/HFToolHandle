# HFToolHandle
1、在Controller中 只需 设置tableView dalegate datasource 为自定义 imp ;

2、tableview 代理方法 在mainimp中已经实现 只需继承maninImp 重写
- (Class)tableView:(UITableView*)tableView indexPath:(NSIndexPath*)indexpath{  // 这个方法会子类有机会重写，默认的 Cell 类型是 HomeScrollCell
    return [UITableViewCell class];
}
方法 ，返回自定义cell class。不写默认uitableviewCell

3、 cell 高度在自定义cell 中 写
+ (CGFloat)getCellHeight:(id)model{
return 92;
}
方法 ，不写的话默认44.


4、设置imp 数据源 dataArray (必须为二维数组)
