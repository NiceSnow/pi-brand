//
//  HMProductMid.m
//  harmay
//
//  Created by boldseas on 2017/7/21.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMProductMid.h"
#import <AFNetworking.h>
#import "HMHomeData.h"
#import <MJExtension.h>
#import "HMProductMidCell.h"
#import <SDAutoLayout.h>
#import "HMProductv2.h"
#import "HMProductMidCellModel.h"

@interface HMProductMid()

@property (nonatomic, strong) HMProductv2 *header;

@property (nonatomic, strong) NSArray *midArray;

@end

@implementation HMProductMid

- (instancetype)init{
    if (self = [super init]) {
        self.showsVerticalScrollIndicator = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        self.header = [[HMProductv2 alloc]init];
        self.header.frame = CGRectMake(0, 0, 100, 150);
        self.backgroundColor = [UIColor clearColor];
        self.tableHeaderView = self.header;
        
        
    }
    return self;
}

- (void)loadMiddata{
    // 使用afn查询数据
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:@"http://www.pi-brand.cn/index.php/home/api/store_list" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *data = responseObject[@"data"];
//        NSLog(@"%@", responseObject);
        self.midArray = [HMProductMidCellModel mj_objectArrayWithKeyValuesArray:data[@"res"]];
        [self reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.midArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"productLeftcell";
    HMProductMidCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HMProductMidCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.midData = self.midArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self cellHeightForIndexPath:indexPath cellContentViewWidth:self.frame.size.width tableView:tableView];
}

@end
