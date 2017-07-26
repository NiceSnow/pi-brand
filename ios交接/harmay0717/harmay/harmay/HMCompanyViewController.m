//
//  HMCompanyViewController.m
//  harmay
//
//  Created by boldseas on 2017/7/19.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMCompanyViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "HMSearchViewController.h"
#import <SDAutoLayout.h>
#import "HMPCH.h"
#import "HMPageControl.h"
#import "HMCompanyv2.h"
#import "HMCompanyv1.h"

@interface HMCompanyViewController ()<UIScrollViewDelegate>

@property (nonatomic, weak) HMPageControl *pageControl;

@property (nonatomic, weak) UIScrollView *scrollView;

@property (nonatomic, weak) HMCompanyv1 *view1;
@property (nonatomic, weak) HMCompanyv2 *view2;
//@property (nonatomic, weak) UIView *view2;

@property (nonatomic, weak) UIImageView *bgImage;

//view1内容
@property (nonatomic, weak) UIView *v1titleView;
@property (nonatomic, weak) UIWebView *v1webView;

//view2内容
@property (nonatomic, weak) UIView *v2titleView;
@property (nonatomic, weak) UIView *v2contentView;

@end

@implementation HMCompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //背景图片
    UIImageView *bgImage = [[UIImageView alloc]init];
    bgImage.image = [UIImage imageNamed:@"product_30"];
    bgImage.frame = CGRectMake(0, 0, kScreenWidth, [UIScreen mainScreen].bounds.size.height);
    self.bgImage = bgImage;
    [self.view addSubview:self.bgImage];
    
    //scrollview
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.contentSize = CGSizeMake(kScreenWidth *2, [UIScreen mainScreen].bounds.size.height * 1.2);
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.directionalLockEnabled = YES;

    
    self.scrollView.sd_layout.topEqualToView(self.view)
    .leftEqualToView(self.view)
    .bottomEqualToView(self.view)
    .rightEqualToView(self.view);
    
    
    //pageControl
    HMPageControl *pageControl = [[HMPageControl alloc]init];
    pageControl.numberOfPages = 2;
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
    self.pageControl.frame = CGRectMake((kScreenWidth - 40) *0.5, 160, 40, 5);
    
    [self.pageControl setValue:[UIImage imageNamed:@"bar_01"] forKeyPath:@"_pageImage"];
    [self.pageControl setValue:[UIImage imageNamed:@"bar"] forKeyPath:@"_currentPageImage"];
    
    //内容view
    HMCompanyv1 *View1 = [[HMCompanyv1 alloc]init];
    View1.backgroundColor = [UIColor whiteColor];
    self.view1 = View1;
    
    HMCompanyv2 *v2 = [[HMCompanyv2 alloc]init];
    v2.backgroundColor = [UIColor whiteColor];
    self.view2 = v2;
    
    [self.scrollView addSubview:self.view1];
    [self.scrollView addSubview:self.view2];
    
    
    
    self.view1.sd_layout.topSpaceToView(self.scrollView, 180)
    .centerXEqualToView(self.view)
    .widthRatioToView(self.view, 0.9)
    .heightIs(600);
    
    self.view2.sd_layout.topSpaceToView(self.scrollView, 180)
    .leftSpaceToView(self.view1, kScreenWidth * 0.1)
    .widthRatioToView(self.view, 0.9)
    .heightIs(500);
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


- (void)view2Content{
    UIView *v2titleView = [[UIView alloc]init];
    v2titleView.backgroundColor = [UIColor redColor];
    [self.view2 addSubview:v2titleView];
    self.v2titleView = v2titleView;
    
    UIImageView *icon = [[UIImageView alloc]init];
    icon.image = [UIImage imageNamed:@"dl_comp"];
    [self.view2 addSubview:icon];

    self.v2titleView.sd_layout.topSpaceToView(self.view2, 0)
    .leftSpaceToView(self.view2, 0)
    .widthRatioToView(self.view2, 1);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    double page = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.pageControl.currentPage = (int)(page + 0.5);
    
    if (scrollView.contentOffset.y <= 200) {
            self.pageControl.frame = CGRectMake(self.pageControl.frame.origin.x, 160 - scrollView.contentOffset.y, self.pageControl.frame.size.width, self.pageControl.frame.size.height);
    }
    
    
    if (page >= 1) {
        self.bgImage.image = [UIImage imageNamed:@"activity_01"];
    }else{
        self.bgImage.image = [UIImage imageNamed:@"product_30"];
    }
}

@end




