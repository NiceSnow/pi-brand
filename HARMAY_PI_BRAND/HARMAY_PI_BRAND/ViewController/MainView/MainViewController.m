//
//  MainViewController.m
//  HARMAY_PI_BRAND
//
//  Created by Madodg on 2017/7/25.
//  Copyright © 2017年 Madodg. All rights reserved.
//

#import "MainViewController.h"
#import "RESideMenu.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton* leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 45, 45)];
    leftBtn.backgroundColor = [UIColor greenColor];
    [leftBtn addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    // Do any additional setup after loading the view from its nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
