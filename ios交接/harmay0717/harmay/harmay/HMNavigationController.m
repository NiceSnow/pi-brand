//
//  HMNavigationController.m
//  harmay
//
//  Created by boldseas on 2017/7/19.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMNavigationController.h"
#import "HMSearchViewController.h"
#import "UIBarButtonItem+Extension.h"

@interface HMNavigationController ()

@end

@implementation HMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
//        UIBarButtonItem *left1 = [UIBarButtonItem itemWithImage:@"icon_product1" highImage:nil target:self action:@selector(back)];
//        UIBarButtonItem *left2 = [UIBarButtonItem itemWithImage:@"" highImage:@"" target:self action:@selector(more)];
//        
//        viewController.navigationItem.leftBarButtonItems = @[left1,left2];
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"icon_product1" highImage:@"" target:self action:@selector(more)];
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"icon_product" highImage:@"" target:self action:@selector(more)];
    }
    [super pushViewController:viewController animated:YES];
}

- (void)back{
    [self popViewControllerAnimated:YES];
}

- (void)more{
    HMSearchViewController *search = [[HMSearchViewController alloc] init];
    search.view.backgroundColor = [UIColor whiteColor];
    [self presentViewController:search animated:YES completion:^{
        
    }];
}


@end
