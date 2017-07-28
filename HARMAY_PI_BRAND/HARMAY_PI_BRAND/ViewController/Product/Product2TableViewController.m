//
//  Product2TableViewController.m
//  HARMAY_PI_BRAND
//
//  Created by 刘厚宽 on 2017/7/28.
//  Copyright © 2017年 Madodg. All rights reserved.
//

#import "Product2TableViewController.h"
#import "UIViewController+XLScroll.h"

@interface Product2TableViewController ()

@end

@implementation Product2TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupScroll];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@%zd", self.title,indexPath.row];
    return cell;
}

@end