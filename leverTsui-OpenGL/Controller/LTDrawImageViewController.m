//
//  LTDrawImageViewController.m
//  leverTsui-OpenGL
//
//  Created by xulihua on 2018/9/10.
//  Copyright © 2018年 huage. All rights reserved.
//

#import "LTDrawImageViewController.h"
#import "UIViewController+LTExample.h"
#import "LTDramImageViewController.h"

/**
 * 随机数据
 */
#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

@interface LTDrawImageViewController ()

/** 用来显示的假数据 */
@property (strong, nonatomic) NSMutableArray *data;

@end

@implementation LTDrawImageViewController

#pragma mark - 将一张图片绘制到屏幕上
- (void)example01 {
    LTDramImageViewController *drawImageVC = [[LTDramImageViewController alloc] init];
    [self.navigationController pushViewController:drawImageVC animated:YES];
}

#pragma mark UITableView + 下拉刷新 动画图片
- (void)example02 {
}

#pragma mark UITableView + 下拉刷新 隐藏时间
- (void)example03 {
}

#pragma mark UITableView + 下拉刷新 隐藏状态和时间
- (void)example04 {
}

#pragma mark UITableView + 下拉刷新 自定义文字
- (void)example05 {
}

#pragma mark UITableView + 下拉刷新 自定义刷新控件
- (void)example06 {
}

#pragma mark UITableView + 上拉刷新 默认
- (void)example11 {
   
    
}

#pragma mark UITableView + 上拉刷新 动画图片
- (void)example12 {
   
}

#pragma mark UITableView + 上拉刷新 隐藏刷新状态的文字
- (void)example13 {
   
}

#pragma mark UITableView + 上拉刷新 全部加载完毕
- (void)example14 {
   
}

#pragma mark UITableView + 上拉刷新 禁止自动加载
- (void)example15 {
   
}

#pragma mark UITableView + 上拉刷新 自定义文字
- (void)example16 {
   
}

#pragma mark UITableView + 上拉刷新 加载后隐藏
- (void)example17
{
   
}

#pragma mark UITableView + 上拉刷新 自动回弹的上拉01
- (void)example18 {
   
}

#pragma mark UITableView + 上拉刷新 自动回弹的上拉02
- (void)example19 {
   
}

#pragma mark UITableView + 上拉刷新 自定义刷新控件(自动刷新)
- (void)example20 {
   
}

#pragma mark UITableView + 上拉刷新 自定义刷新控件(自动回弹)
- (void)example21 {
   
}

#pragma mark - 数据处理相关

- (NSMutableArray *)data
{
    if (!_data) {
        _data = [NSMutableArray array];
        for (int i = 0; i<5; i++) {
            [_data addObject:MJRandomData];
        }
    }
    return _data;
}

#pragma mark - 其他
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [self performSelector:NSSelectorFromString(self.method) withObject:nil];
#pragma clang diagnostic pop

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", indexPath.row % 2?@"push":@"modal", self.data[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    MJTestViewController *test = [[MJTestViewController alloc] init];
//    if (indexPath.row % 2) {
//        [self.navigationController pushViewController:test animated:YES];
//    } else {
//        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:test];
//        [self presentViewController:nav animated:YES completion:nil];
//    }
}

@end
