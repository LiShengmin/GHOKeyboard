//
//  KeyBordConfig.h
//  FCDoctorIPad
//
//  Created by 李盛民 on 2017/1/12.
//  Copyright © 2017年 Lcvem. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, GHOKeyButtonType) {
    GHOKeyButtonTypeDel,    // 按键类型：删除
    GHOKeyButtonTypeDone,   // 按键类型：完成
    GHOKeyButtonTypeClear,  // 按键类型：清空
    GHOKeyButtonTypeSystem, // 按键类型：返回系统键盘
    GHOKeyButtonTypeNomal,  // 按键类型：其他
};

typedef NS_ENUM(NSUInteger, GHOKeyBoardType) {
    GHOKeyBoardTypeNumber,
    GHOKeyBoardTypeChinese,
    GHOKeyBoardTypeCustom,
    GHOKeyBoardTypeSystem,
};

typedef void(^KeyboardBlock)(GHOKeyButtonType type, NSString *text);
typedef void(^ButtonClickBlock)(GHOKeyButtonType buttonType, NSString * text);

@interface KeyBoardConfig : NSObject

+ (NSInteger)keyBordHeightWithKeyBoardType:(GHOKeyBoardType)type;

+ (NSString *)deleteButtonTextWithKeyBoardType:(GHOKeyBoardType)type;
+ (NSString *)doneButtonTextWithKeyBoardType:(GHOKeyBoardType)type;
+ (NSString *)systemButtonTextWithKeyBoardType:(GHOKeyBoardType)type;

@end
