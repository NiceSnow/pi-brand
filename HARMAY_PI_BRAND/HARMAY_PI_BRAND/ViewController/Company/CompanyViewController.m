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
#import "XLScrollView.h"
#import "XLSegmentBar.h"
#import "XLConst.h"
#import "UIViewController+XLScroll.h"

#import "SubCompanyViewController1.h"
#import "SubCompanyViewController2.h"

@interface CompanyViewController ()<UIScrollViewDelegate,XLSegmentBarDelegate,XLStudyChildVCDelegate>
{
    NSInteger _currentIndex;
}
@property (nonatomic,strong) XLScrollView *contentView;
@property (nonatomic,weak) UIImageView *header;
@property (nonatomic,weak) XLSegmentBar *bar;
@property (nonatomic, strong)UIPageControl* pageControl;

@property (nonatomic, strong) NSMutableArray* dataArray;
@property (nonatomic, strong) UIImageView* backImageView;
@property (nonatomic, strong) companyHeaderModel* headerModel;
@property (nonatomic, strong) companyContentModel* contentModel;
@end

@implementation CompanyViewController
-(void)setLeftCount:(NSInteger)leftCount{
    UIButton* leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    [leftBtn setImage:[UIImage imageNamed:@"icon_nav"] forState:normal];
    [leftBtn addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchUpInside];
    UIButton* leftBtn2 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    leftBtn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [leftBtn2 setImage:[UIImage imageNamed:@"back"] forState:normal];
    [leftBtn2 addTarget:self action:@selector(leftPress) forControlEvents:UIControlEventTouchUpInside];
    
    if (leftCount == 1) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    }else{
        self.navigationItem.leftBarButtonItems = @[[[UIBarButtonItem alloc]initWithCustomView:leftBtn],[[UIBarButtonItem alloc]initWithCustomView:leftBtn2]];
    }
}

-(void)leftPress{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)search{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton* rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    [rightBtn setImage:[UIImage imageNamed:@"icon_product"] forState:normal];
    [rightBtn addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    [self getdata];

    self.automaticallyAdjustsScrollViewInsets = NO;
    [self addChilds];
    
    self.contentView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.bounds.size.width, 0);
    
    self.header.frame = CGRectMake(0, navBarH, self.view.bounds.size.width, headerImgH);
    
    self.bar.frame = CGRectMake(0, navBarH + headerImgH, self.view.bounds.size.width, barH);
    
    // 选中第0个VC
    [self selectedIndex:0];
    
    _backImageView = [UIImageView new];
    [self.view insertSubview:_backImageView atIndex:0];
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.offset(0);
    }];


    
}

#pragma mark - private
/** 添加子控制器*/
- (void)addChilds {
    [self addChildWithVC:[SubCompanyViewController1 new] title:@"第一"];
    [self addChildWithVC:[SubCompanyViewController2 new] title:@"第二"];
}
- (void)addChildWithVC:(UITableViewController *)vc title:(NSString *)title {
    vc.title = title;
    [self addChildViewController:vc];
}
/** 选中索引对应VC*/
- (void)selectedIndex:(NSInteger)index {
    UIViewController *VC = self.childViewControllers[index];
    if (!VC.view.superview) {
        VC.view.frame = CGRectMake(index * self.contentView.frame.size.width, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
        [self.contentView addSubview:VC.view];
    }
    [self.contentView setContentOffset:CGPointMake(index * self.contentView.frame.size.width, 0) animated:NO];
    _currentIndex = index;
}

#pragma mark - UIScrollViewDelegate
// 滚动完成调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger i = offsetX / scrollView.frame.size.width;
    [self selectedIndex:i];
    self.bar.changeIndex = i;
    _pageControl.currentPage = i;
}
#pragma mark - XLSegmentBarDelegate
- (void)segmentBar:(XLSegmentBar *)segmentBar tapIndex:(NSInteger)index {
    [self selectedIndex:index];
}
#pragma mark - XLStudyChildVCDelegate
- (void)childVc:(UIViewController *)childVc scrollViewDidScroll:(UIScrollView *)scroll {
    CGFloat offsetY = scroll.contentOffset.y;
    UIViewController *currentVC = self.childViewControllers[_currentIndex];
    if ([currentVC isEqual:childVc]) {
        CGRect headerFrame = self.header.frame;
        headerFrame.origin.y = navBarH - offsetY;
        // header上滑到导航条位置时，固定
        if (headerFrame.origin.y <= -(headerImgH - navBarH)) {
            headerFrame.origin.y = -(headerImgH - navBarH);
        }
        // header向下滑动时，固定
        else if (headerFrame.origin.y >= navBarH) {
            headerFrame.origin.y = navBarH;
        }
        self.header.frame = headerFrame;
        
        CGRect barFrame = self.bar.frame;
        barFrame.origin.y = CGRectGetMaxY(self.header.frame);
        self.bar.frame = barFrame;
        
        // 改变其他VC中的scroll偏移
        [self.childViewControllers enumerateObjectsUsingBlock:^(UIViewController *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (![obj isMemberOfClass:[currentVC class]]) {
                [obj setCurrentScrollContentOffsetY:offsetY];
            }
        }];
    }
    
}
#pragma mark - lazy
- (XLScrollView *)contentView {
    if (!_contentView) {
        _contentView = [[XLScrollView alloc] initWithFrame:CGRectMake(0, navBarH, self.view.bounds.size.width, self.view.bounds.size.height - navBarH)];
        _contentView.delegate = self;
        _contentView.showsHorizontalScrollIndicator = NO;
        _contentView.pagingEnabled = YES;
        [self.view addSubview:_contentView];
    }
    return _contentView;
}
- (UIImageView *)header {
    if (!_header) {
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"test"]];
        image.contentMode = UIViewContentModeScaleAspectFill;
        image.userInteractionEnabled = YES;
        [self.view addSubview:image];
        _header = image;
        
        _pageControl = [UIPageControl new];
        _pageControl.numberOfPages = self.childViewControllers.count;
        _pageControl.currentPage = 0;
        //        [_pageControl addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];
        [_pageControl setValue:[UIImage imageNamed:@"11_07SEL"] forKeyPath:@"_currentPageImage"];
        [_pageControl setValue:[UIImage imageNamed:@"11_07"] forKeyPath:@"_pageImage"];
        [_header addSubview:_pageControl];
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_header);
            make.bottom.mas_equalTo(-5);
        }];
        
    }
    return _header;
}

- (XLSegmentBar *)bar {
    if (!_bar) {
        NSArray *titles = [self.childViewControllers valueForKey:@"title"];
        XLSegmentBar *bar = [[XLSegmentBar alloc]initWithSegmentModels:titles];
        bar.delegate = self;
        bar.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:bar];
        _bar = bar;
    }
    return _bar;
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
