//
//  JoinusViewController.m
//  HARMAY_PI_BRAND
//
//  Created by shengtian on 2017/7/27.
//  Copyright © 2017年 Madodg. All rights reserved.
//

#import "JoinusViewController.h"
#import "JoinusViewCellCell.h"
#import "JoinusViewCell.h"

@interface JoinusViewController ()<UITabBarDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation JoinusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton* leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 45, 45)];
    [leftBtn setImage:[UIImage imageNamed:@"icon_nav"] forState:normal];
    [leftBtn addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    UIButton* rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 45, 45)];
    [rightBtn setImage:[UIImage imageNamed:@"icon_product"] forState:normal];
    [rightBtn addTarget:self action:@selector(search1:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIView * headerView = [UIView new];
    headerView.backgroundColor = [UIColor clearColor];
    headerView.frame = CGRectMake(0, 0, screenWidth, screenHeight/3.0);
    _tableview.tableHeaderView = headerView;
    _tableview.tableFooterView = [UIView new];
    _tableview.estimatedRowHeight = 5;
    _tableview.rowHeight = UITableViewAutomaticDimension;
}

- (void)search1:(UIButton *)btn
{
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        JoinusViewCellCell * cell = [JoinusViewCellCell createCellWithTableView:tableView];
        return cell;
    }else{
        JoinusViewCell * cell = [JoinusViewCell createCellWithTableView:tableView];
        return cell;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
@end
