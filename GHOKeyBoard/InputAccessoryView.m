//
//  InputAccessoryView.m
//  FCDoctorIPad
//
//  Created by 李盛民 on 2017/1/17.
//  Copyright © 2017年 Lcvem. All rights reserved.
//

#import "InputAccessoryView.h"
#import "GHOKeyboardNumberView.h"
#import "GHOKeyboardSpecialView.h"
#import "UITextView+Extension.h"
#import "Masonry/Masonry/Masonry.h"

#define KEYBOARDBTNTAG (123)
#define FUNCKEYBTNTAG (322)

@interface InputAccessoryView ()

@property (nonatomic, strong) NSMutableArray * keyboardBtns;

@end

@implementation InputAccessoryView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView * bgImageView = [[UIImageView alloc] initWithFrame:self.frame];
        bgImageView.image = [UIImage imageNamed:@"keyboard-inputaccessory-bg"];
        [self addSubview:bgImageView];
        [self initizial];
    }
    return self;
}

- (void)initizial {
    /*标签类按钮*/
    if (!_keyboardBtns) _keyboardBtns = [NSMutableArray array];
    UIButton * systemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    systemBtn.frame = CGRectMake(0, 0, 0, 0);
    systemBtn.tag = 0 + KEYBOARDBTNTAG;
    systemBtn.selected = YES;
    [systemBtn setImage:[UIImage imageNamed:@"keyboard-system"]               forState:UIControlStateNormal];
    [systemBtn setImage:[UIImage imageNamed:@"keyboard-system-highlighted"]   forState:UIControlStateHighlighted];
    [systemBtn setImage:[UIImage imageNamed:@"keyboard-system-selected"]        forState:UIControlStateSelected];
    [systemBtn addTarget:self action:@selector(switchKeyboardBtnAction:) forControlEvents:UIControlEventTouchUpInside];


    UIButton * specialBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    specialBtn.frame = CGRectMake(0, 0, 0, 0);
    specialBtn.tag = 1 + KEYBOARDBTNTAG;
    [specialBtn setImage:[UIImage imageNamed:@"keyboard-item"]               forState:UIControlStateNormal];
    [specialBtn setImage:[UIImage imageNamed:@"keyboard-item-highlighted"]   forState:UIControlStateHighlighted];
    [specialBtn setImage:[UIImage imageNamed:@"keyboard-item-selected"]        forState:UIControlStateSelected];
    [specialBtn addTarget:self action:@selector(switchKeyboardBtnAction:) forControlEvents:UIControlEventTouchUpInside];

    [_keyboardBtns addObject:systemBtn];
    [_keyboardBtns addObject:specialBtn];
    [self addSubview:specialBtn];
    [self addSubview:systemBtn];

    UILabel * keyboardLine = [[UILabel alloc] init];
    keyboardLine.backgroundColor =[UIColor lightGrayColor];
    [self addSubview:keyboardLine];

    [@[specialBtn, systemBtn] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.width.mas_offset(150);
    }];

    [systemBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(5);
    }];
    [specialBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(systemBtn.mas_right).offset(5);
    }];
    [keyboardLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.mas_height).multipliedBy(0.5);
        make.width.mas_offset(0.5f);
        make.left.equalTo(specialBtn.mas_right).offset(0);
    }];



    UIButton * clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    clearBtn.frame = CGRectMake(0, 0, 0, 0);
    clearBtn.tag = GHOKeyButtonTypeClear + FUNCKEYBTNTAG;
    [clearBtn setImage:[UIImage imageNamed:@"keyboard-trash"]                  forState:UIControlStateNormal];
    [clearBtn setImage:[UIImage imageNamed:@"keyboard-trash-highlighted"]      forState:UIControlStateHighlighted];
    [clearBtn addTarget:self action:@selector(tapFunctionkeyBtnAction:) forControlEvents:UIControlEventTouchUpInside];


    UIButton * doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    doneBtn.frame = CGRectMake(0, 0, 0, 0);
    doneBtn.tag = GHOKeyButtonTypeDone + FUNCKEYBTNTAG;
    [doneBtn setImage:[UIImage imageNamed:@"keyboard-done"]                  forState:UIControlStateNormal];
    [doneBtn setImage:[UIImage imageNamed:@"keyboard-done-highlighted"]      forState:UIControlStateHighlighted];
    [doneBtn addTarget:self action:@selector(tapFunctionkeyBtnAction:) forControlEvents:UIControlEventTouchUpInside];

    UIButton * delBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    delBtn.frame = CGRectMake(0, 0, 0, 0);
    delBtn.tag = GHOKeyButtonTypeDel + FUNCKEYBTNTAG;
    [delBtn setImage:[UIImage imageNamed:@"keyboard-backspace"]                  forState:UIControlStateNormal];
    [delBtn setImage:[UIImage imageNamed:@"keyboard-backspace-highlighted"]      forState:UIControlStateHighlighted];
    [delBtn addTarget:self action:@selector(tapFunctionkeyBtnAction:) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:doneBtn];
    [self addSubview:clearBtn];
    [self addSubview:delBtn];

    [@[clearBtn, doneBtn, delBtn] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.width.mas_offset(100);
    }];

    [doneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(0);
    }];
    [delBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(doneBtn.mas_left).offset(0);
    }];
    [clearBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(delBtn.mas_left).offset(0);
    }];
}

- (void)switchKeyboardBtnAction:(UIButton *)sender {
    for (UIButton * btn in _keyboardBtns) {
        btn.selected = NO;
    }
    sender.selected = YES;
    if (sender.tag - KEYBOARDBTNTAG == 1) {
        self.type = GHOKeyBoardTypeCustom;
        [_delegate inputAccessoryView:self switchoverKeyboardType:GHOKeyBoardTypeCustom];
    }else {
        self.type = GHOKeyBoardTypeSystem;
        [_delegate inputAccessoryView:self switchoverKeyboardType:GHOKeyBoardTypeSystem];
    }
}

- (void)tapFunctionkeyBtnAction:(UIButton *)functionkey {
    if (_delegate) {
        switch (functionkey.tag - FUNCKEYBTNTAG) {
            case GHOKeyButtonTypeDel:
                [_delegate inputAccessoryView:self switchKeyType:GHOKeyButtonTypeDel];
                break;
            case GHOKeyButtonTypeDone:
                [_delegate inputAccessoryView:self switchKeyType:GHOKeyButtonTypeDone];
                break;
            case GHOKeyButtonTypeClear:
                [_delegate inputAccessoryView:self switchKeyType:GHOKeyButtonTypeClear];
                break;
            default:
                break;
        }
    }
}

- (void)dealloc {

}
@end
