//
//  KeyBordButton.h
//  FCDoctorIPad
//
//  Created by 李盛民 on 2017/1/12.
//  Copyright © 2017年 Lcvem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyBoardConfig.h"

@interface KeyBoardButton : UIButton

@property (nonatomic, assign) GHOKeyButtonType type;

+ (instancetype)keyButtonWithFrame:(CGRect)frame;
- (instancetype)initKeyButtonWithFrame:(CGRect)frame;

- (void)setButtonClickBlock:(ButtonClickBlock)block;

@end



@interface KeyBoardTitleButton : UIButton

@property (nonatomic, assign) GHOKeyButtonType type;

+ (instancetype)keyButtonWithFrame:(CGRect)frame;
- (instancetype)initKeyButtonWithFrame:(CGRect)frame;

- (void)setButtonClickBlock:(ButtonClickBlock)block;

@end
