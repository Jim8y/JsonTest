//
//  NewsNearbyFrame.h
//  GPSMonitor
//
//  Created by 廖京辉 on 15/9/4.
//  Copyright (c) 2015年 郭 旭辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#import "NewsNearbyModel.h"
// 昵称字体
#define StatusCellNameFont [UIFont systemFontOfSize:15]
// 时间字体
#define StatusCellTimeFont [UIFont systemFontOfSize:12]
// 来源字体
#define StatusCellSourceFont HWStatusCellTimeFont
// 正文字体
#define StatusCellContentFont [UIFont systemFontOfSize:14]
// 距离字体
#define StatusCellDistanceFont [UIFont systemFontOfSize:12]


@class NewsNearbyModel;

@interface NewsNearbyFrame : NSObject

@property(nonatomic,strong) NewsNearbyModel *model;

/** 原创整体 */
@property (nonatomic, assign) CGRect originalViewF;
/** 头像 */
@property (nonatomic, assign) CGRect iconViewF;
/** 配图 */
@property (nonatomic, assign) CGRect photoViewF;
/** 昵称 */
@property (nonatomic, assign) CGRect nameLabelF;
/** 时间 */
@property (nonatomic, assign) CGRect timeLabelF;
/** 正文 */
@property (nonatomic, assign) CGRect contentLabelF;
/** 距离 */
@property (nonatomic, assign)  CGRect distanceLabelF;

/** cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;



@end
