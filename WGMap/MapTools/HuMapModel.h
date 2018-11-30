//
//  HuMapModel.h
//  HuDataReportPlatform
//
//  Created by wanggang on 2018/11/26.
//  Copyright © 2018 bozhong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HuMapModel : NSObject

/**背景色 默认*/
@property(nonatomic,strong) UIColor *backColorD;

/**背景色 高亮*/
@property(nonatomic,strong) UIColor *backColorH;

/**省份名字 字号*/
@property(nonatomic,strong) UIFont *nameFont;

/**省份名字 颜色*/
@property(nonatomic,strong) UIColor *nameColor;

/**省份边界线 颜色*/
@property(nonatomic,strong) UIColor *lineColor;

@end

NS_ASSUME_NONNULL_END
