//
//  MenuTableViewCell2.m
//  HARMAY_PI_BRAND
//
//  Created by shengtian on 2017/7/26.
//  Copyright © 2017年 Madodg. All rights reserved.
//

#import "MenuTableViewCell2.h"

@interface MenuTableViewCell2 (){
    UIButton* lastBtn;
}

@end


@implementation MenuTableViewCell2

-(void)addDataWithArray:(NSArray*)arr;{
    if (arr.count<=0) {
        return;
    }
    CGFloat with = (screenWidth*4/5 - 100)/3;
    for (int i = 0; i < arr.count; i++) {
        UIButton* btn = [[UIButton alloc]initWithFrame:CGRectMake(100 + with*(i%3), 100 + 45*i/3 , with, 25)];
        btn.backgroundColor = [UIColor redColor];
        btn.tag = i;
        [self addSubview:btn];
        if (i == arr.count - 1) {
            lastBtn = btn;
        }
    }
    [lastBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-20);
    }];
}

- (IBAction)jumpToWebView:(UIButton *)sender {
    DebugLog(@"%ld",sender.tag);
    WebViewController* VC = [ChildViewController instance].webVC;
    if (sender.tag == 2) {
        VC.MYURL = @"https://github.com";
    }else
    VC.MYURL = @"https://www.baidu.com";
    [self.ViewController.sideMenuViewController setContentViewController:[ChildViewController instance].WebNavgation animated:YES];
    [self.ViewController.sideMenuViewController hideMenuViewController];
}

+ (instancetype)createCellWithTableView:(UITableView *)tableView
{
    static NSString * iden = @"MenuTableViewCell2";
    MenuTableViewCell2 * cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[MenuTableViewCell2 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"MenuTableViewCell2" owner:self options:nil]lastObject];
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
