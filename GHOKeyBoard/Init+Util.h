//
//  Init+Util.h
//  FCDoctorIPad
//
//  Created by 李盛民 on 2017/2/6.
//  Copyright © 2017年 Lcvem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImage (QuiteInit)

/** 颜色值转换成图片

 */
+ (UIImage *)createImageWithColor:(UIColor *)color;

@end

//TODO:
//@interface Line : NSObject
//
//@end

@interface UILabel (Util)

//TODO:
- (CGFloat)getWidthWithText:(NSString *)text Font:(UIFont *)font;
- (CGFloat)getHeightWithText:(NSString *)text Font:(UIFont *)font lableWidth:(CGFloat)width;

@end




@interface UILabel (QuiteInit)

+ (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)string;
- (void)setTextFont:(UIFont *)tFont textColor:(UIColor *)tColor textAlignment:(NSTextAlignment)tAlignment;
- (void)setBgColor:(UIColor *)bgColor cornerRadius:(CGFloat)radius;
- (void)setBorderColor:(UIColor *)borderColor width:(CGFloat)width;

+ (UILabel *)labelWithText:(NSString *)string;
+ (UILabel *)labelWithText:(NSString *)string textColor:(UIColor *)textColor;
+ (CGFloat)widthWithTitle:(NSString *)title font:(UIFont *)font ;

@end



@interface UIButton (InitUtil)

+ (UIButton *)buttonWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted target:(id)target action:(SEL)action;
+ (UIButton *)buttonWithTitle:(NSString *)title target:(id)target action:(SEL)action;
+ (UIButton *)buttonWithTitle:(NSString *)title target:(id)target action:(SEL)action textColor:(UIColor *)color;

@end
