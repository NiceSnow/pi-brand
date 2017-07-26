//
//  HMCityView.m
//  harmay
//
//  Created by boldseas on 2017/7/20.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMCityView.h"
#import "HMProductCityBtn.h"
#import <SDAutoLayout.h>

@interface HMCityView()

//@property (nonatomic, weak) UIImageView *largeImage;
//@property (nonatomic, weak) UILabel *cityLabel;
//@property (nonatomic, weak) UILabel *addressLabel;
//
//@property (nonatomic, weak) UILabel *detailedAddressLabel;
//@property (nonatomic, weak) UILabel *telephoneLabel;
//@property (nonatomic, weak) UILabel *timeLabel;

@property (nonatomic, strong) HMProductCityBtn *allBtn;
@property (nonatomic, strong) HMProductCityBtn *bjBtn;
@property (nonatomic, strong) HMProductCityBtn *shBtn;
@property (nonatomic, strong) HMProductCityBtn *hkBtn;

@end

@implementation HMCityView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.allBtn = [[HMProductCityBtn alloc]init];
        [self.allBtn setTitle:@"全部" forState:UIControlStateNormal];
        [self addSubview:self.allBtn];
        
        self.bjBtn = [[HMProductCityBtn alloc]init];
        [self.bjBtn setTitle:@"北京" forState:UIControlStateNormal];
        [self addSubview:self.bjBtn];
        
        self.shBtn = [[HMProductCityBtn alloc]init];
        [self.shBtn setTitle:@"上海" forState:UIControlStateNormal];
        [self addSubview:self.shBtn];
        
        self.hkBtn = [[HMProductCityBtn alloc]init];
        [self.hkBtn setTitle:@"香港" forState:UIControlStateNormal];
        [self addSubview:self.hkBtn];
        
        
        
        self.allBtn.sd_layout.topSpaceToView(self, 10)
        .leftSpaceToView(self, 20)
        .rightSpaceToView(self, 20)
        .widthIs(60)
        .heightIs(20);
    }
    return self;
}

@end

//        UIImageView *largeImage = [[UIImageView alloc]init];
//        [self addSubview:largeImage];
//        self.largeImage = largeImage;
//
//        UILabel *cityLabel = [[UILabel alloc]init];
//        [self addSubview:cityLabel];
//        self.cityLabel = cityLabel;
//
//        UILabel *addressLabel = [[UILabel alloc]init];
//        [self addSubview:addressLabel];
//        self.addressLabel = addressLabel;
//
//        UILabel *detailedAddressLabel = [[UILabel alloc]init];
//        [self addSubview:detailedAddressLabel];
//        self.detailedAddressLabel = detailedAddressLabel;
//
//        UILabel *telephoneLabel = [[UILabel alloc]init];
//        [self addSubview:telephoneLabel];
//        self.telephoneLabel = telephoneLabel;
//
//        UILabel *timeLabel = [[UILabel alloc]init];
//        [self addSubview:timeLabel];
//        self.timeLabel = timeLabel;

