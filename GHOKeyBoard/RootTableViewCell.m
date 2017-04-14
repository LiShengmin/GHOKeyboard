//
//  RootTableViewCell.m
//  FCDoctorIPad
//
//  Created by Lcvem on 16/8/8.
//  Copyright © 2016年 Lcvem. All rights reserved.
//

#import "RootTableViewCell.h"

@implementation RootTableViewCell

+ (id)cellForTableView:(UITableView *)tableView forNib:(UINib *)nib {
    NSString * cellID = [self cellIdentifier];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        NSArray * nibObjects = [nib instantiateWithOwner:nil options:nil];
        NSAssert2(([nibObjects count] > 0) && [[nibObjects objectAtIndex:0] isKindOfClass:[self class]], @"Nib '%@' does not appear to contain a valid %@", [self nibName], NSStringFromClass([self class]));
        cell = [nibObjects objectAtIndex:0];
    }
    return cell;
}

+ (id)cellForTableView:(UITableView *)tableView{
    NSString * cellID = [self cellIdentifier];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[self alloc] initWithCellIdentifier:cellID];
    }
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

- (id)initWithCellIdentifier:(NSString *)cellID{
    return [self initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
}

@end
