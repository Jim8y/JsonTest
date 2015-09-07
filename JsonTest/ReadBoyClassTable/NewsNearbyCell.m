//
//  NewsNearbyCell.m
//  ReadBoyClassTable
//
//  Created by 廖京辉 on 15/9/3.
//  Copyright (c) 2015年 廖京辉. All rights reserved.
//

#import "NewsNearbyCell.h"

@implementation NewsNearbyCell

@synthesize IconView,UserName,Distance,\
            Time,TextField,Image0,Image1,Image2,\
            Image3,IsLiked,LikeNum,commentIcon,commentNum;

- (void)awakeFromNib {
    // Initialization code
}



-(void)setModel:(NewsNearbyModel *)model{
    UserName.text=model.publisher;
    Distance.text=model.distance;
    TextField.text=model.content;
    LikeNum.text = model.beliked;
    commentNum.text=model.comment;
 
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
