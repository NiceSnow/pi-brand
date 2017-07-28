//
//  CompanyViewController.m
//  HARMAY_PI_BRAND
//
//  Created by shengtian on 2017/7/27.
//  Copyright © 2017年 Madodg. All rights reserved.
//

#import "CompanyViewController.h"
#import "companyHeaderModel.h"
#import "companyContentModel.h"

@interface CompanyViewController ()
@property (nonatomic, strong) NSMutableArray* dataArray;
@property (nonatomic, strong) UIImageView* backImageView;
@property (nonatomic, strong) companyHeaderModel* headerModel;
@property (nonatomic, strong) companyContentModel* contentModel;
@end

@implementation CompanyViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton* leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    [leftBtn setImage:[UIImage imageNamed:@"icon_nav"] forState:normal];
    [leftBtn addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    UIButton* rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    [rightBtn setImage:[UIImage imageNamed:@"icon_product"] forState:normal];
    [rightBtn addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    _backImageView = [UIImageView new];
    [self.view addSubview:_backImageView];
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.offset(0);
    }];
    [self getdata];
    // Do any additional setup after loading the view from its nib.
}

-(void)getdata{
    [[HTTPRequest instance]PostRequestWithURL:@"http://www.pi-brand.cn/index.php/home/api/company" Parameter:nil succeed:^(NSURLSessionDataTask *task, id responseObject) {
        BOOL succeed = [[responseObject objectForKey:@"status"]boolValue];
        if (succeed) {
            NSDictionary* data = [responseObject objectForKey:@"data"];
            NSString* urlString = [[data objectForKey:@"back_img"] objectForKey:@"bg_img"];
            [_backImageView sd_setImageWithURL:[urlString safeUrlString]];
            
            self.headerModel = [companyHeaderModel mj_objectWithKeyValues:[data objectForKey:@"head"]];
            [companyContentModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
                return @{@"ID" : @"id"};
            }];
            self.contentModel = [companyContentModel mj_objectWithKeyValues:[data objectForKey:@"res"]];
            
            self.dataArray = (NSMutableArray*)[companyContentModel mj_objectArrayWithKeyValuesArray:[data objectForKey:@"res"]];
//            if (self.dataArray.count) {
//                [self.tableView reloadData];
//            }
        }
    } failed:^(NSURLSessionDataTask *task, NSError *error) {
        
    } netWork:^(BOOL netWork) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
