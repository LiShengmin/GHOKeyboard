//
//  GHOKeyboardNumberView.m
//  FCDoctorIPad
//
//  Created by 李盛民 on 2017/1/12.
//  Copyright © 2017年 Lcvem. All rights reserved.
//

#import "GHOKeyboardNumberView.h"

static NSInteger const KeyboardNumberKeyCount = 12;
static NSInteger const KeyboardNumberDelIndex = 9;
static NSInteger const KeyboardNumberDoneIndex = 11;

@interface GHOKeyboardNumberView ()

@property (nonatomic, strong) NSArray * numberKeys;
@property (nonatomic, copy)  KeyboardBlock block;

@end

@implementation GHOKeyboardNumberView

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];

    int row = 4;
    int column = 3;

    CGFloat keyWidth = frame.size.width / column;
    CGFloat keyHeight = frame.size.height / row;
    CGFloat keyX = 0;
    CGFloat keyY = 0;

    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < KeyboardNumberKeyCount; i++) {
        KeyBoardButton *button = [KeyBoardButton keyButtonWithFrame:CGRectMake(keyX, keyY, keyWidth, keyHeight)];
        [self addSubview:button];
        // WS(weakSelf);
        [button setButtonClickBlock:^(GHOKeyButtonType buttonType, NSString *text) {
            self.block(buttonType, text);
        }];
        [array addObject:button];
        if (i == KeyboardNumberDelIndex) {
            button.type = GHOKeyButtonTypeDel;
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        } else if (i == KeyboardNumberDoneIndex) {
            button.type = GHOKeyButtonTypeDone;
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        } else {
            button.type = GHOKeyButtonTypeNomal;
        }

        keyX += keyWidth;

        if ((i + 1) % column == 0) {
            keyX = 0;
            keyY += keyHeight;
        }
    }
    self.numberKeys = array;

    // 水平分隔线
    CGFloat viewX = 0;
    CGFloat viewY = 0;
    CGFloat viewW = frame.size.width;
    CGFloat viewH = 0.5;
    for (int i = 0; i < row; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
        // view.backgroundColor = [UIColor colorWithHexs:@"#dfdfdf"];
        [self addSubview:view];

        viewY += keyHeight;
    }

    // 垂直分隔线
    viewX = keyWidth;
    viewY = 0;
    viewW = 0.5;
    viewH = frame.size.height;
    for (int i = 0; i < column - 1; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
        // view.backgroundColor = [UIColor colorWithHexs:@"#dfdfdf"];
        [self addSubview:view];

        viewX += keyWidth;
    }
}

- (void)exchangeNumber {
    NSMutableArray *numbers = [NSMutableArray array];

    int startNum = 0;
    int length = 10;

    for (int i = startNum; i < length; i++) {
        [numbers addObject:[NSString stringWithFormat:@"%d", i]];
    }

    for (int i = 0; i < self.numberKeys.count; i++) {
        KeyBoardButton *button = self.numberKeys[i];

        if (i == KeyboardNumberDelIndex) {
            [button setTitle:[KeyBoardConfig deleteButtonTextWithKeyBoardType:GHOKeyBoardTypeNumber] forState:UIControlStateNormal];
            continue;
        } else if (i == KeyboardNumberDoneIndex) {
            [button setTitle:[KeyBoardConfig doneButtonTextWithKeyBoardType:GHOKeyBoardTypeNumber] forState:UIControlStateNormal];
            continue;
        }

        int index = arc4random() % numbers.count;
        [button setTitle:numbers[index] forState:UIControlStateNormal];

        [numbers removeObjectAtIndex:index];
    }
}

@end
