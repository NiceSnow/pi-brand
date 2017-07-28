//
//  JoinusViewCell.m
//  HARMAY_PI_BRAND
//
//  Created by 刘厚宽 on 2017/7/27.
//  Copyright © 2017年 Madodg. All rights reserved.
//

#import "JoinusViewCell.h"
#import "joinSubModel.h"

@implementation JoinusViewCell

+ (instancetype)createCellWithTableView:(UITableView *)tableView
{
    static NSString * iden = @"JoinusViewCell";
    JoinusViewCell * cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[JoinusViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    return cell;
}

#pragma mark -
#pragma mark lifecycle
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"JoinusViewCell" owner:self options:nil]lastObject];
    }
    return self;
}
- (void)setDataArray:(NSArray *)dataArray
{
    _dataArray =dataArray;
}
@end
