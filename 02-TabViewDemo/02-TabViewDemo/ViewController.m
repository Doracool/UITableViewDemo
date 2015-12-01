//
//  ViewController.m
//  02-TabViewDemo
//
//  Created by qingyun on 15/12/1.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *datas;
@end

@implementation ViewController
#define QYScreenW [UIScreen mainScreen].bounds.size.width
-(NSArray *)datas
{
    if (_datas == nil) {
        _datas = @[@"第一行",@"第二行",@"第三行",@"第四行",@"第五行"];
    }
    return _datas;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建并添加UITableView
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    [self.view addSubview:tableView];
    
    //设置数据源
    tableView.dataSource = self;
    
    //设置代理
    tableView.delegate = self;
    
    //设置背景
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:self.view.frame];
    bgView.image = [UIImage imageNamed:@"IMG_1811.JPG"];
    tableView.backgroundView = bgView;
    
    //设置头视图
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, QYScreenW, 100)];
    headerLabel.text = @"TableViewHeaderView";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.backgroundColor = [UIColor greenColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:30];
    tableView.tableHeaderView = headerLabel;
    
    //设置尾视图
    UILabel *footerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, QYScreenW, 100)];
    footerLabel.text = @"TableViewFooterView";
    footerLabel.textAlignment = NSTextAlignmentCenter;
    footerLabel.backgroundColor = [UIColor orangeColor];
    footerLabel.font = [UIFont boldSystemFontOfSize:30];
    tableView.tableFooterView = footerLabel;
    
    //设置sectionHeader的视图或者标题
    
    
    
    /*section
     1、高度的设置（属性，代理方法）
     2、设置头尾的标题
     3、设置头尾的视图
     注意：设置头尾视图的时候，如果当前的tableview的样式是UITableViewStyleGrouped，那么必须使用代理方法设置高度，如果tableview的样式是UITableViewStylePlain,属性和代理方法都可以设置高度
     */
    //设置section头尾宽高
    tableView.sectionHeaderHeight = 30;
    tableView.sectionFooterHeight = 30;
    
    //设置行高
    tableView.rowHeight = 100;
    
    //分割线
    //样式UITableViewCellStyleDefault、UITableViewCellStyleValue2、UITableViewCellStyleSubtitle没有分割线UITableViewCellStyleValue1有分隔线
    tableView.separatorStyle = UITableViewCellStyleValue1;
    
    //颜色
    tableView.separatorColor = [UIColor blueColor];
    
    //缩进
    tableView.separatorInset = UIEdgeInsetsMake(0, 50, 0, 50);
    
    //选中
    //单个视图的选择
    //    tableView.allowsSelection = YES;
    //多个视图的选择
    tableView.allowsMultipleSelection =YES;
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -UITableViewDataSource
//组数（可选的但是基本都要使用这个方法）
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
//组中的行数（必须实现的）
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

//每行的内容（必须实现）
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"aaa"];
    
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}

#pragma mark -UITableViewDelegate
/*
 section头标题和尾标题设置的时候默认的是头标题为大写
 且其字体都在视图的左边
 
 */
//section头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"SectionHeaderView:%ld",section];
}

//section尾标题
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"SectionFooterView:%ld",section];
}
/*
 使用头视图和尾视图的话可以将字体设为居中
 */
//section的头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *sectionHeaderLabel = [[UILabel alloc]init];
    sectionHeaderLabel.text = [NSString stringWithFormat:@"SectionHeaderView:%ld",section];
    sectionHeaderLabel.backgroundColor = [UIColor yellowColor];
    sectionHeaderLabel.textAlignment = NSTextAlignmentCenter;
    return sectionHeaderLabel;
}

//section的尾视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UILabel *sectionFooterLabel = [[UILabel alloc]init];
    sectionFooterLabel.text = [NSString stringWithFormat:@"SectionFooterLabel:%ld",section];
    sectionFooterLabel.backgroundColor = [UIColor purpleColor];
    sectionFooterLabel.textAlignment = NSTextAlignmentCenter;
    return sectionFooterLabel;
}

//设置section的尾高
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section
{
    return 30;
}
//设置section的头高
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return 30;
}

//分别设置不同列的行高
#if 0
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row%2 == 0) {
        return 50;
    }else if (indexPath.row%3 == 0)
    {
        return 70;
    }else{
        return 30;
    }

}
#endif
//重要  已经选中
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取点击的单元格
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //将点击的单元格的字体颜色改变
    cell.textLabel.textColor = [UIColor brownColor];
    //点击之后的标记形式
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
}

//已经取消选中
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取点击的单元格
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //将取消点击的单元格字体颜色变为之前的颜色
    cell.textLabel.textColor = [UIColor blackColor];
    //将之前设置的标记形式去掉
    cell.accessoryType = UITableViewCellAccessoryNone;

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

//设置辅助视图的样式
-(UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellAccessoryDisclosureIndicator;
}

//点击辅助视图
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
