//
//  HMProfileListViewController.m
//  harmay
//
//  Created by boldseas on 2017/7/18.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMProfileListViewController.h"
#import <SDAutoLayout.h>
#import "HMPCH.h"
#import "HMBackHomeBtn.h"
#import "HMLocationBtn.h"
#import "RESideMenu.h"
#import "HMHomeViewController.h"
#import "HMCompanyViewController.h"
#import "HMNavigationController.h"

@interface HMProfileListViewController ()
@property(nonatomic, strong) HMHomeViewController *home;
/** userImage */
@property (nonatomic, weak) UIImageView *userImageView;
@property (nonatomic, weak) UIImageView *subImage;

/** backHomeBtn */
@property (nonatomic, strong) UIButton *backHomeBtn;

/** navBtn */
@property (nonatomic, weak) UIButton *companyBtn;
@property (nonatomic, weak) UIButton *poroductBtn;
@property (nonatomic, weak) UIButton *recruBtn;

/** locationBtn */
@property (nonatomic, weak) UIButton *locationBtn;

/** lineView */
@property (nonatomic, weak) UIView *lineView;

/** tagView */
@property (nonatomic, weak) UIImageView *tagImage;
@property (nonatomic, weak) UIButton *oneBtn;
@property (nonatomic, weak) UIButton *twoBtn;
@property (nonatomic, weak) UIButton *threeBtn;
@property (nonatomic, weak) UIButton *fourBtn;


@end

@implementation HMProfileListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUserInfo];

    //首页按钮
    HMBackHomeBtn *backHomeBtn = [[HMBackHomeBtn alloc]init];
    [self.view addSubview:backHomeBtn];
    self.backHomeBtn = backHomeBtn;
    [backHomeBtn addTarget:self action:@selector(backHomebthClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.backHomeBtn.sd_layout.topSpaceToView(self.userImageView, 40)
    .leftSpaceToView(self.view, 20)
    .widthRatioToView(self.view, 0.8)
    .heightIs(25);
    
    //导航按钮
    UIButton *companyBtn = [[UIButton alloc]init];
    [companyBtn setImage:[UIImage imageNamed:@"icon_company"] forState:UIControlStateNormal];
    companyBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:companyBtn];
    [companyBtn addTarget:self action:@selector(companyBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    companyBtn.sd_layout.topSpaceToView(self.backHomeBtn, 20)
    .leftSpaceToView(self.view, 20)
    .widthRatioToView(self.backHomeBtn, 0.8)
    .heightIs(20);
    
    UIButton *poroductBtn = [[UIButton alloc]init];
    [poroductBtn setImage:[UIImage imageNamed:@"icon_products"] forState:UIControlStateNormal];
    poroductBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:poroductBtn];
    [poroductBtn addTarget:self action:@selector(poroductBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    poroductBtn.sd_layout.topSpaceToView(companyBtn, 20)
    .leftSpaceToView(self.view, 20)
    .widthRatioToView(self.backHomeBtn, 0.8)
    .heightIs(18);
    
    
    UIButton *recruBtn = [[UIButton alloc]init];
    [recruBtn setImage:[UIImage imageNamed:@"icon_recruitment"] forState:UIControlStateNormal];
    recruBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    recruBtn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:recruBtn];
    [recruBtn addTarget:self action:@selector(recruBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    recruBtn.sd_layout.topSpaceToView(poroductBtn, 20)
    .leftSpaceToView(self.view, 20)
    .widthRatioToView(self.backHomeBtn, 0.8)
    .heightIs(18);
    
    //定位按钮
    HMLocationBtn *locationBtn = [[HMLocationBtn alloc]init];
    [self.view addSubview:locationBtn];
    self.locationBtn = locationBtn;
    
    locationBtn.sd_layout.topSpaceToView(recruBtn, 20)
    .leftSpaceToView(self.view, 20)
    .widthRatioToView(self.view, 0.8)
    .heightIs(25);
    
    /** lineView */
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = BHColor(173, 173, 173);
    [self.view addSubview:lineView];
    self.lineView = lineView;
    
    self.lineView.sd_layout.topSpaceToView(self.locationBtn, 20)
    .leftSpaceToView(self.view, 20)
    .heightIs(1)
    .widthRatioToView(self.view, 0.8);
    
    UIImageView *tagImage = [[UIImageView alloc]init];
    tagImage.image = [UIImage imageNamed:@"nav_13"];
    [self.view addSubview:tagImage];
    self.tagImage = tagImage;
    
    self.tagImage.sd_layout.topSpaceToView(lineView, 30)
    .leftSpaceToView(self.view, 20)
    .widthIs(30)
    .heightEqualToWidth();
    
    UIButton *oneBtn = [[UIButton alloc]init];
    [oneBtn setImage:[UIImage imageNamed:@"nav_14"] forState:UIControlStateNormal];
    [self.view addSubview:oneBtn];
    self.oneBtn = oneBtn;
    
    self.oneBtn.sd_layout.topSpaceToView(lineView, 35)
    .leftSpaceToView(self.tagImage, 20)
    .widthIs(30)
    .heightEqualToWidth();
    
    UIButton *twoBtn = [[UIButton alloc]init];
    [twoBtn setImage:[UIImage imageNamed:@"nav_15"] forState:UIControlStateNormal];
    [self.view addSubview:twoBtn];
    self.twoBtn = twoBtn;
    
    self.twoBtn.sd_layout.topSpaceToView(lineView, 35)
    .leftSpaceToView(self.oneBtn, 20)
    .widthIs(30)
    .heightEqualToWidth();
    
    UIButton *threeBtn = [[UIButton alloc]init];
    [threeBtn setImage:[UIImage imageNamed:@"nav_16"] forState:UIControlStateNormal];
    [self.view addSubview:threeBtn];
    self.threeBtn = threeBtn;
    
    self.threeBtn.sd_layout.topSpaceToView(lineView, 35)
    .leftSpaceToView(self.twoBtn, 20)
    .widthIs(30)
    .heightEqualToWidth();
    
    UIButton *fourBtn = [[UIButton alloc]init];
    [fourBtn setImage:[UIImage imageNamed:@"nav_17"] forState:UIControlStateNormal];
    [self.view addSubview:fourBtn];
    self.fourBtn = fourBtn;
    
    self.fourBtn.sd_layout.topSpaceToView(self.oneBtn, 20)
    .leftEqualToView(self.oneBtn)
    .widthIs(30)
    .heightEqualToWidth();
}

- (void)setupUserInfo{
    UIImageView *userImageView = [[UIImageView alloc]init];
    userImageView.image = [UIImage imageNamed:@"nav_09"];
    [self.view addSubview:userImageView];
    userImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.userImageView = userImageView;
    
    userImageView.sd_layout.topSpaceToView(self.view, 110)
    .leftSpaceToView(self.view, 20)
    .heightIs(60)
    .widthIs(60);
    
    UIImageView *subImage = [[UIImageView alloc]init];
    subImage.image = [UIImage imageNamed:@"nav_08"];
    [self.view addSubview:subImage];
    self.subImage = subImage;
    
    subImage.sd_layout.centerYEqualToView(userImageView)
    .leftSpaceToView(userImageView, 15)
    .widthIs(150)
    .heightIs(20);
}



- (void)backHomebthClick{
    [self backHome];
}


-(void)backHome{
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:self.home];
    [self.sideMenuViewController setContentViewController:nav animated:YES];
    [self.sideMenuViewController hideMenuViewController];
}

- (void)companyBtnClick{
    [self backHome];
    [self.home companyClick];
}

-(void)poroductBtnClick{
    [self backHome];
    [self.home productClick];
}

-(void)recruBtnClick{
    [self backHome];
    [self.home recruitmentClick];
}

-(HMHomeViewController *)home{
    if (nil == _home) {
        _home = [[HMHomeViewController alloc]init];
    }
    return _home;
}

@end
