//
//  ActiveTableViewCell.m
//  HARMAY_PI_BRAND
//
//  Created by Madodg on 2017/7/29.
//  Copyright © 2017年 Madodg. All rights reserved.
//

#import "ActiveTableViewCell.h"

@interface ActiveTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headerIamgeView;
@property (weak, nonatomic) IBOutlet UILabel *secTitle;
@property (weak, nonatomic) IBOutlet UILabel *mainTitle;
@property (weak, nonatomic) IBOutlet UILabel *timeTitle;

@end

@implementation ActiveTableViewCell

-(void)addDataWith:(subModel2*)modle;{
    
    _timeTitle.text = modle.add_time;
    _secTitle.text = modle.vice_heading;
    _mainTitle.text = modle.title;
    [_headerIamgeView sd_setImageWithURL:[modle.img safeUrlString] placeholderImage:[UIImage imageNamed:@"07"]];
    
}

+ (instancetype)createCellWithTableView:(UITableView *)tableView
{
    static NSString * iden = @"ActiveTableViewCell";
    ActiveTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[ActiveTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    return cell;
}

#pragma mark -
#pragma mark lifecycle
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"ActiveTableViewCell" owner:self options:nil]lastObject];
        [_headerIamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(screenWidth*3/4);
            make.height.mas_equalTo(screenWidth*3/4*332/628);
        }];
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
