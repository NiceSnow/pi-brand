//
//  HMProductViewController.m
//  harmay
//
//  Created by boldseas on 2017/7/20.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMProductViewController.h"
#import "HMPCH.h"
#import <SDAutoLayout.h>
#import "HMPageControl.h"
#import "HMProductV1.h"

@interface HMProductViewController () <UIScrollViewDelegate>

@property (nonatomic, weak) UIImageView *bgImage;

@property (nonatomic, weak) HMPageControl *pageControl;

@property (nonatomic, weak) UIScrollView *scrollView;

@property (nonatomic, strong) HMProductV1 *v1;

@end

@implementation HMProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //背景图片
    UIImageView *bgImage = [[UIImageView alloc]init];
    bgImage.image = [UIImage imageNamed:@"product_01"];
    bgImage.frame = CGRectMake(0, 0, kScreenWidth, [UIScreen mainScreen].bounds.size.height);
    self.bgImage = bgImage;
    [self.view addSubview:self.bgImage];
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    self.scrollView.contentSize = CGSizeMake(kScreenWidth * 3, [UIScreen mainScreen].bounds.size.height * 2);
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.directionalLockEnabled = YES;
    
    self.scrollView.sd_layout.topEqualToView(self.view)
    .leftEqualToView(self.view)
    .bottomEqualToView(self.view)
    .rightEqualToView(self.view);
    
    HMPageControl *pageControl = [[HMPageControl alloc]init];
    pageControl.numberOfPages = 3;
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
    [self.pageControl setValue:[UIImage imageNamed:@"bar_01"] forKeyPath:@"_pageImage"];
    [self.pageControl setValue:[UIImage imageNamed:@"bar"] forKeyPath:@"_currentPageImage"];
    
    self.pageControl.sd_layout.topSpaceToView(self.view, 84)
    .leftSpaceToView(self.view, 40)
    .widthIs(40)
    .heightIs(5);
    
    //view1
    HMProductV1 *v1 = [[HMProductV1 alloc]init];
    [self.view addSubview:v1];
    self.v1 = v1;
    

    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    double page = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.pageControl.currentPage = (int)(page + 0.5);
}

@end
