//
//  JoinusViewController.m
//  HARMAY_PI_BRAND
//
//  Created by shengtian on 2017/7/27.
//  Copyright © 2017年 Madodg. All rights reserved.
//

#import "JoinusViewController.h"
#import "JoinusViewCellCell.h"
#import "JoinusViewCell.h"
#import "companyHeaderModel.h"
#import "joinMainModel.h"
#import "joinSubModel.h"

@interface JoinusViewController ()<UITabBarDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) UIImageView* backImageView;

@end

@implementation JoinusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton* leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 45, 45)];
    [leftBtn setImage:[UIImage imageNamed:@"icon_nav"] forState:normal];
    [leftBtn addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    UIButton* rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 45, 45)];
    [rightBtn setImage:[UIImage imageNamed:@"icon_product"] forState:normal];
    [rightBtn addTarget:self action:@selector(search1:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    _backImageView = [UIImageView new];
    [self.view insertSubview:_backImageView atIndex:0];
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.offset(0);
    }];
    
    UIView * headerView = [UIView new];
    headerView.backgroundColor = [UIColor clearColor];
    headerView.frame = CGRectMake(0, 0, screenWidth, screenHeight/3.0);
    _tableview.tableHeaderView = headerView;
    _tableview.tableFooterView = [UIView new];
    _tableview.estimatedRowHeight = 5;
    _tableview.rowHeight = UITableViewAutomaticDimension;
    [self getdata];
}

-(void)getdata{
    [[HTTPRequest instance]PostRequestWithURL:@"http://www.pi-brand.cn/index.php/home/api/recruit" Parameter:nil succeed:^(NSURLSessionDataTask *task, id responseObject) {
        BOOL succeed = [[responseObject objectForKey:@"status"]boolValue];
        if (succeed) {
            NSDictionary* data = [responseObject objectForKey:@"data"];
            NSString* urlString = [[data objectForKey:@"back_img"] objectForKey:@"bg_img"];
            [_backImageView sd_setImageWithURL:[urlString safeUrlString]];
            [joinMainModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
                return @{@"ID" : @"id"};
            }];
            companyHeaderModel* model = [companyHeaderModel mj_objectWithKeyValues:[data objectForKey:@"head"]];
            joinMainModel* mainModel = [joinMainModel mj_objectWithKeyValues:[data objectForKey:@"main"]];
            NSArray* sub = [joinSubModel mj_objectArrayWithKeyValuesArray:[data objectForKey:@"sub"]];
            NSLog(@"123");

        }
    } failed:^(NSURLSessionDataTask *task, NSError *error) {
        
    } netWork:^(BOOL netWork) {
        
    }];
    [self getmessage];
}

-(void)getmessage{
//    招聘职位信息  下面加载webview
    [[HTTPRequest instance]PostRequestWithURL:@"http://www.pi-brand.cn/index.php/home/api/recruit_type" Parameter:nil succeed:^(NSURLSessionDataTask *task, id responseObject) {
        BOOL succeed = [[responseObject objectForKey:@"status"]boolValue];
        if (succeed) {
            NSDictionary* data = [responseObject objectForKey:@"data"];
            NSString* title = [data objectForKey:@"title"];
            NSString* webstring = [data objectForKey:@"content"];
            
        }
    } failed:^(NSURLSessionDataTask *task, NSError *error) {
        
    } netWork:^(BOOL netWork) {
        
    }];
}

- (void)search1:(UIButton *)btn
{
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        JoinusViewCellCell * cell = [JoinusViewCellCell createCellWithTableView:tableView];
        return cell;
    }else{
        JoinusViewCell * cell = [JoinusViewCell createCellWithTableView:tableView];
        return cell;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
@end
