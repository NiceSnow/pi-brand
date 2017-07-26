//
//  HMProductRight.m
//  harmay
//
//  Created by boldseas on 2017/7/20.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMProductRight.h"
#import <AFNetworking.h>
#import "HMHomeData.h"
#import <MJExtension.h>
#import "HMProductLeftCell.h"
#import <SDAutoLayout.h>
#import "HMProductRightCell.h"
#import "HMProductv3.h"
#import "HMProductRightCellModel.h"

@interface HMProductRight()

@property (nonatomic, strong) NSArray *rightArray;

@end

@implementation HMProductRight

- (instancetype)init{
    if (self = [super init]) {
        self.showsVerticalScrollIndicator = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        HMProductv3 *header = [[HMProductv3 alloc]init];
        header.frame = CGRectMake(0, 0, 100, 130);
        self.tableHeaderView = header;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)loadRightdata{
    // 使用afn查询数据
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:@"http://www.pi-brand.cn/index.php/home/api/product_line" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *data = responseObject[@"data"];
        //        NSLog(@"%@", responseObject);
        self.rightArray = [HMProductRightCellModel mj_objectArrayWithKeyValuesArray:data[@"res"]];
        [self reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"productLeftcell";
    HMProductRightCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HMProductRightCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.rightdata = self.rightArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self cellHeightForIndexPath:indexPath cellContentViewWidth:self.frame.size.width tableView:tableView];
}


@end
