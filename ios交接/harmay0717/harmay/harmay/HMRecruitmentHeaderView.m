//
//  HMRecruitmentHeaderView.m
//  harmay
//
//  Created by boldseas on 2017/7/22.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMRecruitmentHeaderView.h"
#import <SDAutoLayout.h>

@interface HMRecruitmentHeaderView()

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UILabel *title;


@property (nonatomic, strong) UIImageView *mainImage;
@property (nonatomic, strong) UILabel *main_title;
@property (nonatomic, strong) UILabel *vice_title;

@end

@implementation HMRecruitmentHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        //头
        UIImageView *icon = [[UIImageView alloc]init];
        icon.image = [UIImage imageNamed:@"dl_recu"];
        [self addSubview:icon];
        self.icon = icon;
        
        UIImageView *image = [[UIImageView alloc]init];
        image.image = [UIImage imageNamed:@"index_05"];
        [self addSubview:image];
        self.image = image;
        
        UILabel *title = [[UILabel alloc]init];
        title.text = @"一段与HARMAY的神秘邂逅";
        title.font = [UIFont systemFontOfSize:15];
        title.textColor = [UIColor lightGrayColor];
        [self addSubview:title];
        self.title = title;
        
        //主体
        UIImageView *mainImage = [[UIImageView alloc]init];
        mainImage.image = [UIImage imageNamed:@"index_04"];
        [self addSubview:mainImage];
        self.mainImage = mainImage;
        
        UILabel *main_title = [[UILabel alloc]init];
        main_title.text = @"茫茫人海，蓦然回首，你在哪里";
        main_title.font = [UIFont systemFontOfSize:20];
        [self addSubview:main_title];
        self.main_title = main_title;
        
        UILabel *vice_title = [[UILabel alloc]init];
        vice_title.text = @"小清新，文艺范，女神男神，应有尽有，总有一款适合你";
        vice_title.textColor = [UIColor lightGrayColor];
        vice_title.font = [UIFont systemFontOfSize:12];
        [self addSubview:vice_title];
        self.vice_title = vice_title;
        
        self.icon.sd_layout.topSpaceToView(self, 15)
        .leftSpaceToView(self, 15)
        .widthIs(150)
        .heightIs(10);
        
        self.image.sd_layout.topSpaceToView(self.icon, 15)
        .centerXEqualToView(self)
        .widthIs(200)
        .heightIs(100);
        
        self.title.textAlignment = NSTextAlignmentCenter;
        self.title.sd_layout.topSpaceToView(self.image, 10)
        .centerXEqualToView(self)
        .widthRatioToView(self, 1)
        .autoHeightRatio(0);
        
        self.mainImage.sd_layout.topSpaceToView(self.title, 20)
        .centerXEqualToView(self)
        .widthIs(315)
        .heightIs(214);
        
        self.main_title.sd_layout.topSpaceToView(self.mainImage, 15)
        .leftSpaceToView(self, 20)
        .widthRatioToView(self, 1)
        .autoHeightRatio(0);
        
        self.vice_title.sd_layout.topSpaceToView(self.main_title, 15)
        .leftSpaceToView(self, 20)
        .widthRatioToView(self, 1)
        .autoHeightRatio(0);
        
        [self setupAutoHeightWithBottomView:self.vice_title bottomMargin:30];
    }
    return self;
}

@end






















