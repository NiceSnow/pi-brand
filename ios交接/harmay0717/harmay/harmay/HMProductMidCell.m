//
//  HMProductMidCell.m
//  harmay
//
//  Created by boldseas on 2017/7/20.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMProductMidCell.h"
#import <SDAutoLayout.h>
#import <UIImageView+WebCache.h>

@interface HMProductMidCell()

@property (nonatomic, strong) UIImageView *largeImage;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation HMProductMidCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.largeImage = [[UIImageView alloc]init];
//        self.largeImage.image = [UIImage imageNamed:@"product_18"];
        [self.contentView addSubview:self.largeImage];
        
        self.titleLabel = [[UILabel alloc]init];
//        self.titleLabel.text = @"话梅护肤-全球购店铺";
        self.titleLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:16];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.titleLabel];
        
        
        //自动布局
        self.largeImage.sd_layout.topSpaceToView(self.contentView, 10)
        .leftSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 15)
        .heightIs(173);
        
        self.titleLabel.sd_layout.topSpaceToView(self.largeImage, 15)
        .leftSpaceToView(self.contentView, 0)
        .rightSpaceToView(self.contentView, 0)
        .autoHeightRatio(0);
        
        [self setupAutoHeightWithBottomView:self.titleLabel bottomMargin:20];
    }
    return self;
}

-(void)setMidData:(HMProductMidCellModel *)midData{
    _midData = midData;
    [self.largeImage sd_setImageWithURL:[midData.store_img stringByReplacingOccurrencesOfString:@"\\" withString:@"/"]];;
    self.titleLabel.text = midData.store_name;
    
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
