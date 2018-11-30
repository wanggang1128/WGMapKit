//
//  WGGuangDongViewController.m
//  WGMap
//
//  Created by wanggang on 2018/11/29.
//  Copyright © 2018 bozhong. All rights reserved.
//

#define WGWidth [UIScreen mainScreen].bounds.size.width
#define WGHeight [UIScreen mainScreen].bounds.size.height

#import "WGGuangDongViewController.h"
#import "WGMapCommonView.h"

@interface WGGuangDongViewController ()

@property (nonatomic, strong) WGMapCommonView *mapView;
@property (nonatomic, strong) UILabel *remindLab;

@end

@implementation WGGuangDongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"广东省地图";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.remindLab = [[UILabel alloc] init];
    self.remindLab.textColor = [UIColor blackColor];
    self.remindLab.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 30);
    self.remindLab.backgroundColor = [UIColor clearColor];
    self.remindLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.remindLab];
    
    self.mapView = [[WGMapCommonView alloc] init];
    CGFloat scale = WGWidth/320;
    self.mapView.transform = CGAffineTransformMakeScale(scale, scale);//宽高伸缩比例
    self.mapView.frame = CGRectMake(0, 0, WGWidth, WGWidth * 0.75);
    self.mapView.center = CGPointMake(WGWidth *0.5,WGHeight *0.5);
    
    self.mapView.pathFileName = @"guangDong.plist";
    self.mapView.infoFileName = @"guangDongInfo.plist";
    _mapView.clickEnable = YES;
    self.mapView.seletedAry = @[@"清远"];
    
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
