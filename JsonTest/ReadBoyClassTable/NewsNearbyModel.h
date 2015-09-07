//
//  NewsNearbyModel.h
//  ReadBoyClassTable
//
//  Created by 廖京辉 on 15/9/3.
//  Copyright (c) 2015年 廖京辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsNearbyModel : NSObject
/*{
    NSString *ID;
    NSString *newstype;
    NSString *publisher;
    NSString *publishTime;
    NSString *content;
    NSString *beliked;
    NSArray *filename;
    NSString *comment;
    NSString *distance;
    
}*/
@property (nonatomic,retain) NSString *ID;
@property (nonatomic,retain) NSString *newstype;
@property (nonatomic,copy)   NSString *publisher;
@property (nonatomic,retain) NSString *publishTime;
@property (nonatomic,retain) NSString *content;
@property (nonatomic,retain) NSString *beliked;
@property (nonatomic,retain) NSArray *filename;
@property (nonatomic,retain) NSString *comment;
@property (nonatomic,retain) NSString *distance;

+(id)initWithModel:(NSDictionary *)nsd;

@end
