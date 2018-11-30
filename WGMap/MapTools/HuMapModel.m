//
//  HuMapModel.m
//  HuDataReportPlatform
//
//  Created by wanggang on 2018/11/26.
//  Copyright © 2018 bozhong. All rights reserved.
//

#import "HuMapModel.h"

@implementation HuMapModel

- (UIColor *)backColorD{
    return _backColorD != nil ? _backColorD:[UIColor colorWithRed:95.0/255 green:169.0/255.0 blue:232.0/255.0 alpha:1];
}

- (UIColor *)backColorH{
    return _backColorH != nil ? _backColorH:[UIColor colorWithRed:60.0/255 green:138.0/255.0 blue:214.0/255.0 alpha:1];
}

- (UIColor *)nameColor{
    return _nameColor != nil ? _nameColor:[UIColor whiteColor];
}
- (UIFont *)nameFont{
    return _nameFont ? _nameFont:[UIFont systemFontOfSize:13];
}

- (UIColor *)lineColor{
    return _lineColor != nil ? _lineColor:[UIColor lightGrayColor];
}

@end
