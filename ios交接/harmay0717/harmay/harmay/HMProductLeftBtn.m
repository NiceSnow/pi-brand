//
//  HMProductLeftBtn.m
//  harmay
//
//  Created by boldseas on 2017/7/21.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMProductLeftBtn.h"
#import <SDAutoLayout.h>
#import "HMPCH.h"

@implementation HMProductLeftBtn

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
    
    self.imageView.sd_layout.leftSpaceToView(self, 2)
    .bottomEqualToView(self)
    .widthIs(20)
    .heightEqualToWidth();
    
    self.titleLabel.sd_layout.leftSpaceToView(self.imageView, 15)
    .bottomEqualToView(self);
    //    .centerYEqualToView(self.imageView);
    
}



@end
