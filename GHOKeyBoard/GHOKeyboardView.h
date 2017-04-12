//
//  GHOKeyboardView.h
//  FCDoctorIPad
//
//  Created by 李盛民 on 2017/1/12.
//  Copyright © 2017年 Lcvem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyBoardConfig.h"

@class GHOKeyboardView;
@protocol GHOKeyboardViewDelegate <NSObject>

- (void)clickBtnWithKeyboardView:(GHOKeyboardView *)view editTextView:(UITextView *)textview Type:(GHOKeyButtonType)buttonType inputText:(NSString *)text;

@end

@interface GHOKeyboardView : UIView

//@property (nonatomic, strong) NSArray * dataSource;

@property (nonatomic, weak) id<GHOKeyboardViewDelegate> delegate;

- (instancetype)initKeyboardWithFrame:(CGRect)frame;
+ (instancetype)keyBoardWithFrame:(CGRect)frame;

- (void)setKetBoardBlock:(KeyboardBlock)block;

- (NSInteger)rowHeight:(NSInteger)row;



@end
