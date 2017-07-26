//
//  HMProductLeftCell.m
//  harmay
//
//  Created by boldseas on 2017/7/20.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMProductLeftCell.h"
#import <SDAutoLayout.h>
#import "HMProductLeftBtn.h"
#import <UIImageView+WebCache.h>

@interface HMProductLeftCell()

@property (nonatomic, strong) UIImageView *largeImage;
@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UILabel *addressLabel;

@property (nonatomic, strong) HMProductLeftBtn *detailedAddressLabel;
@property (nonatomic, strong) UIView *lineView1;
@property (nonatomic, strong) HMProductLeftBtn *telephoneLabel;
@property (nonatomic, strong) UIView *lineView2;
@property (nonatomic, strong) HMProductLeftBtn *timeLabel;
@property (nonatomic, strong) UIView *lineView3;

@end

@implementation HMProductLeftCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.largeImage = [[UIImageView alloc]init];
//        self.largeImage.image = [UIImage imageNamed:@"activity_06"];
        [self.contentView addSubview:self.largeImage];
        
        self.cityLabel = [[UILabel alloc]init];
//        self.cityLabel.text = @"北京";
        self.cityLabel.textColor = [UIColor redColor];
        self.cityLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.cityLabel];
        
        self.addressLabel = [[UILabel alloc]init];
//        self.addressLabel.text = @"红庄国际文化HARMAY";
        self.addressLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:18];
        self.addressLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.addressLabel];
        
        self.detailedAddressLabel = [[HMProductLeftBtn alloc]init];
        [self.detailedAddressLabel setImage:[UIImage imageNamed:@"product_08"] forState:UIControlStateNormal];
//        [self.detailedAddressLabel setTitle:@"北京红庄国际文化保税创意园办公楼" forState:UIControlStateNormal];
        [self.detailedAddressLabel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:self.detailedAddressLabel];
        
        self.lineView1 = [[UIView alloc]init];
        self.lineView1.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.lineView1];
        
        self.telephoneLabel = [[HMProductLeftBtn alloc]init];
        [self.telephoneLabel setImage:[UIImage imageNamed:@"product_09"] forState:UIControlStateNormal];
//        [self.telephoneLabel setTitle:@"店铺电话：010-123454696" forState:UIControlStateNormal];
        [self.telephoneLabel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:self.telephoneLabel];
        
        self.lineView2 = [[UIView alloc]init];
        self.lineView2.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.lineView2];
        
        self.timeLabel = [[HMProductLeftBtn alloc]init];
        [self.timeLabel setImage:[UIImage imageNamed:@"product_10"] forState:UIControlStateNormal];
//        [self.timeLabel setTitle:@"营业时间：10：00-22：00" forState:UIControlStateNormal];
        [self.timeLabel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:self.timeLabel];
        
        self.lineView3 = [[UIView alloc]init];
        self.lineView3.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.lineView3];
        
        
        //自动布局
        self.largeImage.sd_layout.topSpaceToView(self.contentView, 0)
        .leftSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 15)
        .heightIs(202);
        
        self.cityLabel.sd_layout.topSpaceToView(self.largeImage, 15)
        .leftSpaceToView(self.contentView, 0)
        .rightSpaceToView(self.contentView, 0)
        .autoHeightRatio(0);
        
        self.addressLabel.sd_layout.topSpaceToView(self.cityLabel, 10)
        .leftSpaceToView(self.contentView, 0)
        .rightSpaceToView(self.contentView, 0)
        .autoHeightRatio(0);
        
        self.detailedAddressLabel.sd_layout.topSpaceToView(self.addressLabel, 20)
        .leftSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 15)
        .heightIs(30);
        
        self.lineView1.sd_layout.topSpaceToView(self.detailedAddressLabel, 15)
        .leftSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 15)
        .heightIs(1);
        
        self.telephoneLabel.sd_layout.topSpaceToView(self.lineView1, 15)
        .leftSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 15)
        .heightIs(30);
        
        self.lineView2.sd_layout.topSpaceToView(self.telephoneLabel, 15)
        .leftSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 15)
        .heightIs(1);
        
        self.timeLabel.sd_layout.topSpaceToView(self.lineView2, 15)
        .leftSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 15)
        .heightIs(30);
        
        self.lineView3.sd_layout.topSpaceToView(self.timeLabel, 15)
        .leftSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 15)
        .heightIs(1);
        
        [self setupAutoHeightWithBottomView:self.lineView3 bottomMargin:25];

    }
    return self;
}

-(void)setData:(HMHMProductLeftCellModel *)data{
    _data = data;
    
    [self.largeImage sd_setImageWithURL:[data.img stringByReplacingOccurrencesOfString:@"\\" withString:@"/"]];
    self.cityLabel.text = data.city_name;
    self.addressLabel.text = data.summary;
    [self.detailedAddressLabel setTitle:data.address forState:UIControlStateNormal];
    [self.telephoneLabel setTitle:[NSString stringWithFormat:@"店铺电话：%@", data.tel] forState:UIControlStateNormal];
    [self.timeLabel setTitle:[NSString stringWithFormat:@"营业时间：%@", data.business_hours] forState:UIControlStateNormal];
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
