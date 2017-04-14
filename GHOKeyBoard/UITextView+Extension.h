//
//  UITextField+Extension.h
//  FCDoctorIPad
//
//  Created by Lcvem on 16/9/26.
//  Copyright © 2016年 Lcvem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Extension)

- (NSInteger)curOffset;
- (void)makeOffset:(NSInteger)offset;
- (void)makeOffsetFromBeginning:(NSInteger)offset;

- (void)changetext:(NSString *)text;

@end
