//
//  HMProductLeft.m
//  harmay
//
//  Created by boldseas on 2017/7/20.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMProductLeft.h"
#import <AFNetworking.h>
#import "HMHomeData.h"
#import <MJExtension.h>
#import "HMProductLeftCell.h"
#import "HMProductV1.h"
#import <SDAutoLayout.h>
#import "HMHMProductLeftCellModel.h"
#import "HMPageControl.h"


@interface HMProductLeft() <HMProductV1Delegate>

@property (nonatomic, strong) NSArray *leftData;

@property (nonatomic, strong) HMProductV1 *header;

@property (nonatomic, strong) HMPageControl *pageControl;

@end

@implementation HMProductLeft

- (instancetype)init{
    if (self = [super init]) {
        
        self.header = [[HMProductV1 alloc]init];
        self.header.frame = CGRectMake(0, 0, 100, 240);
        self.header.delegate = self;
        
        self.tableHeaderView = self.header;
        self.showsVerticalScrollIndicator = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

-(void)loadDate{
    // 使用afn查询数据
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:@"http://www.pi-brand.cn/index.php/home/api/product_city" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *data = responseObject[@"data"];
        self.leftData = [HMHMProductLeftCellModel mj_objectArrayWithKeyValuesArray:data[@"pro"]];
        [self reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.leftData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"productLeftcell";
    HMProductLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HMProductLeftCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.data = self.leftData[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self cellHeightForIndexPath:indexPath cellContentViewWidth:self.frame.size.width tableView:tableView];
}

- (void)leftViewDidselectRowWithTag:(NSInteger)tag{
}

@end
