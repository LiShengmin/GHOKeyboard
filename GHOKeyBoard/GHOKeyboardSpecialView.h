//
//  GHOKeyboardSpecialView.h
//  FCDoctorIPad
//
//  Created by 李盛民 on 2017/1/12.
//  Copyright © 2017年 Lcvem. All rights reserved.
//

#import "GHOKeyboardView.h"
#import "RootTableViewCell.h"
#import "RootCollectionViewCell.h"
#import "KeyBoardButton.h"

@class GHOKeyboardSpecialView;
@protocol SpecialViewDataSource <NSObject>

- (NSArray *)titlesWithSpecial:(GHOKeyboardSpecialView *)special;
- (NSArray *)itermsArrWithSpecial:(GHOKeyboardSpecialView *)special;
- (UITextView *)editTextViewWithSpecial:(GHOKeyboardSpecialView *)special;

@end

@interface GHOKeyboardSpecialView : GHOKeyboardView

@property (nonatomic, weak) id <SpecialViewDataSource> dataSource;

- (void)setTitles:(NSArray *)titles itermsAtGroups:(NSArray *)itermsArr;
- (void)reloadView;

/**提供给外部可操作的方法*/
- (void)changeTextView:(UITextView *)textView KeyType:(GHOKeyButtonType)type Text:(NSString *)text;

@end




@interface SpeciaViewCell : RootTableViewCell

- (void)setTitleWithString:(NSString *)titleStr size:(CGSize)size;
- (void)setItermWithIterms:(NSArray *)iterms itermSizeWidth:(NSArray <NSNumber *>*)itermSizeWidth;

- (void)setButtonBlcok:(KeyboardBlock)block;

@end

@interface SpeciaViewCellIterm : RootCollectionViewCell

- (void)initWithTitle:(NSString *)title keyButtonType:(GHOKeyButtonType)type;

@end
