//
//  KeyBordConfig.m
//  FCDoctorIPad
//
//  Created by 李盛民 on 2017/1/12.
//  Copyright © 2017年 Lcvem. All rights reserved.
//

#import "KeyBoardConfig.h"

@implementation KeyBoardConfig

+ (NSInteger)keyBordHeightWithKeyBoardType:(GHOKeyBoardType)type {
    switch (type) {
        case GHOKeyBoardTypeNumber : return 250;
        case GHOKeyBoardTypeCustom : return 400;
        case GHOKeyBoardTypeChinese : return 100;
        case GHOKeyBoardTypeSystem: return 0;
    }
}

+ (NSString *)deleteButtonTextWithKeyBoardType:(GHOKeyBoardType)type {
    return @"删除";
}
+ (NSString *)doneButtonTextWithKeyBoardType:(GHOKeyBoardType)type {
    return @"完成";
}
+ (NSString *)systemButtonTextWithKeyBoardType:(GHOKeyBoardType)type {
    return @"中文";
}

@end
