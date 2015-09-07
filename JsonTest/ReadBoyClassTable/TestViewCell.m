//
//  TestViewCell.m
//  JsonTest
//
//  Created by 廖京辉 on 15/9/7.
//  Copyright (c) 2015年 廖京辉. All rights reserved.
//

#import "TestViewCell.h"

#import "UIImageView+WebCache.h"

@interface TestViewCell()




//@property (weak, nonatomic) IBOutlet UIImageView *IconView;
//@property (weak, nonatomic) IBOutlet UILabel *UserName;
//@property (weak, nonatomic) IBOutlet UILabel *Distance;
//@property (weak, nonatomic) IBOutlet UILabel *Time;
//@property (weak, nonatomic) IBOutlet UITextField *TextField;
//@property (weak, nonatomic) IBOutlet UIImageView *Image0;
//@property (weak, nonatomic) IBOutlet UIImageView *Image1;
//@property (weak, nonatomic) IBOutlet UIImageView *Image2;
//@property (weak, nonatomic) IBOutlet UIImageView *Image3;
//@property (weak, nonatomic) IBOutlet UIImageView *IsLiked;
//@property (weak, nonatomic) IBOutlet UILabel *LikeNum;
//@property (weak, nonatomic) IBOutlet UIImageView *commentIcon;
//@property (weak, nonatomic) IBOutlet UILabel *commentNum;


//
//@property (nonatomic,retain) NSString *ID;
//@property (nonatomic,retain) NSString *newstype;
//@property (nonatomic,copy)   NSString *publisher;
//@property (nonatomic,retain) NSString *publishTime;
//@property (nonatomic,retain) NSString *content;
//@property (nonatomic,retain) NSString *beliked;
//@property (nonatomic,retain) NSArray *filename;
//@property (nonatomic,retain) NSString *comment;
//@property (nonatomic,retain) NSString *distance;



/* 原创微博 */
/** 原创微博整体 */
@property (nonatomic, weak) UIView *originalView;
/** 头像 */
@property (nonatomic, weak) UIImageView *iconView;
/** 会员图标 */
//@property (nonatomic, weak) UIImageView *vipView;
/** 配图 */
//@property (nonatomic, weak) UIImageView *photoView;
/** 昵称 */
@property (nonatomic, weak) UILabel *nameLabel;
/** 距离 */
@property (nonatomic, weak) UILabel *disLabel;
/** 时间 */
@property (nonatomic, weak) UILabel *timeLabel;
/** 来源 */
//@property (nonatomic, weak) UILabel *sourceLabel;
/** 正文 */
@property (nonatomic, weak) UILabel *contentLabel;

@end






@implementation TestViewCell


+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID=@"status";
    TestViewCell *cell =[tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell=[[TestViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        /** 原创微博整体 */
        UIView *originalView = [[UIView alloc] init];
        [self.contentView addSubview:originalView];
        self.originalView = originalView;
        
        /** 头像 */
        UIImageView *iconView = [[UIImageView alloc] init];
        [originalView addSubview:iconView];
        self.iconView = iconView;
        
//        /** 配图 */
//        UIImageView *photoView = [[UIImageView alloc] init];
//        [originalView addSubview:photoView];
//        self.photoView = photoView;
        
        /** 昵称 */
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = StatusCellNameFont;
        [originalView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        /** 距离 */
        UILabel *disLabel = [[UILabel alloc] init];
        disLabel.font = StatusCellNameFont;
        [originalView addSubview:disLabel];
        self.disLabel = disLabel;

        
        /** 时间 */
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.font = StatusCellTimeFont;
        [originalView addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        /** 正文 */
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.font = StatusCellContentFont;
        contentLabel.numberOfLines = 0;
        [originalView addSubview:contentLabel];
        self.contentLabel = contentLabel;
    }
    return self;

}


-(void)setNewsF:(NewsNearbyFrame *)newsF{
    _newsF=newsF;
    
    NewsNearbyModel *status = newsF.model;
    //HWUser *user = status.user;
    
    /** 原创微博整体 */
    self.originalView.frame = newsF.originalViewF;
    
    /** 头像 */
    self.iconView.frame = newsF.iconViewF;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:nil] placeholderImage:[UIImage imageNamed:@"avatar_vgirl@2x.png"]];
//    
//    /** 会员图标 */
//    if (user.isVip) {
//        self.vipView.hidden = NO;
//        
//        self.vipView.frame = statusFrame.vipViewF;
//        NSString *vipName = [NSString stringWithFormat:@"common_icon_membership_level%d", user.mbrank];
//        self.vipView.image = [UIImage imageNamed:vipName];
//        
//        self.nameLabel.textColor = [UIColor orangeColor];
//    } else {
//        self.nameLabel.textColor = [UIColor blackColor];
//        self.vipView.hidden = YES;
//    }
    
//    /** 配图 */
//    self.photoView.frame = statusFrame.photoViewF;
//    self.photoView.backgroundColor = [UIColor redColor];
    
    /** 昵称 */
    self.nameLabel.text = newsF.model.publisher;
    self.nameLabel.frame = newsF.nameLabelF;
    
    /** 时间 */
    self.timeLabel.text = newsF.model.publishTime;
    self.timeLabel.frame = newsF.timeLabelF;
    
//    /** 来源 */
//    self.sourceLabel.text = status.source;
//    self.sourceLabel.frame = statusFrame.sourceLabelF;
    
    /** 正文 */
    self.contentLabel.text = newsF.model.content;
    self.contentLabel.frame = newsF.contentLabelF;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
