//
//  HMProductV1.m
//  harmay
//
//  Created by boldseas on 2017/7/20.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMProductV1.h"
#import <SDAutoLayout.h>
#import "HMPCH.h"
#import "HMCityView.h"
#import "HMProductCityBtn.h"

@interface HMProductV1()
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *vice_title;
@property (nonatomic, strong) UIButton *shareBtn;

@property (nonatomic, strong) HMCityView *cityBtnView;

@property (nonatomic, strong) HMProductCityBtn *allBtn;
@property (nonatomic, strong) HMProductCityBtn *bjBtn;
@property (nonatomic, strong) HMProductCityBtn *shBtn;
@property (nonatomic, strong) HMProductCityBtn *hkBtn;

@end

@implementation HMProductV1

- (instancetype)init{
    if (self = [super init]) {
        
        UIImageView *icon = [[UIImageView alloc]init];
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:icon];
        icon.image = [UIImage imageNamed:@"icon_products"];
        self.icon = icon;
        
        UILabel *title = [[UILabel alloc]init];
        title.text = @"HARMAY，关于美和美好的生活";
        [self addSubview:title];
        self.title = title;
        
        UILabel *vice_title = [[UILabel alloc]init];
        vice_title.text = @"实体店体验馆";
        [self addSubview:vice_title];
        self.vice_title = vice_title;
        
        UIButton *shareBtn = [[UIButton alloc]init];
        [shareBtn setImage:[UIImage imageNamed:@"product_05"] forState:UIControlStateNormal];
        [self addSubview:shareBtn];
        self.shareBtn = shareBtn;
        
        
//        HMCityView *cityBtnView = [[HMCityView alloc]init];
//        self.cityBtnView.backgroundColor = [UIColor blueColor];
//        [self addSubview:cityBtnView];
//        self.cityBtnView = cityBtnView;
        
        self.allBtn = [[HMProductCityBtn alloc]init];
        [self.allBtn setTitle:@"全部" forState:UIControlStateNormal];
        self.allBtn.tag = 0;
        [self addSubview:self.allBtn];
        [self.allBtn addTarget:self action:@selector(allBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        self.bjBtn = [[HMProductCityBtn alloc]init];
        [self.bjBtn setTitle:@"北京" forState:UIControlStateNormal];
        self.bjBtn.tag = 2;
        [self addSubview:self.bjBtn];
        
        self.shBtn = [[HMProductCityBtn alloc]init];
        [self.shBtn setTitle:@"上海" forState:UIControlStateNormal];
        self.shBtn.tag = 1;
        [self addSubview:self.shBtn];
        
        self.hkBtn = [[HMProductCityBtn alloc]init];
        [self.hkBtn setTitle:@"香港" forState:UIControlStateNormal];
        self.shBtn.tag = 5;
        [self addSubview:self.hkBtn];
        
        //自动布局
        self.icon.sd_layout.topSpaceToView(self, 20)
        .leftSpaceToView(self, 20)
        .widthIs(100)
        .heightIs(8);
        
        self.title.textAlignment = NSTextAlignmentLeft;
        self.title.sd_layout.topSpaceToView(self.icon, 15)
        .leftSpaceToView(self, 20)
        .widthRatioToView(self, 1)
        .autoHeightRatio(0);
        
        self.vice_title.sd_layout.topSpaceToView(self.title, 30)
        .leftSpaceToView(self, 20)
        .widthRatioToView(self, 1)
        .autoHeightRatio(0);
        
        self.shareBtn.sd_layout.topSpaceToView(self.title, 25)
        .rightSpaceToView(self, 20)
        .widthIs(30)
        .heightEqualToWidth();
        
        self.allBtn.sd_layout.topSpaceToView(self.vice_title, 20)
        .leftSpaceToView(self, 20)
        .widthIs(90)
        .heightIs(30);
        
        self.shBtn.sd_layout.topSpaceToView(self.vice_title, 20)
        .centerXEqualToView(self)
        .widthIs(90)
        .heightIs(30);
        
        self.bjBtn.sd_layout.topSpaceToView(self.vice_title, 20)
        .rightSpaceToView(self, 20)
        .widthIs(90)
        .heightIs(30);
        
        self.hkBtn.sd_layout.topSpaceToView(self.allBtn, 20)
        .leftSpaceToView(self, 20)
        .widthIs(90)
        .heightIs(30);
        
        [self setupAutoHeightWithBottomView:self.hkBtn bottomMargin:10];
    }
    return self;
}

- (void)allBtnClick{
    NSLog(@"allBtnClick");
    if ([self.delegate respondsToSelector:@selector(leftViewDidselectRowWithTag:)]) {
        [self.delegate leftViewDidselectRowWithTag:self.allBtn.tag];
    }
}



@end
