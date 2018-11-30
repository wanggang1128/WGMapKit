//
//  HuProvinceMapView.h
//  HuDataReportPlatform
//
//  Created by wanggang on 2018/11/26.
//  Copyright © 2018 bozhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HuMapModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HuProvinceMapView : UIView

/**
 画图资源文件
 */
@property (nonatomic, copy) NSString *pathFileName;

/**
 子地图在整个地图的位置,子地图的名字,序号等信息资源文件
 */
@property (nonatomic, copy) NSString *infoFileName;

/**
 配置地图信息模型
 */
@property(nonatomic,strong) HuMapModel *model;

/**
 选中的模块
 */
@property(nonatomic,strong) NSArray <NSString *>*seletedAry;


/**
 点击地图功能 开启后关闭设置选中省份功能  默认 NO
 */
@property(nonatomic,assign) BOOL clickEnable;

/**
 点击省份事件 只有当 clickEnable == YES 才响应
 */
@property(nonatomic,copy) void(^clickActionBlock)(NSString *place);

@end

NS_ASSUME_NONNULL_END
