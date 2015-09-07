//
//  NewsNearbyViewController.h
//  ReadBoyClassTable
//
//  Created by 廖京辉 on 15/9/3.
//  Copyright (c) 2015年 廖京辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsNearbyModel.h"
#import "NewsNearbyCell.h"
#define  LOGIN_HOST @"http://kechengbiaoge.dream.cn:8089"
@interface NewsNearbyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) NewsNearbyModel *model;

@end
