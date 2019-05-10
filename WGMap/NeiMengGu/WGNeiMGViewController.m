//
//  WGNeiMGViewController.m
//  WGMap
//
//  Created by wanggang on 2019/5/10.
//  Copyright © 2019 bozhong. All rights reserved.
//

#define WGWidth [UIScreen mainScreen].bounds.size.width
#define WGHeight [UIScreen mainScreen].bounds.size.height

#import "WGNeiMGViewController.h"
#import "WGMapCommonView.h"

@interface WGNeiMGViewController ()

@property (nonatomic, strong) WGMapCommonView *mapView;
@property (nonatomic, strong) UILabel *remindLab;

@end

@implementation WGNeiMGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"内蒙古地图";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.remindLab = [[UILabel alloc] init];
    self.remindLab.textColor = [UIColor blackColor];
    self.remindLab.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 30);
    self.remindLab.backgroundColor = [UIColor clearColor];
    self.remindLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.remindLab];
    
    self.mapView = [[WGMapCommonView alloc] init];
    self.mapView.frame = CGRectMake(-220,200, WGWidth+220, WGWidth * 0.8);
    
    self.mapView.pathFileName = @"neimengguPath.plist";
    self.mapView.infoFileName = @"neimengguInfo.plist";
    _mapView.clickEnable = YES;
    self.mapView.seletedAry = @[@"呼伦贝尔"];
    
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
