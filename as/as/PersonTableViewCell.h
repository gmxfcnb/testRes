//
//  PersonTableViewCell.h
//  as
//
//  Created by mason on 2019/6/20.
//  Copyright © 2019 mason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
NS_ASSUME_NONNULL_BEGIN

@interface PersonTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel*labelUserName;
@property(nonatomic,strong)UILabel*labelPhone;
@property(nonatomic,strong)UILabel*labelAddress;
@property (nonatomic, strong) Person *model;

@end

NS_ASSUME_NONNULL_END
