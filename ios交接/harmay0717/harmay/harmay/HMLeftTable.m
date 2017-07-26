//
//  HMLeftTable.m
//  harmay
//
//  Created by boldseas on 2017/7/20.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "HMLeftTable.h"
#import "HMHomeData.h"
#import <MJExtension.h>
#import "HMProductLeftCell.h"

#import <AFNetworking.h>

@interface HMLeftTable()
@property (nonatomic, strong) NSArray *homeDatas;
@end

@implementation HMLeftTable

-(void) loadDate{
    // 使用afn查询数据
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:@"http://www.pi-brand.cn/index.php/home/api/index" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        
        NSDictionary *data = responseObject[@"data"];
        self.homeDatas = [HMHomeData mj_objectArrayWithKeyValuesArray:data[@"res"]];
//        self.homeDatas = [self paixu:self.homeDatas];
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
    HMProductLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HMProductLeftCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
@end
