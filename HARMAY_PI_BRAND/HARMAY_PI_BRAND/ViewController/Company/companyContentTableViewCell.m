//
//  companyContentTableViewCell.m
//  HARMAY_PI_BRAND
//
//  Created by shengtian on 2017/7/28.
//  Copyright © 2017年 Madodg. All rights reserved.
//

#import "companyContentTableViewCell.h"

@interface companyContentTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *maintitle;
@property (weak, nonatomic) IBOutlet UILabel *secTitle;

@end

@implementation companyContentTableViewCell
- (IBAction)share:(UIButton *)sender {
}

-(void)addDataWith:(companyContentModel*)headerModle;{
    if (!headerModle) {
        return;
    }
    self.maintitle.text = headerModle.title;
    self.secTitle.text = headerModle.vice_heading;
    
}


+ (instancetype)createCellWithTableView:(UITableView *)tableView
{
    static NSString * iden = @"companyContentTableViewCell";
    companyContentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[companyContentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    return cell;
}

#pragma mark -
#pragma mark lifecycle
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"companyContentTableViewCell" owner:self options:nil]lastObject];
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
