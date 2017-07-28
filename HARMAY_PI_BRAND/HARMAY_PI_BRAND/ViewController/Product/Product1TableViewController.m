//
//  Product1TableViewController.m
//  HARMAY_PI_BRAND
//
//  Created by 刘厚宽 on 2017/7/28.
//  Copyright © 2017年 Madodg. All rights reserved.
//

#import "Product1TableViewController.h"
#import "UIViewController+XLScroll.h"
#import "Product1Cell.h"

@interface Product1TableViewController ()
{
    UIButton *tempButton;
}
@property (nonatomic, strong)NSMutableArray * titleArray;
@property (nonatomic, strong)NSMutableArray * imageArray;
@property (nonatomic, strong)UILabel * titleLabel;
@property (nonatomic, strong)UILabel * subTitleLabel;
@property (nonatomic, strong)UIImageView * backImageView;
@property (nonatomic, strong)UILabel* locationLabel;
@property (nonatomic, strong)UILabel* nameLabel;

@end

@implementation Product1TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupScroll];
   
    self.tableView.backgroundColor = [UIColor clearColor];
    _imageArray = [@[@"19_base1",@"23_base1",@"27_base1"] mutableCopy];
    _titleArray = [@[@"上海安福路308号",@"店铺电话：13661138037",@"营业时间10：00-22：00"] mutableCopy];

    self.tableView.separatorStyle = 0;
    self.tableView.estimatedSectionHeaderHeight = 5;
}
-(instancetype)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    UIView * backView = [UIView new];
    backView.backgroundColor = [UIColor whiteColor];
    
    
    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"15"]];
    [backView addSubview:imageView];
    _backImageView = imageView;
    
    if (section == 0) {
        UIImageView * logoImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"11"]];
        [backView addSubview:logoImageView];
        [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(15);
        }];
        
        UILabel * titleLabel = [UILabel new];
        titleLabel.text = @"HARMAY,关于美和美好的生活";
        titleLabel.font = [UIFont boldSystemFontOfSize:16];
        titleLabel.textColor = UICOLOR_RGB_Alpha(0x2a2a2a, 1);
        [backView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(logoImageView);
            make.top.equalTo(logoImageView.mas_bottom).offset(15);
        }];
        _titleLabel = titleLabel;
        
        
        _subTitleLabel = [UILabel new];
        _subTitleLabel.textColor  = UICOLOR_RGB_Alpha(0x000000, 1);
        _subTitleLabel.font = [UIFont systemFontOfSize:14];
        _subTitleLabel.text = @"实体店体验馆";
        [backView addSubview:_subTitleLabel];
        [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.equalTo(_titleLabel.mas_bottom).offset(25);
        }];
        
        
        UIButton * shareButton = [UIButton new];
        shareButton.backgroundColor = [UIColor redColor];
        [shareButton addTarget:self action:@selector(shareAction) forControlEvents:UIControlEventTouchUpInside];
        [backView addSubview:shareButton];
        [shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-15);
            make.centerY.equalTo(_subTitleLabel);
            make.width.height.mas_equalTo(30);
        }];
        
        [backView layoutIfNeeded];
        UIButton * lastBtn = [UIButton new];
        NSArray * titleArray = @[@"全部",@"北京",@"上海",@"香港"];
        for (NSInteger i = 0; i<titleArray.count; i++) {
            
            NSInteger index = i % 3;
            NSInteger page = i / 3;
            
            UIButton * btn = [UIButton new];
            btn.tag = i+100;
            [btn addTarget:self action:@selector(changeCityAction:) forControlEvents:UIControlEventTouchUpInside];
    
            [btn setBackgroundImage:[UIImage imageNamed:@"4"] forState:normal];
            [btn setBackgroundImage:[UIImage imageNamed:@"3"] forState:UIControlStateSelected];
            [btn setTitle:titleArray[i] forState:normal];
            [btn setTitle:titleArray[i] forState:UIControlStateSelected];
            [btn setTitleColor:UICOLOR_RGB_Alpha(0x6b6a6a, 1) forState:normal];
            [btn setTitleColor:UICOLOR_RGB_Alpha(0x6b6a6a, 1) forState:UIControlStateSelected];
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
            CGFloat Width_Space   =  10.0f;
            CGFloat Height_Space  =  10.0f;
            CGFloat x = 15;
            CGFloat y = CGRectGetMaxY(_subTitleLabel.frame)+20;
            CGFloat width = (screenWidth-20-Width_Space*2-2*x)/3.0;
            CGFloat height = 30.0;
            btn.frame = CGRectMake(index * (width + Width_Space) + x, page  * (height + Height_Space)+y, width, height);
            [backView addSubview:btn];
            lastBtn = btn;
        }
        
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(screenWidth-50);
            make.height.mas_equalTo((screenWidth-50)*429/632);
            make.centerX.equalTo(backView);
            make.top.equalTo(lastBtn.mas_bottom).offset(15);
        }];
        
    }else{
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(screenWidth-50);
            make.height.mas_equalTo((screenWidth-50)*429/632);
            make.centerX.equalTo(backView);
            make.top.mas_equalTo(15);
        }];
    }
    
    
    UILabel * label = [UILabel new];
    label.text = @"上海";
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = UICOLOR_RGB_Alpha(0xe52c4e, 1);
    [backView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(backView);
        make.top.equalTo(imageView.mas_bottom).offset(10);
    }];
    _locationLabel = label;
    
    UILabel * nameLabel = [UILabel new];
    nameLabel.text = @"安福路HARMAY";
    nameLabel.font = [UIFont systemFontOfSize:12];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.textColor = UICOLOR_RGB_Alpha(0x111111, 1);
    [backView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(backView);
        make.top.equalTo(label.mas_bottom).offset(10);
        make.bottom.mas_equalTo(0);
    }];
    _nameLabel = nameLabel;
    [view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(view);
        make.left.mas_offset(10);
        make.right.mas_offset(-10);
    }];
    
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return UITableViewAutomaticDimension;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Product1Cell *cell = [Product1Cell createCellWithTableView:tableView];
    cell.imageString = _imageArray[indexPath.row];
    cell.contentString = _titleArray[indexPath.row];
    return cell;
}
- (void)shareAction
{
    
}
- (void)changeCityAction:(UIButton *)btn
{
//    btn.selected = !btn.selected;
    tempButton.selected = NO;
    btn.selected = YES;
    tempButton = btn;
}
@end
