//
//  HMProductV1.h
//  harmay
//
//  Created by boldseas on 2017/7/20.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HMProductV1Delegate <NSObject>

- (void)leftViewDidselectRowWithTag:(NSInteger) tag;

@end

@interface HMProductV1 : UIView

@property (nonatomic, weak) id<HMProductV1Delegate> delegate;

@end
