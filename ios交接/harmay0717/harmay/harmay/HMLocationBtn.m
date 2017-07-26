//
//  HMLocationBtn.m
//  harmay
//
//  Created by boldseas on 2017/7/18.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMLocationBtn.h"
#import "HMPCH.h"
#import <SDAutoLayout.h>

@implementation HMLocationBtn

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    [self setTitle:@"实体店" forState:UIControlStateNormal];
    [self setTitleColor:BHColor(173, 173, 173) forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"nav_12"] forState:UIControlStateNormal];
//    [self.layer setBorderWidth:1];
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGColorRef borderColorRef = CGColorCreate(colorSpace,(CGFloat[]){ 0.678, 0.678, 0.678, 1 });
//    [self.layer setBorderColor:borderColorRef];
    //    self.backgroundColor = [UIColor orangeColor];
    //    self.imageView.backgroundColor = [UIColor redColor];
    //    self.titleLabel.backgroundColor = [UIColor blueColor];
    
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.sd_layout.leftSpaceToView(self, 5)
    .centerYEqualToView(self)
    .widthIs(25)
    .heightEqualToWidth();
    
    self.titleLabel.sd_layout.leftSpaceToView(self.imageView, 10);
    //    .centerYEqualToView(self.imageView);
    
}
@end
