//
//  HMRecruitmentViewController.m
//  harmay
//
//  Created by boldseas on 2017/7/20.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMRecruitmentViewController.h"
#import "HMSearchViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "HMPCH.h"
#import "HMRecruitmentHeaderView.h"
#import <SDAutoLayout.h>
#import "HMRecruitmentFooterView.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface HMRecruitmentViewController ()

@property (nonatomic, strong) UIImageView *bgImage;
@property (nonatomic, strong) HMRecruitmentHeaderView *headerView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMRecruitmentFooterView *footer;

@end

@implementation HMRecruitmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //背景图片
    UIImageView *bgImage = [[UIImageView alloc]init];
    bgImage.image = [UIImage imageNamed:@"recruit_13"];
    bgImage.frame = CGRectMake(0, 0, kScreenWidth, [UIScreen mainScreen].bounds.size.height);
    self.bgImage = bgImage;
    [self.view addSubview:self.bgImage];
    
    //scrollview
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.bounces = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    self.scrollView.sd_layout.topEqualToView(self.view)
    .leftEqualToView(self.view)
    .bottomEqualToView(self.view)
    .rightEqualToView(self.view);
    
    
    self.headerView = [[HMRecruitmentHeaderView alloc]init];
    [self.scrollView addSubview:self.headerView];
    
    self.headerView.sd_layout.topSpaceToView(self, 180)
    .centerXEqualToView(self.view)
    .widthRatioToView(self.view, 0.9);
    
    
    self.footer = [[HMRecruitmentFooterView alloc]init];
    [self.scrollView addSubview:self.footer];
    
    self.footer.sd_layout.topSpaceToView(self.headerView, 15)
    .centerXEqualToView(self.view)
    .widthRatioToView(self.view, 0.9);
    
    [self.headerView updateLayout];
    [self.footer updateLayout];
    CGFloat scroY = self.footer.frame.origin.y;
    CGFloat scroH = self.footer.frame.size.height;
    self.scrollView.contentSize = CGSizeMake(0, scroH + scroY +20);
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"icon_product1" highImage:@"" target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"icon_product" highImage:@"" target:self action:@selector(more)];
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



@end
