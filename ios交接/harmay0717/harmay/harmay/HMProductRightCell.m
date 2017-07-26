//
//  HMProductRightCell.m
//  harmay
//
//  Created by boldseas on 2017/7/20.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMProductRightCell.h"
#import <SDAutoLayout.h>
#import <UIImageView+WebCache.h>

@interface HMProductRightCell()

@property (nonatomic, strong) UIImageView *largeImage;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detaileLabel;

@end

@implementation HMProductRightCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.largeImage = [[UIImageView alloc]init];
//        self.largeImage.image = [UIImage imageNamed:@"product_18"];
        [self.contentView addSubview:self.largeImage];
        
        self.titleLabel = [[UILabel alloc]init];
//        self.titleLabel.text = @"FRESH，花信如莲尽享初言";
        self.titleLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:16];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.titleLabel];
        
        self.detaileLabel = [[UILabel alloc]init];
        self.detaileLabel.text = @"FRESH是纯净之美FRESH是纯净之美FRESH是纯净之美FRESH是纯净之美FRESH是纯净之美FRESH是纯净之美";
        self.detaileLabel.textColor = [UIColor blackColor];
        self.detaileLabel.textAlignment = NSTextAlignmentCenter;
        self.detaileLabel.numberOfLines = 2;
        self.detaileLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.detaileLabel];
        
        //自动布局
        self.largeImage.sd_layout.topSpaceToView(self.contentView, 10)
        .leftSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 15)
        .heightIs(173);
        
        self.titleLabel.sd_layout.topSpaceToView(self.largeImage, 20)
        .leftSpaceToView(self.contentView, 0)
        .rightSpaceToView(self.contentView, 0)
        .autoHeightRatio(0);
        
        self.detaileLabel.sd_layout.topSpaceToView(self.titleLabel, 8)
        .leftSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
        
        [self setupAutoHeightWithBottomView:self.detaileLabel bottomMargin:15];
    }
    return self;
}

-(void)setRightdata:(HMProductRightCellModel *)rightdata{
    _rightdata = rightdata;
    
    [self.largeImage sd_setImageWithURL:[rightdata.img stringByReplacingOccurrencesOfString:@"\\" withString:@"/"]];
    self.titleLabel.text = rightdata.title;
    self.detaileLabel.text = rightdata.vice_heading;
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
