//
//  HMRecruitmentTeleBtn.m
//  harmay
//
//  Created by boldseas on 2017/7/22.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMRecruitmentTeleBtn.h"
#import <SDAutoLayout.h>
#import "HMPCH.h"

@implementation HMRecruitmentTeleBtn

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    self.backgroundColor = [UIColor clearColor];
    self.imageView.backgroundColor = [UIColor clearColor];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.sd_layout.leftSpaceToView(self, 0)
    .topEqualToView(self)
    .widthIs(31)
    .heightIs(31);
    
    self.titleLabel.sd_layout.topSpaceToView(self.imageView, 1)
    .leftEqualToView(self)
    .widthIs(31)
    .autoHeightRatio(0);
}

@end
