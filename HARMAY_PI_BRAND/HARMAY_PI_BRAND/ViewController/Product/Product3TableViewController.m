//
//  Product3TableViewController.m
//  HARMAY_PI_BRAND
//
//  Created by 刘厚宽 on 2017/7/28.
//  Copyright © 2017年 Madodg. All rights reserved.
//

#import "Product3TableViewController.h"
#import "UIViewController+XLScroll.h"
#import "Product3Cell.h"

@interface Product3TableViewController ()

@end

@implementation Product3TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupScroll];
    self.tableView.separatorStyle = 0;
    self.tableView.estimatedSectionHeaderHeight = 5;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 5;
    self.tableView.backgroundColor = [UIColor clearColor];
}
-(instancetype)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [UIView new];
    UIView * backView = [UIView new];
    backView.backgroundColor = [UIColor whiteColor];
    
    UIImageView * logoImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"11"]];
    [backView addSubview:logoImageView];
    [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(15);
    }];
    

    [view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(view);
        make.left.mas_offset(10);
        make.right.mas_offset(-10);
    }];
    return view;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return UITableViewAutomaticDimension;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Product3Cell *cell = [Product3Cell createCellWithTableView:tableView];
    
    return cell;
}



@end
