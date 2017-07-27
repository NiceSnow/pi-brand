//
//  MainViewController.m
//  HARMAY_PI_BRAND
//
//  Created by Madodg on 2017/7/25.
//  Copyright © 2017年 Madodg. All rights reserved.
//

#import "MainViewController.h"
#import "MainTableViewCell.h"
#import "SearchViewController.h"

@interface MainViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIView* titleView;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UIView* headerView;
@end

@implementation MainViewController


-(void)setTitString:(NSString *)titString{
    DebugLog(@"%@",titString);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton* leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 45, 45)];
    [leftBtn setImage:[UIImage imageNamed:@"icon_nav"] forState:normal];
    [leftBtn addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    UIButton* rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 45, 45)];
    [rightBtn setImage:[UIImage imageNamed:@"icon_product"] forState:normal];
    [rightBtn addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    self.navigationItem.titleView = self.titleView;
    
    UIImageView* imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_nav"]];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.offset(0);
    }];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(64);
        make.bottom.offset(0);
        make.left.offset(25);
        make.right.offset(-25);
    }];
    [self getdata];
    // Do any additional setup after loading the view from its nib.
}

-(void)getdata{
    [[HTTPRequest instance]PostRequestWithURL:@"http://www.pi-brand.cn/index.php/home/api/index" Parameter:nil succeed:^(NSURLSessionDataTask *task, id responseObject) {
        
    } failed:^(NSURLSessionDataTask *task, NSError *error) {
        
    } netWork:^(BOOL netWork) {
        
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == 3) {
//        return screenWidth/5;
//    }
//    return UITableViewAutomaticDimension;
//}

//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 25;
//}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCell* cell = [MainTableViewCell createCellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
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


-(void)search:(UIButton*)btn{
    [self.navigationController pushViewController:[[SearchViewController alloc]init] animated:NO];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;{
    
}

-(UIView *)titleView{
    if (!_titleView) {
        _titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 127, 16)];
        UIImageView* imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"main_logo"]];
        [_titleView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_titleView);
            make.height.equalTo(@16);
            make.width.equalTo(@127);
        }];
        
        _titleView.alpha = 0;
    }
    return _titleView;
}

-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, screenHeight/3)];
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
