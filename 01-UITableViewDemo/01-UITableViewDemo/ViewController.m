//
//  ViewController.m
//  01-UITableViewDemo
//
//  Created by qingyun on 15/12/1.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>
@property (nonatomic,strong) NSArray *datas;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建tableView
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    [self.view addSubview:tableView];
    //设置数据源
    tableView.dataSource = self;
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSArray *)datas{
    if (_datas == nil) {
        _datas = @[@"1",@"2",@"3",@"4",@"5"];
        
    }
    return _datas;
}

#pragma mark -UITableViewDataSource
//tableView中的组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

//每组中的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

//每行的具体内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"aaa"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"我是第%ld组，第%ld个",indexPath.section,indexPath.row];
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
