//
//  ChildViewController.m
//  HARMAY_PI_BRAND
//
//  Created by Madodg on 2017/7/26.
//  Copyright © 2017年 Madodg. All rights reserved.
//

#import "ChildViewController.h"


@implementation ChildViewController
+ (ChildViewController *)instance
{
    static  ChildViewController*instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

-(BaseNavigationController *)MainNavgation{
    if (!_MainNavgation) {
        _MainNavgation = [[BaseNavigationController alloc]initWithRootViewController:self.MainVC];
    }
    return _MainNavgation;
}

-(MainViewController *)MainVC{
    if (!_MainVC) {
        _MainVC = [[MainViewController alloc]init];
    }
    return _MainVC;
}

-(BaseNavigationController *)WebNavgation{
    if (!_WebNavgation) {
        _WebNavgation = [[BaseNavigationController alloc]initWithRootViewController:self.webVC];
    }
    return _WebNavgation;
}

-(WebViewController *)webVC{
    if (!_webVC) {
        _webVC = [[WebViewController alloc]init];
    }
    return _webVC;
}

@end
