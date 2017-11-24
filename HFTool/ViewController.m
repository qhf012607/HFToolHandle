//
//  ViewController.m
//  HFTool
//
//  Created by qhf on 2017/9/21.
//  Copyright © 2017年 qhf. All rights reserved.
//

#import "ViewController.h"
#import "CustomIpm.h"
@interface ViewController ()
@property(strong,nonatomic)UITableView *table;
@property(strong,nonatomic)CustomIpm *imp;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:self.table];
    self.imp = [[CustomIpm alloc]init];
    self.imp.dataArray = @[@[@1,@2,@3],@[@4,@5,@6],@[@7,@8,@9]];
    self.table.delegate = self.imp;
    self.table.dataSource = self.imp;
    [self.imp handleData:^(id model, NSIndexPath *path, UITableView *tableView, NSInteger tagCustome) {
        
    } scrollBlock:^(CGFloat offset, UIScrollView *table) {
        
    }];
    [self.imp handleData:^(id model, NSIndexPath *path, UITableView *tableView, NSInteger tagCustome) {
        
    } scrollBlock:^(CGFloat offset, UIScrollView *table) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
