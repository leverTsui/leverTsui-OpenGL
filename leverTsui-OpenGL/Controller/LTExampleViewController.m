//
//  LTExampleViewController.m
//  leverTsui-OpenGL
//
//  Created by xulihua on 2018/9/10.
//  Copyright © 2018年 huage. All rights reserved.
//

#import "LTExampleViewController.h"
#import "LTExample.h"
#import "LTDrawImageViewController.h"
#import "LTDramImageViewController.h"

@interface LTExampleViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray *examples;

@end

@implementation LTExampleViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configurePageView];
    [self addPageSubviews];
    [self layoutPageSubviews];
}

- (void)dealloc {
}

#pragma mark - UI & autolayout

- (void)configurePageView {
    if (@available(iOS 11.0, *)) {
//        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
//        self.automaticallyAdjustsScrollViewInsets = NO;
#pragma clang diagnostic pop
    }
}

- (void)addPageSubviews {
    
}

- (void)layoutPageSubviews {
    
}

#pragma mark - event response

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.examples.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    LTExample *exam = self.examples[section];
    return exam.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"example";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    LTExample *exam = self.examples[indexPath.section];
    cell.textLabel.text = exam.titles[indexPath.row];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", exam.vcClass, exam.methods[indexPath.row]];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    LTExample *exam = self.examples[section];
    return exam.header;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LTExample *exam = self.examples[indexPath.section];
//    UIViewController *vc = [[exam.vcClass alloc] init];
//    vc.title = exam.titles[indexPath.row];
//    [vc setValue:exam.methods[indexPath.row] forKeyPath:@"method"];
    
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [self performSelector:NSSelectorFromString(exam.methods[indexPath.row]) withObject:nil];
#pragma clang diagnostic pop
    
//    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - private method

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

#pragma mark - getter & setter

- (NSArray *)examples {
    if (!_examples) {
        LTExample *exam0 = [[LTExample alloc] init];
        exam0.header = @"01";
        exam0.vcClass = [LTDrawImageViewController class];
        exam0.titles = @[@"将一张图片绘制到屏幕上", @"动画图片", @"隐藏时间", @"隐藏状态和时间", @"自定义文字", @"自定义刷新控件"];
        exam0.methods = @[@"example01", @"example02", @"example03", @"example04", @"example05", @"example06"];
        
        LTExample *exam1 = [[LTExample alloc] init];
        exam1.header = @"02";
        exam1.vcClass = [UIViewController class];
        exam1.titles = @[@"默认", @"动画图片", @"隐藏刷新状态的文字", @"全部加载完毕", @"禁止自动加载", @"自定义文字", @"加载后隐藏", @"自动回弹的上拉01", @"自动回弹的上拉02", @"自定义刷新控件(自动刷新)", @"自定义刷新控件(自动回弹)"];
        exam1.methods = @[@"example11", @"example12", @"example13", @"example14", @"example15", @"example16", @"example17", @"example18", @"example19", @"example20", @"example21"];
        
        LTExample *exam2 = [[LTExample alloc] init];
        exam2.header = @"03";
        exam2.vcClass = [UIViewController class];
        exam2.titles = @[@"上下拉刷新"];
        exam2.methods = @[@"example21"];
        
        LTExample *exam3 = [[LTExample alloc] init];
        exam3.header = @"04";
        exam3.vcClass = [UIViewController class];
        exam3.titles = @[@"下拉刷新"];
        exam3.methods = @[@"example31"];
        
        _examples = @[exam0, exam1, exam2, exam3];
    }
    return _examples;
}

@end
