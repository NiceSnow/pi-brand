//
//  SubCompanyViewController1.m
//  HARMAY_PI_BRAND
//
//  Created by 刘厚宽 on 2017/7/28.
//  Copyright © 2017年 Madodg. All rights reserved.
//

#import "SubCompanyViewController1.h"
#import "UIViewController+XLScroll.h"
#import "CompanyHeaderTableViewCell.h"
#import "companyContentTableViewCell.h"

@interface SubCompanyViewController1 ()<UIWebViewDelegate>
@property(nonatomic,strong) UIWebView* webView;
@property (nonatomic, strong) UIView* footerView;
@end

@implementation SubCompanyViewController1

-(void)setHeadModel:(companyHeaderModel *)headModel{
    _headModel = headModel;
}

-(void)setContentModel:(companyContentModel *)contentModel{
    _contentModel = contentModel;
    [self.tableView reloadData];
    [self.webView loadHTMLString:_contentModel.content baseURL:nil];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    CGFloat documentHeight = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight"] floatValue];
    
    self.webView.frame = CGRectMake(10, -1, screenWidth - 20, documentHeight);
    self.footerView.frame = CGRectMake(0, 0, screenWidth, documentHeight + 10);
    self.tableView.tableFooterView = self.footerView;
}

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupScroll];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.estimatedRowHeight = 5;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.tableFooterView = [UIView new];
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001;
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
    [imageview sd_setImageWithURL:[_headModel.icon safeUrlString] placeholderImage:nil];
    [witView addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(15);
        make.left.offset(20);
        make.width.mas_equalTo(screenWidth*320/750);
        make.height.mas_equalTo((screenWidth*320/750)*40/320);
    }];
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_headModel.icon.length>0&&_headModel.title.length>0&&_headModel.hid>0&&_headModel.image.length>0) {
        return 2;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_headModel.icon.length>0&&_headModel.title.length>0&&_headModel.hid>0&&_headModel.image.length>0) {
        if (indexPath.row == 0) {
            CompanyHeaderTableViewCell* cell = [CompanyHeaderTableViewCell createCellWithTableView:tableView];
            [cell addDataWith:_headModel];
            cell.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }
    companyContentTableViewCell* cell = [companyContentTableViewCell createCellWithTableView:tableView];
    [cell addDataWith:self.contentModel];
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
@end
