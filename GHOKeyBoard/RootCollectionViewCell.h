//
//  RootCollectionViewCell.h
//  FCDoctorIPad
//
//  Created by Lcvem on 16/8/8.
//  Copyright © 2016年 Lcvem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootCollectionViewCell : UICollectionViewCell

+ (id)cellForCollectionView:(UICollectionView *)collectionView forNib:(UINib *)nib indexPath:(NSIndexPath *)indexPath;
+ (id)cellForCollectionview:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;
+ (NSString *)cellIdentifier;
+ (NSString *)nibName;
+ (UINib *)Nib;

/**需要子类自己实现加载逻辑*/
+ (void)initialization;

@end
