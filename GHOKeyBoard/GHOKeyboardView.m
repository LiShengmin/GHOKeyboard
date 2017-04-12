//
//  GHOKeyboardView.m
//  FCDoctorIPad
//
//  Created by 李盛民 on 2017/1/12.
//  Copyright © 2017年 Lcvem. All rights reserved.
//

#import "GHOKeyboardView.h"

#define ITERM_HEIGTH (40)

@interface GHOKeyboardView ()

@property (nonatomic, copy) KeyboardBlock block;

@end

@implementation GHOKeyboardView

- (instancetype)initKeyboardWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

+ (instancetype)keyBoardWithFrame:(CGRect)frame {
    return [[self alloc] initWithFrame:frame];
}

- (void)setKetBoardBlock:(KeyboardBlock)block {
    self.block = block;
}

- (NSInteger)rowHeight:(NSInteger)row {
    return ITERM_HEIGTH;
}

@end
