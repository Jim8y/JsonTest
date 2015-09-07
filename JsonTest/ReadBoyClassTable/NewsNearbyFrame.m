//
//  NewsNearbyFrame.m
//  GPSMonitor
//
//  Created by 廖京辉 on 15/9/4.
//  Copyright (c) 2015年 郭 旭辉. All rights reserved.
//

#import "NewsNearbyFrame.h"
#import "NewsNearbyModel.h"
#define StatusCellBorderW 10
@implementation NewsNearbyFrame


- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font
{
    return [self sizeWithText:text font:font maxW:MAXFLOAT];
}

- (void)setModel:(NewsNearbyModel *)model
{
    _model = model;
  
    
//    @property (nonatomic,retain) NSString *ID;
//    @property (nonatomic,retain) NSString *newstype;
//    @property (nonatomic,copy)   NSString *publisher;
//    @property (nonatomic,retain) NSString *publishTime;
//    @property (nonatomic,retain) NSString *content;
//    @property (nonatomic,retain) NSString *beliked;
//    @property (nonatomic,retain) NSArray *filename;
//    @property (nonatomic,retain) NSString *comment;
//    @property (nonatomic,retain) NSString *distance;

    
    
    
    // cell的宽度
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    
    /* 原创 */
    
    /** 头像 */
    CGFloat iconWH = 35;
    CGFloat iconX = StatusCellBorderW;
    CGFloat iconY = StatusCellBorderW;
    self.iconViewF = CGRectMake(iconX, iconY, iconWH, iconWH);
    
    /** 昵称 */
    CGFloat nameX = CGRectGetMaxX(self.iconViewF) + StatusCellBorderW;
    CGFloat nameY = iconY;
    CGSize nameSize = [self sizeWithText:model.publisher font:StatusCellNameFont];
    self.nameLabelF = (CGRect){{nameX, nameY}, nameSize};
    
    /** 距离 */
    CGFloat distanceX = nameX;
    CGFloat distanceY = CGRectGetMaxY(self.nameLabelF) + StatusCellBorderW;
    CGSize distanceSize = [self sizeWithText:model.publisher font:StatusCellDistanceFont];
    self.nameLabelF = (CGRect){{distanceX, distanceY}, distanceSize};
    
    /** 时间 */
    CGFloat timeX = CGRectGetMaxX(self.distanceLabelF)+StatusCellBorderW;
    CGFloat timeY = distanceY;
    CGSize timeSize = [self sizeWithText:model.publishTime font:StatusCellTimeFont];
    self.timeLabelF = (CGRect){{timeX, timeY}, timeSize};
    
    
    /** 正文 */
    CGFloat contentX = iconX;
    CGFloat contentY = MAX(CGRectGetMaxY(self.iconViewF), CGRectGetMaxY(self.timeLabelF)) + StatusCellBorderW;
    CGFloat maxW = cellW - 2 * contentX;
    CGSize contentSize = [self sizeWithText:model.content font:StatusCellContentFont maxW:maxW];
    self.contentLabelF = (CGRect){{contentX, contentY}, contentSize};
    
    /** 配图 */
    
    
    /** 原创整体 */
    CGFloat originalX = 0;
    CGFloat originalY = 0;
    CGFloat originalW = cellW;
    CGFloat originalH = CGRectGetMaxY(self.contentLabelF) + StatusCellBorderW;
    self.originalViewF = CGRectMake(originalX, originalY, originalW, originalH);
    
    
    self.cellHeight = CGRectGetMaxY(self.originalViewF);
}
@end

