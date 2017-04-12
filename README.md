# GHOKeyboard-iOS-Objective-C
This keyboard is simple, If you encounter any questions or issues, please send mail to'lishengminbj@gmail.com'.If you think you found bug, please report it at 'Issues'.
# Installation With CocoaPods
CocoaPods is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like AFNetworking in your projects. See the "Getting Started" guide for more information. You can install it with the following command:
`$ gem install cocoapods`
To integrate GHOKeyboard into your Xcode project using CocoaPods, specify it in your Podfile:
`pod 'nill`
Then, run the following command:
`pod install`

# Usage
Import The libraries at the top of tour .m file.
`mm
#import <GHOKeyboard.h/GHOKeyboard.h>
`

* 本类分为2种View，一种是全局的键盘快速选择器（AccessoryView），一个是键盘类，键盘分为2中一种是自定义数字键盘，一般用于混淆密码输入，一种是Iterm是一种快速录入手段（Chinese）。
* Button类型：提供了2种Button的扩展。
* 键盘类型：如果小伙伴们想要扩展的的话，可以在GHOKeyboardType中扩展需要的键盘样式。
* 按键类型：使用GHOKeyButtonType来控制按键的类型，需要的扩展的小伙伴，可以在这里扩展。
* 关于是否使用KeyboardAccessoryView大家可以随意，如果不使用，完全不影响使用。


## 数据源
KeyBoard的Height是通过计算计算出来的，所以，在使用的时候，一定要在数据源已经初始化的时候，再获取Height。

##键盘类型
### 数字键盘
### iTerm键盘
