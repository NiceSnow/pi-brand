//
//  UIBarButtonItem+Extension.m
//  xinlangweibo0621
//
//  Created by boldseas on 2017/6/21.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage]forState:UIControlStateHighlighted];
    CGRect btnframe = btn.frame;
    btnframe.size = btn.currentBackgroundImage.size;
    btn.frame = CGRectMake(0, 0, 20, 20);
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}





@end
