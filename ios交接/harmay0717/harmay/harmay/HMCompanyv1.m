//
//  HMCompanyv1.m
//  harmay
//
//  Created by boldseas on 2017/7/20.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMCompanyv1.h"
#import <SDAutoLayout.h>

@interface HMCompanyv1()

@property (nonatomic, weak) UIImageView *icon;
@property (nonatomic, weak) UILabel *title;
@property (nonatomic, weak) UILabel *vice_title;
@property (nonatomic, weak) UIWebView *webView;


@end

@implementation HMCompanyv1


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *icon = [[UIImageView alloc]init];
        icon.image = [UIImage imageNamed:@"dl_comp"];
        [self addSubview:icon];
        
        UILabel *title = [[UILabel alloc]init];
        title.text = @"仓储 ：所有的挑剔和坚持，从这里开始。";
        title.numberOfLines = 0;
        [self addSubview:title];
        
        UILabel *vice_title = [[UILabel alloc]init];
        vice_title.text = @"HARMAY 故事开始的地方";
        vice_title.numberOfLines = 0;
        vice_title.font = [UIFont systemFontOfSize:10];
        [self addSubview:vice_title];
        
        //webview
        UIWebView *webView = [[UIWebView alloc]init];
        [webView loadHTMLString:@"<p><img src=\"http://www.pi-brand.cn/ueditor/php/upload/image/20170714/1500003360827027.jpg\" width=\"100%\" title=\"1500003360827027.jpg\" alt=\"QQ图片20170714113458.jpg\"/></p><p>这里是HARMAY北京仓，上海店原型，可容纳10万件美妆商品。漫步其中，能够轻而易举看到自己喜爱的产品数十件甚至上百件被摆在货架上，平凡到犹如沧海一粟。每分钟，都可能有产品呗分拣员带走，成为某人的心头好。<br/><br/>\t\t\t\t\t\t这里的梦幻，只有爱美妆的人能体会到，与HARMAY有关的所有理念，严苛，挑剔，清洁，都在这里体现。所有的&nbsp;故事都从这里开启。&nbsp;</p><p><br/></p>" baseURL:nil];
        [self addSubview:webView];
        self.webView = webView;
        
        icon.sd_layout.topSpaceToView(self, 10)
        .leftSpaceToView(self, 20)
        .widthRatioToView(self, 0.4)
        .heightIs(10);
        
        title.sd_layout.topSpaceToView(icon, 20)
        .leftSpaceToView(self, 20)
        .widthRatioToView(self, 0.8)
        .autoHeightRatio(0);
        
        vice_title.sd_layout.topSpaceToView(title, 25)
        .leftSpaceToView(self, 20)
        .widthRatioToView(self, 0.7)
        .autoHeightRatio(0);
        
        webView.sd_layout.topSpaceToView(vice_title, 10)
        .leftSpaceToView(self, 0)
        .widthRatioToView(self, 1)
        .bottomEqualToView(self);
        
//        [self setupAutoHeightWithBottomView:self.webView bottomMargin:15];
    }
    return self;
}

@end
