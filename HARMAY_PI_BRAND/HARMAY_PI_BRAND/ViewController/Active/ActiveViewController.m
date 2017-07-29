//
//  ActiveViewController.m
//  HARMAY_PI_BRAND
//
//  Created by Madodg on 2017/7/29.
//  Copyright © 2017年 Madodg. All rights reserved.
//

#import "ActiveViewController.h"
#import "companyHeaderModel.h"
#import "companyContentModel.h"

#import "CompanyHeaderTableViewCell.h"
#import "companyContentTableViewCell.h"

@interface ActiveViewController ()<UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate>
@property (nonatomic, strong) companyHeaderModel* headModle;
@property(nonatomic,strong)   companyContentModel* contentModel;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UIImageView* backImageView;
@property(nonatomic,strong)   UIWebView* webView;
@property (nonatomic, strong) UIView* footerView;
@property (nonatomic, strong) UIView* headerView;

@end

@implementation ActiveViewController

-(void)search{
}

-(void)setID:(NSString *)ID{
    _ID = ID;
    [[HTTPRequest instance]PostRequestWithURL:@"http://www.pi-brand.cn/index.php/home/api/activity_detail" Parameter:@{@"id":ID} succeed:^(NSURLSessionDataTask *task, id responseObject) {
        BOOL succeed = [[responseObject objectForKey:@"status"]boolValue];
        if (succeed) {
            NSDictionary* data = [responseObject objectForKey:@"data"];
            NSString* urlString = [[data objectForKey:@"back_img"] objectForKey:@"bg_img"];
            [_backImageView sd_setImageWithURL:[urlString safeUrlString]];
            _headModle = [companyHeaderModel mj_objectWithKeyValues:[data objectForKey:@"head"]];
            [companyContentModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
                return @{@"ID" : @"id",
                         @"Description":@"description"
                         };
            }];
            _contentModel = [companyContentModel mj_objectWithKeyValues:[data objectForKey:@"res"]];
            [self.tableView reloadData];
            [self.webView loadHTMLString:_contentModel.Description baseURL:nil];
            
        }
    } failed:^(NSURLSessionDataTask *task, NSError *error) {
        
    } netWork:^(BOOL netWork) {
        
    }];
}

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    UIButton* leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    [leftBtn setImage:[UIImage imageNamed:@"icon_nav"] forState:normal];
    [leftBtn addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    UIButton* rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    [rightBtn setImage:[UIImage imageNamed:@"icon_product"] forState:normal];
    [rightBtn addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    _backImageView = [UIImageView new];
    [self.view addSubview:_backImageView];
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.offset(0);
    }];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.offset(64);
        make.bottom.offset(0);
        make.centerX.equalTo(self.view);
    }];
    // Do any additional setup after loading the view from its nib.
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_headModle.icon.length>0&&_headModle.title.length>0&&_headModle.hid>0&&_headModle.image.length>0) {
        return 2;
    }
    return 1;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView* view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    UIImageView* imageview = [UIImageView new];
    UIView* witView = [UIView new];
    witView.backgroundColor = [UIColor whiteColor];
    [view addSubview:witView];
    [witView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.offset(10);
        make.right.offset(-10);
    }];
    [imageview sd_setImageWithURL:[_headModle.icon safeUrlString] placeholderImage:nil];
    [witView addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(15);
        make.left.offset(20);
        make.width.mas_equalTo(screenWidth*320/750);
        make.height.mas_equalTo((screenWidth*320/750)*40/320);
    }];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_headModle.icon.length>0&&_headModle.title.length>0&&_headModle.hid>0&&_headModle.image.length>0) {
        if (indexPath.row == 0) {
            CompanyHeaderTableViewCell* cell = [CompanyHeaderTableViewCell createCellWithTableView:tableView];
            [cell addDataWith:_headModle];
            cell.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }
    companyContentTableViewCell* cell = [companyContentTableViewCell createCellWithTableView:tableView];
    [cell ActiveaddDataWith:self.contentModel];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:CGRectMake(10, 0, screenWidth-20, 1)];
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.delegate = self;
        _webView.scrollView.scrollEnabled = NO;
        _webView.scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _webView;
}

-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [UIView new];
        _footerView.backgroundColor = [UIColor clearColor];
        [_footerView addSubview:self.webView];
    }
    return _footerView;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    CGFloat documentHeight = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight"] floatValue];
    
    self.webView.frame = CGRectMake(10, -1, screenWidth - 20, documentHeight);
    self.footerView.frame = CGRectMake(0, 0, screenWidth, documentHeight+screenWidth/10);
    self.tableView.tableFooterView = self.footerView;
}

-(UITableView *)tableView{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.separatorColor = [UIColor clearColor];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 5;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.tableFooterView = [UIView new];
        _tableView.tableHeaderView = self.headerView;
    }
    return _tableView;
}

-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 210)];
        _headerView.backgroundColor = [UIColor clearColor];
    }
    return _headerView;
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
