//
//  NewsNearbyCell.h
//  ReadBoyClassTable
//
//  Created by 廖京辉 on 15/9/3.
//  Copyright (c) 2015年 廖京辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsNearbyModel.h"

@interface NewsNearbyCell : UITableViewCell{
    
}
@property (weak, nonatomic) IBOutlet UIImageView *IconView;
@property (weak, nonatomic) IBOutlet UILabel *UserName;
@property (weak, nonatomic) IBOutlet UILabel *Distance;
@property (weak, nonatomic) IBOutlet UILabel *Time;
@property (weak, nonatomic) IBOutlet UITextField *TextField;
@property (weak, nonatomic) IBOutlet UIImageView *Image0;
@property (weak, nonatomic) IBOutlet UIImageView *Image1;
@property (weak, nonatomic) IBOutlet UIImageView *Image2;
@property (weak, nonatomic) IBOutlet UIImageView *Image3;
@property (weak, nonatomic) IBOutlet UIImageView *IsLiked;
@property (weak, nonatomic) IBOutlet UILabel *LikeNum;
@property (weak, nonatomic) IBOutlet UIImageView *commentIcon;
@property (weak, nonatomic) IBOutlet UILabel *commentNum;

@property(strong,nonatomic) NewsNearbyModel *model;


@end
