//
//  HMProductv2.m
//  harmay
//
//  Created by boldseas on 2017/7/20.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMProductv2.h"
#import <SDAutoLayout.h>

@interface HMProductv2()

@property (nonatomic, weak) UIImageView *icon;
@property (nonatomic, weak) UILabel *title;
@property (nonatomic, weak) UIButton *allShopBtn;
@property (nonatomic, weak) UIButton *timeBtn;
@property (nonatomic, weak) UIButton *shareBtn;

@end

@implementation HMProductv2

- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *icon = [[UIImageView alloc]init];
        icon.image = [UIImage imageNamed:@"icon_products"];
        [self addSubview:icon];
        self.icon = icon;
        
        UILabel *title = [[UILabel alloc]init];
        title.text = @"HARMAY，线上产品体验馆";
        [self addSubview:title];
        self.title = title;
        
        UIButton *allShopBtn = [[UIButton alloc]init];
        [allShopBtn setBackgroundImage:[UIImage imageNamed:@"icon_05"] forState:UIControlStateNormal];
        [allShopBtn setBackgroundImage:[UIImage imageNamed:@"icon_06"] forState:UIControlStateSelected];
        [allShopBtn setTitle:@"所有店铺" forState:UIControlStateNormal];
        [allShopBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [allShopBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        allShopBtn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        [allShopBtn addTarget:self action:@selector(allShopBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview: allShopBtn];
        self.allShopBtn = allShopBtn;
        
        UIButton *timeBtn = [[UIButton alloc]init];
        [timeBtn setBackgroundImage:[UIImage imageNamed:@"icon_02"] forState:UIControlStateNormal];
        [timeBtn setTitle:@"上线时间" forState:UIControlStateNormal];
        [self addSubview:timeBtn];
        timeBtn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        [timeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.timeBtn = timeBtn;
        
        UIButton *shareBtn = [[UIButton alloc]init];
        [shareBtn setBackgroundImage:[UIImage imageNamed:@"product_05"] forState:UIControlStateNormal];
        [self addSubview:shareBtn];
        self.shareBtn = shareBtn;
        
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
        
        self.allShopBtn.sd_layout.topSpaceToView(self.title, 20)
        .leftSpaceToView(self, 20)
        .widthIs(80)
        .heightIs(42);
        
        self.timeBtn.sd_layout.topSpaceToView(self.title, 25)
        .leftSpaceToView(self.allShopBtn, 10)
        .widthIs(80)
        .heightIs(32);
        
        self.shareBtn.sd_layout.topSpaceToView(self.title, 30)
        .rightSpaceToView(self, 20)
        .widthIs(30)
        .heightIs(30);
        
            }
    return self;
}

-(void)allShopBtnClick{
    self.allShopBtn.selected = true;
}

@end
