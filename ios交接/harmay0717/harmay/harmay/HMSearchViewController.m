//
//  HMSearchViewController.m
//  harmay
//
//  Created by boldseas on 2017/7/22.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMSearchViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "HMPCH.h"

#import <SDAutoLayout.h>

@interface HMSearchViewController ()

@end

@implementation HMSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *titleBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    titleBar.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    [self.view addSubview:titleBar];
    
    UIImageView *image = [[UIImageView alloc] init];
    image.image = [UIImage imageNamed:@"icon_product"];
    [titleBar addSubview:image];
    image.sd_layout.topSpaceToView(titleBar, 24)
    .leftSpaceToView(titleBar, 20)
    .widthIs(24)
    .heightIs(24);
    
    
    UIButton *cancel = [[UIButton alloc] init];
    
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    [cancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    [titleBar addSubview:cancel];
    cancel.sd_layout.topSpaceToView(titleBar, 24)
    .rightSpaceToView(titleBar, 20)
    .heightIs(24)
    .widthIs(40);
    
    UITextField *search = [[UITextField alloc] init];
    search.placeholder = @"搜索所有内容";
    search.backgroundColor = [UIColor whiteColor];
    [titleBar addSubview:search];
    search.sd_layout.topSpaceToView(titleBar, 24)
    .leftSpaceToView(image,10)
    .rightSpaceToView(cancel, 10)
    .heightIs(30);
    [search becomeFirstResponder];


    UILabel *searched = [[UILabel alloc] init];
    searched.text = @"最近搜索过的东西";
    [self.view addSubview:searched];
    searched.sd_layout.topSpaceToView(self.view, 68)
    .leftSpaceToView(self.view, 12)
    .widthIs(kScreenWidth);
    
    // Do any additional setup after loading the view.
}

-(void)cancelClick{
        [self dismissViewControllerAnimated:NO completion:^{
    
        }];
}

-(void)viewWillAppear:(BOOL)animated{
    //self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"icon_product1" highImage:@"" target:self action:@selector(back)];
    
    //self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"icon_product" highImage:@"" target:self action:@selector(more)];
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self dismissViewControllerAnimated:NO completion:^{
        
//    }];
//}

@end
