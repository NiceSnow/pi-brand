//
//  HMPCH.h
//  harmay
//
//  Created by boldseas on 2017/7/17.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#ifndef HMPCH_h
#define HMPCH_h

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

//随机色
#define BHRandomColor BHColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

//RGB颜色
#define BHColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]


#endif /* HMPCH_h */
