//
//  HMHomeData.h
//  harmay
//
//  Created by boldseas on 2017/7/19.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HMHomeData : NSObject

/** 模块标识 */
@property (nonatomic, assign) NSInteger module;
/** 主图 */
@property (nonatomic, copy) NSString *img;
/** 副图 */
@property (nonatomic, copy) NSString *vice_img;
/** 主标题 */
@property (nonatomic, copy) NSString *title;
/** 副标题 */
@property (nonatomic, copy) NSString *vice_heading;

@end
