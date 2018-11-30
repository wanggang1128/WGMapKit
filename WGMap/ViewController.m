//
//  ViewController.m
//  WGMap
//
//  Created by wanggang on 2018/11/28.
//  Copyright © 2018 bozhong. All rights reserved.
//

#define WGWidth [UIScreen mainScreen].bounds.size.width
#define WGHeight [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "GuangDong/WGGuangDongViewController.h"
#import "China/WGChinaMapViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ViewController";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    
}

#pragma mark -<UITableViewDelegate, UITableViewDataSource>
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        WGChinaMapViewController *vc = [[WGChinaMapViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 1){
        
        WGGuangDongViewController *vc = [[WGGuangDongViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else{
        
    }
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WGWidth, WGHeight) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _tableView;
}

-(NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[@"全国地图", @"广东地图"];
    }
    return _dataArray;
}

@end
