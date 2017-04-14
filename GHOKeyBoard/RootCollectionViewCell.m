//
//  RootCollectionViewCell.m
//  FCDoctorIPad
//
//  Created by Lcvem on 16/8/8.
//  Copyright © 2016年 Lcvem. All rights reserved.
//

#import "RootCollectionViewCell.h"

@implementation RootCollectionViewCell

+ (id)cellForCollectionView:(UICollectionView *)collectionView forNib:(UINib *)nib indexPath:(NSIndexPath *)indexPath {
    NSString * cellID = [self cellIdentifier];
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    if (!cell) {
        NSArray * nibObjects = [nib instantiateWithOwner:nil options:nil];
        NSAssert2(([nibObjects count] > 0) && [[nibObjects objectAtIndex:0] isKindOfClass:[self class]], @"Nib '%@' does not appear to contain a valid %@", [self nibName], NSStringFromClass([self class]));
        cell = [nibObjects objectAtIndex:0];
    }
    return cell;
}

+ (id)cellForCollectionview:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    NSString * cellID = [self cellIdentifier];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    [self initialization];
    
    return cell;
}

+ (NSString *)cellIdentifier{
    return NSStringFromClass([self class]);
}

+ (NSString *)nibName {
    return [self cellIdentifier];
}

+ (UINib *)Nib {
    NSBundle * classBundle = [NSBundle bundleForClass:[self class]];
    return [UINib nibWithNibName:[self nibName] bundle:classBundle];
}

+ (void)initialization {
    
}

@end
