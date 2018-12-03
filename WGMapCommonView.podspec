Pod::Spec.new do |s|

  s.name         = "WGMapCommonView"
  s.version      = "1.0.1"
  s.summary      = "中国地图（包括各个省），和广东省地图（包括各个市)工具"

  s.homepage     = "https://github.com/wanggang1128/WGMapKit"
  s.license      = "MIT"
  s.author             = { "王刚" => "wxwangg@163.com" }

  s.platform     = :ios
  s.ios.deployment_target = "8.0"

  s.source       = { :git => "https://github.com/wanggang1128/WGMapKit.git", :tag => "#{s.version}" }

  s.source_files  = "WGMap/MapTools/*.{h,m}"

  s.requires_arc = true
  s.frameworks = "UIKit"

end
