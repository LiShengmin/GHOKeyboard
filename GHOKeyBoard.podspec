Pod::Spec.new do |s|
s.name = 'GHOKeyBoard'
s.version = '0.1.0'
s.license = { :type =>"MIT", :file => "LICENSE"}
s.summary = 'OC，自定义数字键盘和中文块键盘'
s.homepage = 'https://github.com/lishengmin/GHOKeyboard'
s.authors = { 'Ghoul' => 'lishengminbj@gmail.com' }
s.source = { :git => "https://github.com/LiShengmin/GHOKeyboard.git", :tag => s.version.to_s}
s.requires_arc = true
s.platform = :ios, '8.0'
s.source_files = "GHOKeyBoard/*.{h,m}"
s.frameworks = 'UIKit', 'Foundation'
end
