//
//  HMPageControl.m
//  harmay
//
//  Created by boldseas on 2017/7/19.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMPageControl.h"

@implementation HMPageControl


- (void)setCurrentPage:(NSInteger)currentPage{
    [super setCurrentPage:currentPage];
    
    for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++) {
        UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
        CGSize size;
        size.height = 2;
        size.width = 18;
        [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y,
                                     size.width,size.height)];
    }
}

@end
