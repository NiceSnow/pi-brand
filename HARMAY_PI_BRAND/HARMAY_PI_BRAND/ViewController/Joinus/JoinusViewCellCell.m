//
//  JoinusViewCellCell.m
//  HARMAY_PI_BRAND
//
//  Created by 刘厚宽 on 2017/7/27.
//  Copyright © 2017年 Madodg. All rights reserved.
//

#import "JoinusViewCellCell.h"


@interface JoinusViewCellCell ()

@end
@implementation JoinusViewCellCell

+ (instancetype)createCellWithTableView:(UITableView *)tableView
{
    static NSString * iden = @"JoinusViewCellCell";
    JoinusViewCellCell * cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[JoinusViewCellCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    return cell;
}

#pragma mark -
#pragma mark lifecycle
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"JoinusViewCellCell" owner:self options:nil]lastObject];
    }
    return self;
}
@end
