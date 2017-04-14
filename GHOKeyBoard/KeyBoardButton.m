//
//  KeyBordButton.m
//  FCDoctorIPad
//
//  Created by 李盛民 on 2017/1/12.
//  Copyright © 2017年 Lcvem. All rights reserved.
//

#import "KeyBoardButton.h"
#import "Masonry/Masonry/Masonry.h"

@interface KeyBoardButton ()

@property (nonatomic, copy) ButtonClickBlock block;

@end

@implementation KeyBoardButton

+ (instancetype)keyButtonWithFrame:(CGRect)frame {
    return [[self alloc] initWithFrame:frame];
}

- (instancetype)initKeyButtonWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
       self.titleLabel.font = [UIFont systemFontOfSize: 14.0];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        // [self setBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [self addTarget:self action:@selector(keyClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)setButtonClickBlock:(ButtonClickBlock)block {
    self.block = block;
}

- (void)keyClicked:(KeyBoardButton *)sender {
    NSString * selectText = @"";
    if (self.type == GHOKeyButtonTypeNomal) {
        selectText = sender.titleLabel.text;
    }
    self.block(self.type, selectText);
}

@end

@interface KeyBoardTitleButton ()

@property (nonatomic, strong) ButtonClickBlock block;

@end

@implementation KeyBoardTitleButton

+ (instancetype)keyButtonWithFrame:(CGRect)frame {
    return [[self alloc] initWithFrame:frame];
}

- (instancetype)initKeyButtonWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize: 12.0];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 15, 0, 0)];
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        // [self setBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [self addTarget:self action:@selector(keyClicked:) forControlEvents:UIControlEventTouchUpInside];

        UILabel * dootLabel = [[UILabel alloc] init];
        [self addSubview:dootLabel];
        dootLabel.backgroundColor = [UIColor blackColor];
        [dootLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY).offset(0);
            make.left.equalTo(self.mas_left).offset(3);
            make.height.width.mas_offset(6);
        }];
    }
    return self;
}

- (void)setButtonClickBlock:(ButtonClickBlock)block {
    self.block = block;
}

- (void)keyClicked:(KeyBoardTitleButton *)sender {
    NSString * selectText = @"";
    if (self.type == GHOKeyButtonTypeNomal) {
        selectText = sender.titleLabel.text;
    }
    self.block(self.type, selectText);
}


@end
