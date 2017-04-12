//
//  GHOKeyboardSpecialView.m
//  FCDoctorIPad
//
//  Created by 李盛民 on 2017/1/12.
//  Copyright © 2017年 Lcvem. All rights reserved.
//

#import "GHOKeyboardSpecialView.h"
#import "UITextView+Extension.h"

@interface GHOKeyboardSpecialView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray * titles;
@property (nonatomic, strong) NSArray * itermsArr;
@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, assign) NSInteger * itermWidth;
@property (nonatomic, strong) NSArray * itermWidthArr;

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, copy)   KeyboardBlock block;

@end

@implementation GHOKeyboardSpecialView{
    NSInteger iterm_W_Unit;//
    CGFloat   title_W_Unit;//titleButton宽度（titleButton等宽）

    NSArray * itermsArr_W;
    NSArray * titles_H;

}

- (void)setFrame:(CGRect)frame {
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)reloadView {
    if (_dataSource) {
        if ([_dataSource titlesWithSpecial:self].count >0) {
            _titles = [_dataSource titlesWithSpecial:self];
        }
        if ([_dataSource itermsArrWithSpecial:self].count >0) {
            _itermsArr = [_dataSource itermsArrWithSpecial:self];
        }
        if ([_dataSource editTextViewWithSpecial:self]) {
            _textView = [_dataSource editTextViewWithSpecial:self];
        }
    }
    [self viewReload];
}

- (void)viewReload {
    [self setItermWidthAndTitleWidthWithTitles:_titles itermsAtGroups:_itermsArr];
    [self setTitlesHAnditermsArrWWithTitles:_titles itermsAtGroups:_itermsArr];
    [self.tableView reloadData];
}

- (void)setTitles:(NSArray *)titles itermsAtGroups:(NSArray *)itermsArr {
    _titles = titles;
    _itermsArr = itermsArr;
    [self viewReload];
}


#pragma mark- Private
- (NSInteger)maxItermAtRow:(NSInteger)row {
    return 15;
}

- (void)setItermWidthAndTitleWidthWithTitles:(NSArray *)titles itermsAtGroups:(NSArray *)itermsArr {
    CGFloat ViewW = CGRectGetWidth(self.frame);
    iterm_W_Unit = floor((ViewW-([self maxWidthWithTitles:titles Font:[UIFont font1]]+13))/[self maxItermAtRow:0]);
    title_W_Unit = ViewW -iterm_W_Unit*[self maxItermAtRow:0];
}

- (void)setTitlesHAnditermsArrWWithTitles:(NSArray *)titles itermsAtGroups:(NSArray *)itermsArr {
    if (iterm_W_Unit == 0 || title_W_Unit == 0) return;
    itermsArr_W     = [self itermsArr_WidthWithItermsAtGroups:itermsArr];
    titles_H        = [self titlesHeigthWithItermsArr_W:itermsArr_W];
}

- (NSArray *)titlesHeigthWithItermsArr_W:(NSArray *)itermss_W {
    NSMutableArray * titsH = [NSMutableArray array];
    for (NSArray * itermsWint_Arr in itermss_W) {
        [titsH addObject:@([self titleHeightWithItermsWint_Arr:itermsWint_Arr])];
    }
    return [NSArray arrayWithArray:titsH];
}

- (NSInteger)titleHeightWithItermsWint_Arr:(NSArray <NSNumber *>*)itermsWint_Arr {
    NSInteger Hint = 1;
    NSInteger Wint = 0;
    for (NSNumber * itermW_int in itermsWint_Arr) {
        Wint += [itermW_int integerValue];
        if (Wint > [self maxItermAtRow:0]) {
            Hint += 1;
            Wint = [itermW_int integerValue];
        }
    }
    return Hint;
}

- (NSArray *)itermsArr_WidthWithItermsAtGroups:(NSArray *)itermsArr{
    NSMutableArray * itermssW = [NSMutableArray array];
    for (NSArray * iterms in itermsArr) {
        [itermssW addObject:[self itermsWidthWithIterms:iterms]];
    }
    return [NSArray arrayWithArray:itermssW];
}

- (NSArray *)itermsWidthWithIterms:(NSArray *)iterms {
    NSMutableArray * itermsWidth = [NSMutableArray array];
    for (NSString * iterm in iterms) {
        NSInteger itermW = ceil(([UILabel widthWithTitle:iterm font:[UIFont font1]])/iterm_W_Unit);
        [itermsWidth addObject:@(itermW)];
    }
    return itermsWidth;
}

- (CGFloat)maxWidthWithTitles:(NSArray *)titles Font:(UIFont *)font {
    CGFloat maxWidth = 0;
    for (NSString * title in titles) {
        CGFloat titleW = [UILabel widthWithTitle:title font:font];
        if (maxWidth < titleW) {
            maxWidth = titleW;
        }
    }
    return maxWidth;
}

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView * tableView = [[UITableView alloc] init];
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 170;
        [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [tableView registerClass:[SpeciaViewCell class] forCellReuseIdentifier:[SpeciaViewCell cellIdentifier]];
        tableView.frame = CGRectMake(0, 64+ 55, self.frame.size.width, [KeyBoardConfig keyBordHeightWithKeyBoardType:GHOKeyBoardTypeCustom]);
        _tableView = tableView;
    }
    return _tableView;
}

#pragma mark- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SpeciaViewCell * cell = [SpeciaViewCell cellForTableView:tableView];
    [cell setTitleWithString:self.titles[indexPath.row] size:CGSizeMake(title_W_Unit, [titles_H[indexPath.row] integerValue])];
    WS(ws);
    [cell setItermWithIterms:self.itermsArr[indexPath.row] itermSizeWidth:[self itermsWidthWithItermsWIndex:itermsArr_W[indexPath.row]]];
    [cell setButtonBlcok:^(GHOKeyButtonType type, NSString *text) {
        if (ws.block) {
            ws.block(type, text);
        }
        if (self.delegate) {
            [self.delegate clickBtnWithKeyboardView:self editTextView:_textView Type:type inputText:text];
        }else {
            [self changeTextView:self.textView KeyType:type Text:text];
        }
    }];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ([self rowHeight:indexPath.row] * [titles_H[indexPath.row] integerValue]);
}

- (NSArray *)itermsWidthWithItermsWIndex:(NSArray *)iterms_W{
    NSMutableArray * widths = [NSMutableArray array];
    for (NSNumber * itermIdex in iterms_W) {
        [widths addObject:@([itermIdex integerValue] * iterm_W_Unit)];
    }
    return [NSArray arrayWithArray:widths];
}

- (void)changeTextView:(UITextView *)textView KeyType:(GHOKeyButtonType)type Text:(NSString *)text{
    switch (type) {
        case GHOKeyButtonTypeDel: {
            [textView changetext:@""];
        }
            break;

        case GHOKeyButtonTypeDone: {
            [textView resignFirstResponder];
        }
            break;

        case GHOKeyButtonTypeNomal: {
            [textView changetext:text];
        }
            break;
        case GHOKeyButtonTypeSystem: {
            [textView resignFirstResponder];
            textView.inputView = nil;
            [textView becomeFirstResponder];
        }
            break;
        case GHOKeyButtonTypeClear: {
            textView.text = nil;
        }
            break;
        default:
            break;
    }
}

- (void)dealloc {
    _textView = nil;
}

@end









@interface SpeciaViewCell () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) KeyBoardTitleButton * titleBtn;
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, copy)   KeyboardBlock block;

@end

@implementation SpeciaViewCell{
    GHOKeyButtonType type;
    NSArray * dataSource;
    NSArray * itermSize_W;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initizial];
    }
    return self;
}

- (void)initizial {
    [self.contentView addSubview:self.titleBtn];
    [self.contentView addSubview:self.collectionView];
    
    [self.titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.width.mas_offset(10);
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (KeyBoardTitleButton *)titleBtn {
    if (!_titleBtn) {
        _titleBtn = [[KeyBoardTitleButton alloc] initKeyButtonWithFrame:CGRectMake(0, 0, 50, 50)];
        _titleBtn.type = GHOKeyButtonTypeNomal;
        WS(ws);
        [_titleBtn setButtonClickBlock:^(GHOKeyButtonType buttonType, NSString *text) {
            if ([text isEqualToString:@"常用"]) {
                ws.block(GHOKeyButtonTypeDel, @"");
            }else {
                ws.block(buttonType, text);
            }
        }];
    }
    return _titleBtn;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.minimumLineSpacing = 0.00000001;
        flowLayout.minimumInteritemSpacing = 0.0000001;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.userInteractionEnabled = NO;
        _collectionView.scrollEnabled = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.userInteractionEnabled = YES;
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[SpeciaViewCellIterm class] forCellWithReuseIdentifier:[SpeciaViewCellIterm cellIdentifier]];
    }
    return _collectionView;
}

- (void)setButtonBlcok:(KeyboardBlock)block {
    self.block = block;
}

- (void)setTitleWithString:(NSString *)titleStr size:(CGSize)size {
    [self.titleBtn setTitle:titleStr forState:UIControlStateNormal];
    [self.titleBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.width.mas_offset(size.width);
    }];
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(size.width -2);
    }];
}

- (void)setItermWithIterms:(NSArray <NSString *>*)iterms itermSizeWidth:(NSArray<NSNumber *> *)itermSizeWidth {
    dataSource = iterms;
    itermSize_W = itermSizeWidth;
    [self.collectionView reloadData];
}

#pragma mark-UICollectionViewDataSource
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake([itermSize_W[indexPath.row] integerValue], 40);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SpeciaViewCellIterm * cell = [SpeciaViewCellIterm cellForCollectionview:collectionView indexPath:indexPath];
    [cell initWithTitle:dataSource[indexPath.row] keyButtonType:GHOKeyButtonTypeNomal];
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.layer.borderColor = [UIColor bonder3Color].CGColor;
    cell.layer.borderWidth = 0.5f;
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return dataSource.count;
}

#pragma mark- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.block) {
        self.block(GHOKeyButtonTypeNomal, dataSource[indexPath.row]);
    }
}

@end

@implementation SpeciaViewCellIterm {
    UILabel * titleLabel;
    GHOKeyButtonType btnType;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        titleLabel = [UILabel labelWithText:@"" textColor:[UIColor blackColor]];
        titleLabel.font = [UIFont font1];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:titleLabel];
//        titleLabel.frame = self.contentView.frame;
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            MAS_MAKE_ZERO(self.contentView);
        }];
    }
    return self;
}

- (void)initWithTitle:(NSString *)title keyButtonType:(GHOKeyButtonType)type {
    titleLabel.text = title;
    btnType = type;
}

@end
