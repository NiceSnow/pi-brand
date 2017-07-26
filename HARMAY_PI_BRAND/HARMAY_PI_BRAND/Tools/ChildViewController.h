//
//  ChildViewController.h
//  HARMAY_PI_BRAND
//
//  Created by Madodg on 2017/7/26.
//  Copyright © 2017年 Madodg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseNavigationController.h"
#import "MainViewController.h"
#import "WebViewController.h"

@interface ChildViewController : NSObject
+ (ChildViewController *)instance;
@property(nonatomic,strong) BaseNavigationController* MainNavgation;
@property(nonatomic,strong) MainViewController* MainVC;
@property(nonatomic,strong) BaseNavigationController* WebNavgation;
@property(nonatomic,strong) WebViewController* webVC;
@end
