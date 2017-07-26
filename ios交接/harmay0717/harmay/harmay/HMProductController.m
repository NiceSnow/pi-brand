//
//  HMProductController.m
//  harmay
//
//  Created by boldseas on 2017/7/20.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMProductController.h"
#import "HMSearchViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "HMProductLeft.h"
#import "HMProductRight.h"
#import "HMProductMid.h"
#import "HMPCH.h"
#import <SDAutoLayout.h>
#import "HMPageControl.h"


@interface HMProductController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMPageControl *pageControl;
@property (nonatomic, strong) HMProductLeft *LeftTable;
@property (nonatomic, strong) HMProductMid *MidTable;
@property (nonatomic, strong) HMProductRight *RightTable;

@end

@implementation HMProductController

- (void)viewDidLoad {
    [super viewDidLoad];    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"product_01"]];
    
    self.scrollView = [[UIScrollView alloc]init];
    [self.view addSubview:self.scrollView];

    self.scrollView.contentSize = CGSizeMake(kScreenWidth * 3, 0);
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.directionalLockEnabled = YES;

//    self.pageControl = [[HMPageControl alloc]init];
//    [self.view addSubview:self.pageControl];
//    self.pageControl.numberOfPages = 3;
//    [self.pageControl setValue:[UIImage imageNamed:@"bar_01"] forKeyPath:@"_pageImage"];
//    [self.pageControl setValue:[UIImage imageNamed:@"bar"] forKeyPath:@"_currentPageImage"];
    
    self.LeftTable = [[HMProductLeft alloc]init];
    [self.scrollView addSubview:self.LeftTable];
    
    self.MidTable = [[HMProductMid alloc]init];
    [self.scrollView addSubview:self.MidTable];
    
    self.RightTable = [[HMProductRight alloc]init];
    [self.scrollView addSubview:self.RightTable];
    
    self.scrollView.sd_layout.topEqualToView(self.view)
    .bottomEqualToView(self.view)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view);
    
//    self.pageControl.sd_layout.topSpaceToView(self.view, 84)
//    .centerXEqualToView(self.view)
//    .widthIs(80)
//    .heightIs(20);
    
    self.LeftTable.sd_layout.topSpaceToView(self.scrollView, 0)
    .centerXEqualToView(self.view)
    .widthIs(kScreenWidth - 40)
    .heightIs(kScreenHeight - 74);

    
    self.MidTable.sd_layout.topSpaceToView(self.scrollView, 40)
    .leftSpaceToView(self.LeftTable, 40)
    .widthIs(kScreenWidth - 40)
    .heightIs(kScreenHeight - 114);

    self.RightTable.sd_layout.topSpaceToView(self.scrollView, 40)
    .leftSpaceToView(self.MidTable, 40)
    .widthIs(kScreenWidth - 40)
    .heightIs(kScreenHeight - 114);

    self.LeftTable.delegate = self.LeftTable;
    self.LeftTable.dataSource = self.LeftTable;
    self.RightTable.delegate = self.RightTable;
    self.RightTable.dataSource = self.RightTable;
    self.MidTable.delegate = self.MidTable;
    self.MidTable.dataSource = self.MidTable;
    
}


-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)more{
    HMSearchViewController *search = [[HMSearchViewController alloc] init];
    search.view.backgroundColor = [UIColor whiteColor];
    [self presentViewController:search animated:YES completion:^{
        
    }];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"icon_product1" highImage:@"" target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"icon_product" highImage:@"" target:self action:@selector(more)];
    [self.LeftTable loadDate];
    [self.MidTable loadMiddata];
    [self.RightTable loadRightdata];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    double page = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.pageControl.currentPage = (int)(page + 0.5);
}


@end

//    self.LeftTable.sd_layout.topSpaceToView(self.scrollView, 40)
//    .centerXEqualToView(self.view)
//    .widthIs(kScreenWidth - 40)
//    .heightIs(kScreenHeight - 120);
//
//    self.MidTable.sd_layout.topSpaceToView(self.scrollView, 140)
//    .leftSpaceToView(self.LeftTable, 40)
//    .widthIs(kScreenWidth - 40)
//    .heightIs(kScreenHeight - 220);
//
//    self.RightTable.sd_layout.topSpaceToView(self.scrollView, 140)
//    .leftSpaceToView(self.MidTable, 40)
//    .widthIs(kScreenWidth - 40)
//    .heightIs(kScreenHeight - 220);

//self.pageControl = [[HMPageControl alloc]init];
//[self.view addSubview:self.pageControl];
//self.pageControl.numberOfPages = 3;
//[self.pageControl setValue:[UIImage imageNamed:@"bar_01"] forKeyPath:@"_pageImage"];
//[self.pageControl setValue:[UIImage imageNamed:@"bar"] forKeyPath:@"_currentPageImage"];

//    self.pageControl.sd_layout.topSpaceToView(self.view, 120)
//    .centerXEqualToView(self.view);
