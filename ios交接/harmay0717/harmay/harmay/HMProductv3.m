//
//  HMProductv3.m
//  harmay
//
//  Created by boldseas on 2017/7/20.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMProductv3.h"
#import <SDAutoLayout.h>

@interface HMProductv3()

@property (nonatomic, weak) UIImageView *icon;
@property (nonatomic, weak) UIImageView *image;

@end

@implementation HMProductv3

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *icon = [[UIImageView alloc]init];
        icon.image = [UIImage imageNamed:@"icon_products"];
        [self addSubview:icon];
        self.icon = icon;
        
        UIImageView *image = [[UIImageView alloc]init];
        image.image = [UIImage imageNamed:@"product_06"];
        [self addSubview:image];
        self.image = image;
        
        
        
        //自动布局
        self.icon.sd_layout.topSpaceToView(self, 20)
        .leftSpaceToView(self, 20)
        .widthIs(100)
        .heightIs(8);
        
        self.image.sd_layout.topSpaceToView(self.icon, 30)
        .centerXEqualToView(self)
        .widthIs(150)
        .heightIs(64);
        
    }
    return self;
}

@end
