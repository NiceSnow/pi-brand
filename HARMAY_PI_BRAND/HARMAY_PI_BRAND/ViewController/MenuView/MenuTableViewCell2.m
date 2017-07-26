//
//  MenuTableViewCell2.m
//  HARMAY_PI_BRAND
//
//  Created by shengtian on 2017/7/26.
//  Copyright © 2017年 Madodg. All rights reserved.
//

#import "MenuTableViewCell2.h"


@implementation MenuTableViewCell2
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
