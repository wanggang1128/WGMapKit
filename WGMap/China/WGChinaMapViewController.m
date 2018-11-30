//
//  WGChinaMapViewController.m
//  WGMap
//
//  Created by wanggang on 2018/11/29.
//  Copyright © 2018 bozhong. All rights reserved.
//

#define WGWidth [UIScreen mainScreen].bounds.size.width
#define WGHeight [UIScreen mainScreen].bounds.size.height

#import "WGChinaMapViewController.h"
#import "HuProvinceMapView.h"

@interface WGChinaMapViewController ()

@property (nonatomic, strong) HuProvinceMapView *mapView;
@property (nonatomic, strong) UILabel *remindLab;

@end

@implementation WGChinaMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"全国地图";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.remindLab = [[UILabel alloc] init];
    self.remindLab.textColor = [UIColor blackColor];
    self.remindLab.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 30);
    self.remindLab.backgroundColor = [UIColor clearColor];
    self.remindLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.remindLab];
    
    //地图
    self.mapView = [[HuProvinceMapView alloc] init];
    
    CGFloat scale = 0.7;
    self.mapView.transform = CGAffineTransformMakeScale(scale, scale);//宽高伸缩比例
    self.mapView.frame = CGRectMake(0, 0, WGWidth, WGWidth * 0.9);
    self.mapView.center = CGPointMake(WGWidth *0.55,WGHeight *0.5);
    
    self.mapView.pathFileName = @"ChinaMapPaths.plist";
    self.mapView.infoFileName = @"provinceInfo.plist";
    _mapView.clickEnable = YES;
    self.mapView.seletedAry = @[@"浙江"];
    
    [self.view addSubview:_mapView];
    
    __weak typeof(self) weakSelf = self;
    _mapView.clickActionBlock = ^(NSString * _Nonnull place) {
        NSLog(@"点击了地图:%@", place);
        weakSelf.remindLab.text = place;
    };
    
    if (self.mapView.seletedAry.count > 0) {
        self.remindLab.text = self.mapView.seletedAry[0];
    }
}

@end
