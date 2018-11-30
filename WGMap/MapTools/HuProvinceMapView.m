//
//  HuProvinceMapView.m
//  HuDataReportPlatform
//
//  Created by wanggang on 2018/11/26.
//  Copyright © 2018 bozhong. All rights reserved.
//

#import "HuProvinceMapView.h"

@interface HuProvinceMapView()

/**地图块贝塞尔曲线数组*/
@property(nonatomic,strong) NSMutableArray <UIBezierPath *>*pathAry;
/**地图块贝塞尔曲线颜色数组*/
@property (nonatomic,strong) NSMutableArray <UIColor *>*colorAry;
/**各个区名字及位置数组*/
@property (nonatomic,strong) NSMutableArray <NSDictionary *>*textAry;
/**选中的地图块*/
@property (nonatomic,assign) NSUInteger seletedIdx;
/**序号对应的名字*/
@property(nonatomic,strong) NSDictionary *nameWithIndexDic;
/**名子对应的序号*/
@property(nonatomic,strong) NSDictionary *indexWithNameDic;
//执行一次
@property(nonatomic,assign) BOOL isRuned;

@end

@implementation HuProvinceMapView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor grayColor];
        [self clickEnableMethod];
    }
    return self;
}

#pragma mark -画图
- (void)drawRect:(CGRect)rect{
    // 边线颜色
    UIColor* strokeColor = self.model.lineColor;
    
    [self.pathAry enumerateObjectsUsingBlock:^(UIBezierPath * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        obj.miterLimit = 4;
        obj.lineJoinStyle = kCGLineJoinRound;
        [self.colorAry[idx] setFill];
        [obj fill];
        [strokeColor setStroke];
        obj.lineWidth = 1;
        [obj stroke];
    }];
    
    // 绘制文字
    __weak typeof(self) weakSelf = self;
    [self.textAry enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *name = obj[@"name"];
        NSValue *rectValue = obj[@"rect"];
        [weakSelf drawText:name rect:rectValue];
    }];
}

- (void)drawText:(NSString *)name rect:(NSValue *)rect{
    CGRect textRect = [rect CGRectValue];
    {
        NSString *textContent = name;
        CGContextRef context = UIGraphicsGetCurrentContext();
        NSMutableParagraphStyle *textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        textStyle.alignment = NSTextAlignmentCenter;
        // 省份名字: 字号 颜色 段落样式
        NSDictionary *dic = @{
                              NSFontAttributeName: [UIFont systemFontOfSize: 13]
                              , NSForegroundColorAttributeName: self.model.nameColor, NSParagraphStyleAttributeName: textStyle
                              };
        
        CGFloat textH = [textContent boundingRectWithSize: CGSizeMake(textRect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: dic context: nil].size.height;
        
        CGContextSaveGState(context);
        CGContextClipToRect(context, textRect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(textRect), CGRectGetMinY(textRect) + (CGRectGetHeight(textRect) - textH) / 2, CGRectGetWidth(textRect), textH) withAttributes: dic];
        CGContextRestoreGState(context);
    }
}

#pragma mark -set方法
- (void)clickEnableMethod{
    
    if (_clickEnable == NO) {
        if (self.gestureRecognizers.count >0) self.gestureRecognizers = @[];
        
    }else{
        if (self.gestureRecognizers.count >0){
            
        }else{
            UITapGestureRecognizer *click = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
            [self addGestureRecognizer:click];
        }
    }
}

-(void)setClickEnable:(BOOL)clickEnable{
    _clickEnable = clickEnable;
    [self clickEnableMethod];
}

-(void)setSeletedAry:(NSArray<NSString *> *)seletedAry{
    _seletedAry = seletedAry;
    
    [self selectAction:self.seletedAry];
}



#pragma mark - 手势点击方法
- (void)click:(UITapGestureRecognizer *)sender{
    CGPoint point = [sender locationInView:sender.view];
    [self tap:point];
    
}

// 绘制选中区域颜色
- (void)tap:(CGPoint)point{
    //遍历所有市地图块.判断点击的是那一块
    for (NSInteger i = 0; i <self.pathAry.count; i++) {
        UIBezierPath *path = self.pathAry[i];
        BOOL isInPath = [path containsPoint:point];
        if (isInPath) {
            //清除默认选中的颜色,只执行一次即可
            if (!_isRuned) {
                [self cleanSelectColor];
                _isRuned = YES;
            }
            //清除之前选中的颜色
            self.colorAry[_seletedIdx]  = self.model.backColorD;
            _seletedIdx = i;
            //fill当前选中的颜色
            self.colorAry[_seletedIdx]  = self.model.backColorH;
            [self setNeedsDisplay];
            
            NSString *province = [self.nameWithIndexDic objectForKey:[NSString stringWithFormat:@"%zd",(_seletedIdx+1)]];
            !self.clickActionBlock?:self.clickActionBlock(province);
        }
    }
}

- (void)cleanSelectColor{
    if (self.seletedAry.count == 0) {
        return;
    }
    for (int i = 0; i < self.seletedAry.count; i++) {
        NSString *name = [self.seletedAry objectAtIndex:i];
        if (name.length <= 0) return;
        NSString *value = [self.indexWithNameDic objectForKey:name];
        if ((value.integerValue - 1) < 0) continue;
        NSInteger index = value.integerValue - 1;
        self.colorAry[index] = self.model.backColorD;
    }
}

- (void)selectAction:(NSArray <NSString *>*)seletedAry{
    
    if (seletedAry.count <= 0) return;
    
    for (int i = 0; i < seletedAry.count; i++) {
        NSString *name = [self.seletedAry objectAtIndex:i];
        if (name.length <= 0) return;
        NSString *value = [self.indexWithNameDic objectForKey:name];
        if ((value.integerValue - 1) < 0) continue;
        NSInteger index = value.integerValue - 1;
        self.colorAry[index] = self.model.backColorH;
    }
    [self setNeedsDisplay];
}

#pragma mark -懒加载
// 序号从1开始
- (NSDictionary *)nameWithIndexDic{

    if (!_nameWithIndexDic) {
        
        if (!self.textAry || self.textAry.count == 0) {
            _nameWithIndexDic = @{};
        }else{
            NSMutableDictionary *nameDic = [[NSMutableDictionary alloc] init];
            for (NSDictionary *dic in self.textAry) {
                NSString *value = dic[@"name"];
                NSString *key = [NSString stringWithFormat:@"%@", dic[@"index"]];
                [nameDic setObject:value forKey:key];
            }
            _nameWithIndexDic = nameDic;
        }
    }
    return _nameWithIndexDic;
}

- (NSDictionary *)indexWithNameDic{

    if (!_indexWithNameDic) {
        
        if (!self.textAry || self.textAry.count == 0) {
            _indexWithNameDic = @{};
        }else{
            NSMutableDictionary *nameDic = [[NSMutableDictionary alloc] init];
            for (NSDictionary *dic in self.textAry) {
                NSString *key = dic[@"name"];
                NSString *value = [NSString stringWithFormat:@"%@", dic[@"index"]];
                [nameDic setObject:value forKey:key];
            }
            _indexWithNameDic = nameDic;
        }
    }
    return _indexWithNameDic;
}

- (HuMapModel *)model{
    
    if (!_model) {
        _model = [[HuMapModel alloc] init];
    }
    return _model;
}

-(NSMutableArray<UIBezierPath *> *)pathAry{
    if (_pathAry == nil) {
        NSString *sourcePath = [[NSBundle mainBundle] pathForResource:self.pathFileName ofType:nil];
        _pathAry = [NSKeyedUnarchiver unarchiveObjectWithFile:sourcePath];
    }
    return _pathAry;
}

- (NSMutableArray *)textAry{
    if (!_textAry) {
        
        NSString *sourcePath = [[NSBundle mainBundle] pathForResource:self.infoFileName ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:sourcePath];
        _textAry = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
    }
    return _textAry;
}

- (NSMutableArray *)colorAry{
    if (_colorAry == nil) {
        _colorAry = [NSMutableArray arrayWithCapacity:self.pathAry.count];
        for (int i = 0; i <self.pathAry.count; i++) {
            UIColor* fillColor = self.model.backColorD;
            [_colorAry addObject:fillColor];
        }
    }
    return _colorAry;
}

@end
