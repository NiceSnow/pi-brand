//
//  MenuTableViewCell.m
//  HARMAY_PI_BRAND
//
//  Created by shengtian on 2017/7/26.
//  Copyright © 2017年 Madodg. All rights reserved.
//

#import "MenuTableViewCell.h"

@implementation MenuTableViewCell

+ (instancetype)createCellWithTableView:(UITableView *)tableView
{
    static NSString * iden = @"MenuTableViewCell";
    MenuTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[MenuTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"MenuTableViewCell" owner:self options:nil]lastObject];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
