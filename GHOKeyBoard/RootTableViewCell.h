//
//  RootTableViewCell.h
//  FCDoctorIPad
//
//  Created by Lcvem on 16/8/8.
//  Copyright © 2016年 Lcvem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootTableViewCell : UITableViewCell

+ (id)cellForTableView:(UITableView *)tableView forNib:(UINib *)nib;
+ (id)cellForTableView:(UITableView *)tableView;
+ (NSString *)cellIdentifier;
+ (NSString *)nibName;
+ (UINib *)Nib;

- (id)initWithCellIdentifier:(NSString *)cellID;

@end
