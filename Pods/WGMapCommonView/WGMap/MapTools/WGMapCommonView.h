//
//  WGMapCommonView.h
//  WGMap
//
//  Created by wanggang on 2018/11/30.
//  Copyright © 2018 bozhong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WGMapCommonView : UIView

/**
 背景色 默认
 */
@property(nonatomic,strong) UIColor *backColorD;

/**
 背景色 高亮
 */
@property(nonatomic,strong) UIColor *backColorH;

/**
 地图上名字 字号
 */
@property(nonatomic,strong) UIFont *nameFont;

/**
 地图上名字 颜色
 */
@property(nonatomic,strong) UIColor *nameColor;

/**
 边界线 颜色
 */
@property(nonatomic,strong) UIColor *lineColor;

/**
 画图资源文件
 */
@property (nonatomic, copy) NSString *pathFileName;

/**
 子地图在整个地图的位置,子地图的名字,序号等信息资源文件
 */
@property (nonatomic, copy) NSString *infoFileName;

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
