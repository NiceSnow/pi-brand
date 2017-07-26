//
//  HMRecruitmentJobBtn.m
//  harmay
//
//  Created by boldseas on 2017/7/22.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMRecruitmentJobBtn.h"
#import <SDAutoLayout.h>

@implementation HMRecruitmentJobBtn

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    self.titleLabel.font = [UIFont systemFontOfSize:13];
    self.titleLabel.numberOfLines = 1;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    self.backgroundColor = [UIColor clearColor];
    self.imageView.backgroundColor = [UIColor clearColor];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.sd_layout.leftSpaceToView(self, 0)
    .leftSpaceToView(self, 20)
    .widthIs(40)
    .heightIs(40);
    
    self.titleLabel.sd_layout.topSpaceToView(self.imageView, 2)
    .centerXEqualToView(self)
    .widthRatioToView(self, 1)
    .autoHeightRatio(0);
}

@end
