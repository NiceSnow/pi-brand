//
//  HUDView.m
//  HARMAY_PI_BRAND
//
//  Created by Madodg on 2017/7/29.
//  Copyright © 2017年 Madodg. All rights reserved.
//

#import "HUDView.h"

#import "UIImage+GIF.h"

@implementation HUDView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UICOLOR_RGB_Alpha(0xaeaeae,1) colorWithAlphaComponent:0.8];
        NSString  *filePath = [[NSBundle bundleWithPath:[[NSBundle mainBundle] bundlePath]] pathForResource:@"loding.gif" ofType:nil];
        
        NSData  *imageData = [NSData dataWithContentsOfFile:filePath];
        UIImageView* imageView = [UIImageView new];
        [self addSubview:imageView];
        imageView.image =  [UIImage sd_animatedGIFWithData:imageData];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.width.height.equalTo(@80);
        }];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
