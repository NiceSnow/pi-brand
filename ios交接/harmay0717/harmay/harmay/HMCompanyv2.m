//
//  HMCompanyv2.m
//  harmay
//
//  Created by boldseas on 2017/7/20.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMCompanyv2.h"
#import <SDAutoLayout.h>
#import "HMPCH.h"

@interface HMCompanyv2()

@property (nonatomic, weak) UIImageView *icon;
@property (nonatomic, weak) UIImageView *image;
@property (nonatomic, weak) UILabel *title;

@property (nonatomic, weak) UIImageView *contentImage;
@property (nonatomic, weak) UILabel *contentTitle;
@property (nonatomic, weak) UILabel *contentVice_Title;
@property (nonatomic, weak) UILabel *contentAdd_time;


@end

@implementation HMCompanyv2


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        UIImageView *icon = [[UIImageView alloc]init];
        icon.image = [UIImage imageNamed:@"dl_recu"];
        [self addSubview:icon];
        self.icon = icon;
        
        UIImageView *image = [[UIImageView alloc]init];
        image.image = [UIImage imageNamed:@"activity_04"];
        [self addSubview:image];
        self.image = image;
        
        UILabel *title = [[UILabel alloc]init];
        title.text = @"一段与HARMAY的神秘邂逅";
        title.textColor = BHColor(171, 171, 171);
        title.font = [UIFont systemFontOfSize:12];
        [self addSubview:title];
        self.title = title;
        
        UIImageView *contentImage = [[UIImageView alloc]init];
        contentImage.image = [UIImage imageNamed:@"activity_05"];
        [self addSubview:contentImage];
        self.contentImage = contentImage;
        
        UILabel *contentTitle = [[UILabel alloc]init];
        contentTitle.text = @"HARMAY，品牌发布会即将召开";
        title.textAlignment = NSTextAlignmentLeft;
        [self addSubview:contentTitle];
        self.contentTitle = contentTitle;
        
        UILabel *contentVice_Title = [[UILabel alloc]init];
        contentVice_Title.text = @"HARMAY | 一个懂梅，会选，有格调的美妆电商";
        contentVice_Title.font = [UIFont systemFontOfSize:12];
        contentVice_Title.textColor = BHColor(171, 171, 171);
        title.textAlignment = NSTextAlignmentLeft;
        [self addSubview:contentVice_Title];
        self.contentVice_Title = contentVice_Title;
        
        UILabel *contentAdd_time = [[UILabel alloc]init];
        contentAdd_time.text = @"07 月 14 日更新";
        contentAdd_time.textColor = BHColor(171, 171, 171);
        contentAdd_time.font = [UIFont systemFontOfSize:12];
        title.textAlignment = NSTextAlignmentLeft;
        
        [self addSubview:contentAdd_time];
        self.contentAdd_time = contentAdd_time;
        
        //自动布局
        self.icon.sd_layout.topSpaceToView(self, 20)
        .leftSpaceToView(self, 20)
        .widthRatioToView(self, 0.4)
        .heightIs(10);
        
        self.image.sd_layout.topSpaceToView(self.icon, 20)
        .centerXEqualToView(self)
        .widthRatioToView(self, 0.6)
        .heightIs(57);
        
        title.textAlignment = NSTextAlignmentCenter;
        self.title.sd_layout.topSpaceToView(self.image, 30)
        .widthRatioToView(self, 1)
        .autoHeightRatio(0);
        
        self.contentImage.sd_layout.topSpaceToView(self.title, 30)
        .leftSpaceToView(self, 20)
        .rightSpaceToView(self, 20)
        .heightIs(202);
        
        self.contentVice_Title.sd_layout.topSpaceToView(self.contentImage, 30)
        .leftSpaceToView(self, 20)
        .widthRatioToView(self, 1)
        .autoHeightRatio(0);
        
        self.contentTitle.sd_layout.topSpaceToView(self.contentVice_Title, 10)
        .leftSpaceToView(self, 20)
        .widthRatioToView(self, 1)
        .autoHeightRatio(0);
        
        self.contentAdd_time.sd_layout.topSpaceToView(self.contentTitle, 10)
        .leftSpaceToView(self, 20)
        .widthRatioToView(self, 1)
        .autoHeightRatio(0);
        
//        [self setupAutoHeightWithBottomView:self.contentAdd_time bottomMargin:30];
    }
    return self;
}


@end
