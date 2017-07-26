//
//  HMProductCityBtn.m
//  harmay
//
//  Created by boldseas on 2017/7/22.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMProductCityBtn.h"
#import "HMPCH.h"
#import <SDAutoLayout.h>

@implementation HMProductCityBtn

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    [self setTitleColor:BHColor(50, 50, 50) forState:UIControlStateNormal];
    [self.layer setBorderWidth:1];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef borderColorRef = CGColorCreate(colorSpace,(CGFloat[]){ 0.378, 0.378, 0.378, 1 });
    [self.layer setBorderColor:borderColorRef];
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];

    self.titleLabel.sd_layout.centerXEqualToView(self);
    
}

@end
