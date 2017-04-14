//
//  Init+Util.m
//  FCDoctorIPad
//
//  Created by 李盛民 on 2017/2/6.
//  Copyright © 2017年 Lcvem. All rights reserved.
//

#import "Init+Util.h"

@implementation UIImage (QuiteInit)

/**
 *颜色值转换成图片
 */
+ (UIImage *)createImageWithColor:(UIColor *)color  {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage*theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


@end


@implementation UILabel (Util)

- (CGFloat)getWidthWithText:(NSString *)text Font:(UIFont *)font {
    UILabel * label = [[UILabel alloc] init];
    label.text = text;
    label.font = font;
    CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT,50)];
    return size.width;
}

- (CGFloat)getHeightWithText:(NSString *)text Font:(UIFont *)font lableWidth:(CGFloat)width{
    UILabel * label = [[UILabel alloc] init];
    label.text = text;
    label.font = font;
    CGSize size = [label sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return size.width;
}

@end




@implementation UILabel (QuiteInit)

+ (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)string {
    UILabel * label = [[UILabel alloc] initWithFrame:frame];
    label.text = string;
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize: 14.0];
    label.numberOfLines = 0;
    return label;
}
- (void)setTextFont:(UIFont *)tFont textColor:(UIColor *)tColor textAlignment:(NSTextAlignment)tAlignment {
    if (tFont)              self.font = tFont;
    if (tColor)             self.textColor = tColor;
    if (tAlignment)         self.textAlignment = tAlignment;
}
- (void)setBgColor:(UIColor *)bgColor cornerRadius:(CGFloat)radius {
    if (bgColor) self.backgroundColor = bgColor;
    if (radius > 0) {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
    }
}
- (void)setBorderColor:(UIColor *)borderColor width:(CGFloat)width {
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = width;
}



+ (UILabel *)lableWithText:(NSString *)string TextColor:(UIColor *)textColor Font:(UIFont *)font BGColor:(UIColor *)bgColor {
    UILabel * label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.backgroundColor = bgColor;
    label.textColor = textColor;
    label.font = font;
    label.text = string;
    return label;
}

+ (UILabel *)labelWithText:(NSString *)string {
    return [self lableWithText:string TextColor:[UIColor blackColor] Font:[UIFont systemFontOfSize: 14.0] BGColor:[UIColor clearColor]];
}

+ (UILabel *)labelWithText:(NSString *)string textColor:(UIColor *)textColor {
    return [self lableWithText:string TextColor:textColor Font:[UIFont systemFontOfSize: 14.0] BGColor:[UIColor clearColor]];
}

+ (CGFloat)widthWithTitle:(NSString *)title font:(UIFont *)font {
    CGRect rect = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, 50) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size.width;
}

@end



@implementation UIButton (InitUtil)

+ (UIButton *)buttonWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted target:(id)target action:(SEL)action {
    UIImage *image = [UIImage imageNamed:icon];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlighted] forState:UIControlStateHighlighted];
    btn.bounds = (CGRect){CGPointZero, image.size};
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    return btn;
}

+ (UIButton *)buttonWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor clearColor];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    NSDictionary *attribute = @{NSFontAttributeName: btn.titleLabel.font};
    CGSize size =  [title boundingRectWithSize:CGSizeMake(100, 200) options:NSStringDrawingTruncatesLastVisibleLine attributes:attribute context:nil].size;
    btn.frame = CGRectMake(0, 0, size.width, size.height);
    return btn;
}

+ (UIButton *)buttonWithTitle:(NSString *)title target:(id)target action:(SEL)action textColor:(UIColor *)color {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor clearColor];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    NSDictionary *attribute = @{NSFontAttributeName: btn.titleLabel.font};
    CGSize size =  [title boundingRectWithSize:CGSizeMake(100, 200) options:NSStringDrawingTruncatesLastVisibleLine attributes:attribute context:nil].size;
    btn.frame = CGRectMake(0, 0, size.width, size.height);
    return btn;
}

@end
