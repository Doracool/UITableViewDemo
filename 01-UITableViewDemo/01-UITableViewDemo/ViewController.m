//
//  ViewController.m
//  01-UITableViewDemo
//
//  Created by qingyun on 15/12/1.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()<UITableViewDataSource>
@property (nonatomic,strong) NSArray *datas;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建tableView
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    [self.view addSubview:tableView];
    //设置数据源
    tableView.dataSource = self;
//    tableView.backgroundColor = [UIColor greenColor];
    
    
    
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
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(0, 0, 100, 30);
        [button setBackgroundColor:[UIColor redColor]];
        [button setTitle:@"你追我" forState:UIControlStateNormal];
        
        return button.titleLabel.text;
    }
    else if(section == 1)
    {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
        label.text = @"头二";
        label.backgroundColor = [UIColor greenColor];
        return label.text;
    }else if(section == 2){
        return @"头三";
    }else if(section == 3){
        return @"头四";
    }else{
        return @"头五";
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    
    if (section == 0) {
        return @"脚一";
    }
    else if(section == 1)
    {
        return @"脚二";
    }else if(section == 2){
        return @"脚三";
    }else if(section == 3){
        return @"脚四";
    }else{
        return @"脚五";
    }

}
//每组中的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

//每行的具体内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"aaa"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"我是第%ld组，第%ld个",indexPath.section,indexPath.row];
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
