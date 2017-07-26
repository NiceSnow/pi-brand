//
//  HMHomeCell.m
//  harmay
//
//  Created by boldseas on 2017/7/17.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMHomeCell.h"
#import <SDAutoLayout.h>
#import "HMHomeData.h"
#import <UIImageView+WebCache.h>

@interface HMHomeCell()

/** 主图 */
@property (nonatomic, strong) UIImageView *titleview;
/** 副图 */
@property (nonatomic, strong) UIImageView *largeview;
/** 主标题 */
@property (nonatomic, strong) UILabel *mainLabel;
/** 副标题 */
@property (nonatomic, strong) UILabel *subLabel;
/** more */
@property (nonatomic, strong) UIButton *moreBtn;

@end

@implementation HMHomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.contentView.sd_layout.leftSpaceToView(self, 10.65)
        .rightSpaceToView(self, 10.65)
        .bottomSpaceToView(self, 10);
        
        /** 主图 */
        UIImageView *titleview = [[UIImageView alloc]init];
        [self.contentView addSubview:titleview];
        self.titleview = titleview;
        self.titleview.sd_layout.topSpaceToView(self.contentView, 10)
        .leftSpaceToView(self.contentView, 84)
        .rightSpaceToView(self.contentView, 84)
        .heightIs(100);
        /** 副图 */
        UIImageView *largeview = [[UIImageView alloc]init];
        [self.contentView addSubview:largeview];
        self.largeview = largeview;
        self.largeview.sd_layout.topSpaceToView(self.titleview, 5)
        .leftSpaceToView(self.contentView, 28)
        .rightSpaceToView(self.contentView, 28)
        .heightIs(173);
        /** 主标题 */
        UILabel *mainLabel = [[UILabel alloc]init];
        [self.contentView addSubview:mainLabel];
        self.mainLabel = mainLabel;
        self.mainLabel.font = [UIFont systemFontOfSize:18];
        self.mainLabel.numberOfLines = 1;
        self.mainLabel.textAlignment = NSTextAlignmentCenter;
        self.mainLabel.sd_layout.topSpaceToView(self.largeview, 15)
        .leftSpaceToView(self.contentView, 30)
        .rightSpaceToView(self.contentView, 30)
        .heightIs(20);
        /** 副标题 */
        UILabel *subLabel = [[UILabel alloc]init];
        [self.contentView addSubview:subLabel];
        self.subLabel = subLabel;
        self.subLabel.font = [UIFont systemFontOfSize:14];
        self.subLabel.numberOfLines = 0;
        self.subLabel.textAlignment = NSTextAlignmentCenter;
        
        self.subLabel.sd_layout.topSpaceToView(self.mainLabel, 15)
        .leftSpaceToView(self.contentView, 28)
        .rightSpaceToView(self.contentView, 28)
        .heightIs(40);
        /** more */
        UIButton *moreBtn = [[UIButton alloc]init];
        [self.contentView addSubview:moreBtn];
        self.moreBtn = moreBtn;
        [self.moreBtn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
        
        self.moreBtn.sd_layout.topSpaceToView(self.subLabel, 15)
        .centerXEqualToView(self.contentView)
        .widthRatioToView(self.contentView, 0.2)
        .heightIs(18);
        
        [self setupAutoHeightWithBottomView:moreBtn bottomMargin:14];
    }
    return self;
}

- (void)setData:(HMHomeData *)data{
    _data = data;
    
    //[self.titleview sd_setImageWithURL:[NSURL URLWithString:[data.vice_img stringByReplacingOccurrencesOfString:@"\" withString:@"/"]] placeholderImage:[UIImage imageNamed:@"activity_06"]];
    
    [self.titleview sd_setImageWithURL:[NSURL URLWithString:[data.vice_img stringByReplacingOccurrencesOfString:@"\\" withString:@"/"]] placeholderImage:[UIImage imageNamed:@"activity_06"]];
    
    [self.largeview sd_setImageWithURL:[NSURL URLWithString:[data.img stringByReplacingOccurrencesOfString:@"\\" withString:@"/"]] placeholderImage:[UIImage imageNamed:@"activity_06"]];
    
    self.mainLabel.text = data.title;
    self.subLabel.text = data.vice_heading;
}


@end
