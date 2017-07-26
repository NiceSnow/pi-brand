//
//  HMHomeViewController.m
//  harmay
//
//  Created by boldseas on 2017/7/17.
//  Copyright © 2017年 renbohan. All rights reserved.
//  首页

#import "HMHomeViewController.h"
#import "HMSearchViewController.h"
#import <SDAutoLayout.h>
#import "HMHomeCell.h"
#import "RESideMenu.h"
#import "HMHomeData.h"
#import <MJExtension.h>
#import "HMCompanyViewController.h"
#import <AFNetworking.h>
#import "HMProductViewController.h"
#import "HMRecruitmentViewController.h"
#import "HMCompanyController.h"
#import "HMProductController.h"
#import "HMPCH.h"
#import "XLNetEaseStudyDetailVC.h"

@interface HMHomeViewController ()

//背景图片
@property (nonatomic, strong) UIImageView *bgd;

@property (nonatomic, strong) UIView *marginView;

@property (nonatomic, strong) NSArray *homeDatas;

@property (nonatomic, strong) HMCompanyViewController *company;
@property (nonatomic, strong) HMProductController *product;
@property (nonatomic, strong) HMRecruitmentViewController *recruitment;

@property (nonatomic, strong) XLNetEaseStudyDetailVC *secondView;

@end

@implementation HMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView.contentInset = UIEdgeInsetsMake(280.65, 0, 0, 0);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    /** 背景图片 */
    [self setupBgd];
    //导航栏标题图片
    [self setupNavTitleImage];
    
    [self loadHomeData];
    
}

- (void)loadHomeData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:@"http://www.pi-brand.cn/index.php/home/api/index" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *data = responseObject[@"data"];
        self.homeDatas = [HMHomeData mj_objectArrayWithKeyValuesArray:data[@"res"]];
        self.homeDatas = [self paixu:self.homeDatas];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}



-(NSArray *) paixu:(NSArray *) shuzu{
    NSMutableArray *result = [NSMutableArray arrayWithArray:shuzu];
    for (int i = 0; i < shuzu.count; i++) {
        HMHomeData *tempHMLeft = shuzu[i];
        for (int j = i; j < shuzu.count - i; j++) {
            HMHomeData *tempHMRight = shuzu[j];
            if (tempHMLeft.module > tempHMRight.module) {
                HMHomeData *temp = tempHMLeft;
                result[i] = result[j];
                result[j] = temp;
            }
        }
    }
    
    return result;
}

/** 导航栏图片 */
- (void)setupNavTitleImage{
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    UIImageView *titleImage = [[UIImageView alloc]init];
    titleImage.image = [UIImage imageNamed:@"index_02"];
    titleImage.frame = CGRectMake(0, 0, screenW * 0.25, 20);
    titleImage.sd_layout.centerXEqualToView(self.view);
    
    UIView *titleViewImage = [[UIView alloc]init];
    [titleViewImage addSubview:titleImage];
    titleViewImage.sd_layout.widthIs(screenW * 0.25)
    .heightIs(20)
    .centerXEqualToView(self.view);
    
    self.navigationItem.titleView = titleViewImage;
    
    //导航栏左右图标
    UIButton *leftView = [[UIButton alloc]init];
    [leftView setImage:[UIImage imageNamed:@"nav_01"] forState:UIControlStateNormal];
    leftView.sd_layout.widthIs(30).heightIs(18);
    [leftView addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightView = [[UIButton alloc]init];
    [rightView setImage:[UIImage imageNamed:@"product_02 (2)"] forState:UIControlStateNormal];
    rightView.sd_layout.widthIs(28).heightIs(28);
    [rightView addTarget:self action:@selector(rightViewClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightView];
}

/** 背景图片 */
- (void)setupBgd{
    UIImageView *bgd = [[UIImageView alloc]init];
    bgd.image = [UIImage imageNamed:@"index_01"];
    self.bgd = bgd;
    self.bgd.sd_layout.topSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0);
    self.tableView.backgroundView = bgd;
}

- (void)leftViewClick{
    NSLog(@"leftViewClick");
}

- (void)rightViewClick{
    NSLog(@"rightViewClick");
    HMSearchViewController *search = [[HMSearchViewController alloc] init];
    search.view.backgroundColor = [UIColor whiteColor];
    [self presentViewController:search animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.homeDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"homecell";
    HMHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HMHomeCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.data = self.homeDatas[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 430;
}

-(void)companyClick{
    HMCompanyViewController *company = [[HMCompanyViewController alloc]init];
    self.company = company;
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"product_24"]];
    imageView.frame = CGRectMake(0, 0, 182, 23.4);
    
    UIView *titleView = [[UIView alloc]init];
    [titleView addSubview:imageView];
    titleView.frame = CGRectMake(0, 0, 182, 23.4);
    
    self.company.navigationItem.titleView = titleView;
    
    [self.navigationController pushViewController:company animated:YES];
    [self.product.view removeFromSuperview];
    [self.recruitment.view removeFromSuperview];
}

-(void)productClick{
    self.secondView = [[XLNetEaseStudyDetailVC alloc]init];
    [self.navigationController pushViewController:self.secondView animated:YES];
//    HMProductController *product = [[HMProductController alloc]init];
//    self.product = product;
//    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"product_03"]];
    imageView.frame = CGRectMake(0, 0, 182, 23.4);
    
    UIView *titleView = [[UIView alloc]init];
    [titleView addSubview:imageView];
    titleView.frame = CGRectMake(0, 0, 182, 23.4);
    self.secondView.navigationItem.titleView = titleView;
//    self.product.navigationItem.titleView = titleView;
//    [self.navigationController pushViewController:product animated:YES];
    [self.company.view removeFromSuperview];
    [self.recruitment.view removeFromSuperview];
}
-(void)recruitmentClick{
    HMRecruitmentViewController *recruitment = [[HMRecruitmentViewController alloc]init];
    self.recruitment = recruitment;
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"recruit_02"]];
    imageView.frame = CGRectMake(0, 0, 182, 23.4);
    
    UIView *titleView = [[UIView alloc]init];
    [titleView addSubview:imageView];
    titleView.frame = CGRectMake(0, 0, 182, 23.4);
    
    self.recruitment.navigationItem.titleView = titleView;
    
    [self.navigationController pushViewController:recruitment animated:YES];
    [self.company.view removeFromSuperview];
    [self.product.view removeFromSuperview];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [self companyClick];
    }else if(indexPath.row == 1){
        [self productClick];
    }else if(indexPath.row == 2){
        [self recruitmentClick];
    }
}


@end
