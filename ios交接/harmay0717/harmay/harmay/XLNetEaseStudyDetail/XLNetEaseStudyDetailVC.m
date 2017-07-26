//
//  XLNetEaseStudyDetailVC.m
//  XLNetEaseStudy
//
//  Created by xl on 17/7/5.
//  Copyright © 2017年 xl. All rights reserved.
//

#import "XLNetEaseStudyDetailVC.h"
#import "XLScrollView.h"
#import "XLSegmentBar.h"
#import "XLConst.h"
#import "XLStudyChildIntroductionVC.h"
#import "XLStudyChildCatalogueVC.h"
#import "XLStudyChildCommentVC.h"
#import "UIViewController+XLScroll.h"
#import "HMProductLeft.h"
#import "HMPageControl.h"
#import <SDAutoLayout.h>
#import "HMLeftTableView.h"


@interface XLNetEaseStudyDetailVC ()<UIScrollViewDelegate,XLSegmentBarDelegate,XLStudyChildVCDelegate>
{
    NSInteger _currentIndex;
}
@property (nonatomic,strong) XLScrollView *contentView;
@property (nonatomic,weak) UIImageView *header;
@property (nonatomic,weak) XLSegmentBar *bar;

@property (nonatomic, strong) HMPageControl *pageControl;
@end

@implementation XLNetEaseStudyDetailVC

#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"product_01"]];
    
    [self addChilds];
    
    self.contentView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.bounds.size.width, 0);

    self.header.frame = CGRectMake(0, navBarH, self.view.bounds.size.width, headerImgH);
    
//    self.bar.frame = CGRectMake(0, navBarH + headerImgH, self.view.bounds.size.width, barH);
    
    // 选中第0个VC
    [self selectedIndex:0];
}

#pragma mark - private
/** 添加子控制器*/
- (void)addChilds {
//    [self addChildWithVC:[XLStudyChildIntroductionVC new] title:@"第一"];
    [self addChildWithVC:[[HMLeftTableView alloc]init] title:@""];
    [self addChildWithVC:[XLStudyChildCatalogueVC new] title:@"第二"];
    [self addChildWithVC:[XLStudyChildCommentVC new] title:@"第三"];
    

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
        [self.view addSubview:image];
        
        self.pageControl = [[HMPageControl alloc]init];
        [image addSubview:self.pageControl];
        self.pageControl.numberOfPages = 3;
        [self.pageControl setValue:[UIImage imageNamed:@"bar_01"] forKeyPath:@"_pageImage"];
        [self.pageControl setValue:[UIImage imageNamed:@"bar"] forKeyPath:@"_currentPageImage"];
        
        self.pageControl.sd_layout.topSpaceToView(image, 84)
        .centerXEqualToView(image)
        .widthIs(80)
        .heightIs(20);
        
        _header = image;
    }
    return _header;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    double page = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.pageControl.currentPage = (int)(page + 0.5);
}

//- (XLSegmentBar *)bar {
//    if (!_bar) {
//        NSArray *titles = [self.childViewControllers valueForKey:@"title"];
//        XLSegmentBar *bar = [[XLSegmentBar alloc]initWithSegmentModels:titles];
//        bar.delegate = self;
//        bar.backgroundColor = [UIColor redColor];
//        [self.view addSubview:bar];
//        _bar = bar;
//    }
//    return _bar;
//}

@end
