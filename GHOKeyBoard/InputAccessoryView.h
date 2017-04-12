//
//  InputAccessoryView.h
//  FCDoctorIPad
//
//  Created by 李盛民 on 2017/1/17.
//  Copyright © 2017年 Lcvem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyBoardConfig.h"
@class InputAccessoryView;

@protocol InputAccessoryViewDelegate <NSObject>

- (void)inputAccessoryView:(InputAccessoryView *)view switchoverKeyboardType:(GHOKeyBoardType)type;
- (void)inputAccessoryView:(InputAccessoryView *)view switchKeyType:(GHOKeyButtonType)type;

@end

typedef void(^selectButtonIndex)(GHOKeyBoardType keyboardType);

@interface InputAccessoryView : UIView

@property (nonatomic, weak) id <InputAccessoryViewDelegate> delegate;
@property (nonatomic, assign) GHOKeyBoardType type;

@end









//@property (nonatomic, strong) UITextView * textView;
//@property (nonatomic, assign) NSInteger selectIndex;
//- (void)setSpecialKeyboardDataWithTitles:(NSArray *)titles groupIterms:(NSArray <NSArray *>*)itermsArr;
/*点击键盘回调的方法*/
//@property (nonatomic, copy) void(^inputViewBlock)(UIView * keybordView);
//@property (nonatomic, copy) void(^switchoverKeyboardType) (NSInteger indexpath, GHOKeyBoardType type);
