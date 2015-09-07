//
//  TestViewCell.h
//  JsonTest
//
//  Created by 廖京辉 on 15/9/7.
//  Copyright (c) 2015年 廖京辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsNearbyFrame.h"
#import "NewsNearbyModel.h"
@interface TestViewCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic,strong) NewsNearbyFrame * newsF;

@end
