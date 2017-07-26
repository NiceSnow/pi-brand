//
//  HMCompanyController.m
//  harmay
//
//  Created by boldseas on 2017/7/20.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMCompanyController.h"
#import "HMLeftTable.h"
#import "HMRightTable.h"
#import "HMPCH.h"

@interface HMCompanyController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMLeftTable *LeftTable;
@property (nonatomic, strong) HMRightTable *RightTable;


@end

@implementation HMCompanyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.scrollView];
    
    self.LeftTable = [[HMLeftTable alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.LeftTable.delegate = self.LeftTable;
    self.LeftTable.dataSource = self.LeftTable;
    [self.scrollView addSubview:self.LeftTable];
    
    self.RightTable = [[HMRightTable alloc]initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight)];
    [self.scrollView addSubview:self.RightTable];
    
    self.scrollView.contentSize = CGSizeMake(kScreenWidth * 2, 0);
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.LeftTable loadDate];
}



@end
