# WGMapKit
## 数据统计时，有时需要在对应地图上显示相关数据，例如足迹，数量等等，这里提供画中国地图（包括各个省），和各省地图（包括各个市）的工具

### 效果

![](https://github.com/wanggang1128/WGMapKit/raw/master/WGMap/demo.gif)

### 集成方法

##### 1、直接把文件（WGMapCommonView.h和.m）拖入工程；
##### 2、通过cocoapod

###### * 在项目还没有Podfile文件的话，先执行 pod init
###### * 然后添加代码 pod 'WGMapCommonView‘
###### * 执行 pod install(报错的话，可以先执行 pod repo update)

### 使用

###### * 引入头文件 #import "WGMapCommonView.h"
###### * 指定两个资源文件,一个是画地图的塞尔曲线数组、一个是各个子区域名字，rect，序号等信息
```
 self.mapView.pathFileName = @"guangDong.plist";
 self.mapView.infoFileName = @"guangDongInfo.plist";
```
###### * 视图可通过调整伸缩比例来调试显示不全问题
```
CGFloat scale = WGWidth/320;
self.mapView.transform = CGAffineTransformMakeScale(scale, scale);//宽高伸缩比例
self.mapView.frame = CGRectMake(0, 0, WGWidth, WGWidth * 0.75);
self.mapView.center = CGPointMake(WGWidth *0.5,WGHeight *0.5);
```
###### * 支持设置默认选中、是否可点击，点击回调、设置颜色、字体、边界线颜色等。

##### 备注：目前我只画了全国地图和广东省的地图，其资源文件在项目中已经提供，其他省的地图的资源文件可以自己造一下，然后引入这个WGMapCommonView即可。
