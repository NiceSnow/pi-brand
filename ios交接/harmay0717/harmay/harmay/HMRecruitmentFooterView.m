//
//  HMRecruitmentFooterView.m
//  harmay
//
//  Created by boldseas on 2017/7/22.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMRecruitmentFooterView.h"
#import <SDAutoLayout.h>
#import "HMRecruitmentTeleBtn.h"
#import "HMRecruitmentJobBtn.h"

@interface HMRecruitmentFooterView()

@property (nonatomic, strong) UILabel *resumeLabel;
@property (nonatomic, strong) UILabel *emailLabel;
@property (nonatomic, strong) HMRecruitmentTeleBtn *telephoneBtn;
@property (nonatomic, strong) UIView *line1;

@property (nonatomic, strong) HMRecruitmentJobBtn *caiwuBtn;
@property (nonatomic, strong) HMRecruitmentJobBtn *kefuBtn;
@property (nonatomic, strong) HMRecruitmentJobBtn *yunyingBtn;
@property (nonatomic, strong) HMRecruitmentJobBtn *shejiBtn;
@property (nonatomic, strong) HMRecruitmentJobBtn *sheyingBtn;
@property (nonatomic, strong) HMRecruitmentJobBtn *shixiBtn;
@property (nonatomic, strong) HMRecruitmentJobBtn *dianzhangBtn;

@property (nonatomic, strong) UIView *btnView;
@property (nonatomic, strong) UIView *line2;


@end

@implementation HMRecruitmentFooterView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.resumeLabel = [[UILabel alloc]init];
        self.resumeLabel.text = @"简历可发送至邮箱";
        self.resumeLabel.font = [UIFont systemFontOfSize:18];
        self.resumeLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:self.resumeLabel];
        
        self.emailLabel = [[UILabel alloc]init];
        self.emailLabel.text = @"harmay@postermaster.com";
        self.emailLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:self.emailLabel];
        
        self.telephoneBtn = [[HMRecruitmentTeleBtn alloc]init];
        [self.telephoneBtn setImage:[UIImage imageNamed:@"recruit_05"] forState:UIControlStateNormal];
        [self.telephoneBtn setTitle:@"热线" forState:UIControlStateNormal];
        [self addSubview:self.telephoneBtn];
        
        self.line1 = [[UIView alloc]init];
        self.line1.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.line1];
        
//        self.caiwuBtn = [[HMRecruitmentJobBtn alloc]init];
//        [self.caiwuBtn setTitle:@"财务出纳" forState:UIControlStateNormal];
//        [self.caiwuBtn setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
//        [self addSubview:self.caiwuBtn];
//        
//        self.kefuBtn = [[HMRecruitmentJobBtn alloc]init];
//        [self.kefuBtn setTitle:@"客服专员" forState:UIControlStateNormal];
//        [self.kefuBtn setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
//        [self addSubview:self.kefuBtn];
//        
//        self.yunyingBtn = [[HMRecruitmentJobBtn alloc]init];
//        [self.yunyingBtn setTitle:@"运营专员" forState:UIControlStateNormal];
//        [self.yunyingBtn setImage:[UIImage imageNamed:@"3"] forState:UIControlStateNormal];
//        [self addSubview:self.yunyingBtn];
//        
//        self.shejiBtn = [[HMRecruitmentJobBtn alloc]init];
//        [self.shejiBtn setTitle:@"平面设计师" forState:UIControlStateNormal];
//        [self.shejiBtn setImage:[UIImage imageNamed:@"4"] forState:UIControlStateNormal];
//        [self addSubview:self.shejiBtn];
//        
//        self.sheyingBtn = [[HMRecruitmentJobBtn alloc]init];
//        [self.sheyingBtn setTitle:@"摄影剪辑师" forState:UIControlStateNormal];
//        [self.sheyingBtn setImage:[UIImage imageNamed:@"5"] forState:UIControlStateNormal];
//        [self addSubview:self.sheyingBtn];
//        
//        self.shixiBtn = [[HMRecruitmentJobBtn alloc]init];
//        [self.shixiBtn setTitle:@"实习生" forState:UIControlStateNormal];
//        [self.shixiBtn setImage:[UIImage imageNamed:@"6"] forState:UIControlStateNormal];
//        [self addSubview:self.shixiBtn];
//        
//        self.dianzhangBtn = [[HMRecruitmentJobBtn alloc]init];
//        [self.dianzhangBtn setTitle:@"天猫店长" forState:UIControlStateNormal];
//        [self.dianzhangBtn setImage:[UIImage imageNamed:@"7"] forState:UIControlStateNormal];
//        [self addSubview:self.dianzhangBtn];
        
        self.btnView = [[UIView alloc]init];
        self.btnView.backgroundColor = [UIColor redColor];
        [self addSubview:self.btnView];
        
        self.line2 = [[UIView alloc]init];
        self.line2.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.line2];
        
        //自动布局
        self.resumeLabel.sd_layout.topSpaceToView(self, 20)
        .leftSpaceToView(self, 20)
        .widthIs(200)
        .autoHeightRatio(0);
        
        self.emailLabel.sd_layout.topSpaceToView(self.resumeLabel, 10)
        .leftSpaceToView(self, 20)
        .widthIs(220)
        .autoHeightRatio(0);
        
        self.telephoneBtn.sd_layout.topSpaceToView(self, 30)
        .rightSpaceToView(self, 40)
        .widthIs(31)
        .heightIs(60);
        
        self.line1.sd_layout.topSpaceToView(self.emailLabel, 20)
        .leftSpaceToView(self, 20)
        .rightSpaceToView(self, 20)
        .heightIs(1);
        
        self.btnView.sd_layout.topSpaceToView(self.line1, 25)
        .leftSpaceToView(self, 20)
        .rightSpaceToView(self, 20)
        .heightIs(200);
        
//        //职位按钮
//        self.caiwuBtn.sd_layout.topSpaceToView(self.line1, 25)
//        .leftSpaceToView(self, 30)
//        .widthIs(80)
//        .heightEqualToWidth();
//        
//        self.kefuBtn.sd_layout.topSpaceToView(self.line1, 25)
//        .centerXEqualToView(self)
//        .widthIs(80)
//        .heightEqualToWidth();
//        
//        self.yunyingBtn.sd_layout.topSpaceToView(self.line1, 25)
//        .rightSpaceToView(self, 30)
//        .widthIs(80)
//        .heightEqualToWidth();
//        
//        self.shejiBtn.sd_layout.topSpaceToView(self.yunyingBtn, 25)
//        .leftSpaceToView(self, 30)
//        .widthIs(80)
//        .heightEqualToWidth();
//        
//        self.sheyingBtn.sd_layout.topSpaceToView(self.yunyingBtn, 25)
//        .centerXEqualToView(self)
//        .widthIs(80)
//        .heightEqualToWidth();
//        
//        self.shixiBtn.sd_layout.topSpaceToView(self.yunyingBtn, 25)
//        .rightSpaceToView(self, 30)
//        .widthIs(80)
//        .heightEqualToWidth();
//        
//        self.dianzhangBtn.sd_layout.topSpaceToView(self.shixiBtn, 25)
//        .leftSpaceToView(self, 30)
//        .widthIs(80)
//        .heightEqualToWidth();
        
        self.line2.sd_layout.topSpaceToView(self.btnView, 10)
        .leftSpaceToView(self, 20)
        .rightSpaceToView(self, 20)
        .heightIs(1);

        
        [self setupAutoHeightWithBottomView:self.line2 bottomMargin:30];
    }
    return self;
}

@end
