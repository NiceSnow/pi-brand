//
//  Product1TableViewController.m
//  HARMAY_PI_BRAND
//
//  Created by 刘厚宽 on 2017/7/28.
//  Copyright © 2017年 Madodg. All rights reserved.
//

#import "Product1TableViewController.h"
#import "UIViewController+XLScroll.h"
#import "Product1Cell.h"

@interface Product1TableViewController ()
@property (nonatomic, strong)NSMutableArray * titleArray;
@property (nonatomic, strong)NSMutableArray * imageArray;
@end

@implementation Product1TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupScroll];
   
    
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 10, 0, 10)];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0, 10, 0, 10)];
    }
    self.tableView.backgroundColor = [UIColor clearColor];
}
-(instancetype)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}
-(NSMutableArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [@[@"上海安福路308号",@"店铺电话：13661138037",@"营业时间10：00-22：00"] mutableCopy];
    }
    return _titleArray;
}
-(NSMutableArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = [@[@"19_base1",@"23_base1",@"27_base1"] mutableCopy];
    }
    return _imageArray;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Product1Cell *cell = [Product1Cell createCellWithTableView:tableView];
    cell.imageString = _imageArray[indexPath.row];
    cell.contentString = _titleArray[indexPath.row];
    return cell;
}

@end
