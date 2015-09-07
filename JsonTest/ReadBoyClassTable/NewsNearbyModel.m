//
//  NewsNearbyModel.m
//  ReadBoyClassTable
//
//  Created by 廖京辉 on 15/9/3.
//  Copyright (c) 2015年 廖京辉. All rights reserved.
//

#import "NewsNearbyModel.h"

@implementation NewsNearbyModel
@synthesize  ID;
@synthesize  newstype;
@synthesize  publisher;
@synthesize  publishTime;
@synthesize  content;
@synthesize  beliked;
@synthesize  filename;
@synthesize  comment;
@synthesize  distance;
/*

-(id)initWithNSDictionary:(NSDictionary *)nsd{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    ID = [nsd objectForKey:@"id"];
    newstype = [nsd objectForKey:@"newstype"];
    publisher = [nsd objectForKey:@"publisher"];
    publishTime = [nsd objectForKey:@"publishtime"];
    content = [nsd objectForKey:@"content"];
    
    beliked = [nsd objectForKey:@"beliked"];
    filename = [nsd objectForKey:@"filename"];
    
    comment = [nsd objectForKey:@"comment"];
    distance = [nsd objectForKey:@"distance"];
    
    return self;

}

-(id)initWithCoder:(NSCoder *)coder{
    if (self = [super init])
    {
        self.ID = [coder decodeObjectForKey:@"id"];
        self.newstype = [coder decodeObjectForKey:@"newstype"];
        self.publisher = [coder decodeObjectForKey:@"publisher"];
        self.publishTime = [coder decodeObjectForKey:@"publishetime"];
        self.content = [coder decodeObjectForKey:@"content"];
        self.beliked = [coder decodeObjectForKey:@"beliked"];
        self.filename = [coder decodeObjectForKey:@"filename"];
        
        self.comment = [coder decodeObjectForKey:@"comment"];
        self.distance = [coder decodeObjectForKey:@"distance"];
        
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:ID forKey:@"id"];
    [coder encodeObject:newstype forKey:@"newstype"];
    [coder encodeObject:publisher forKey:@"publisher"];
    [coder encodeObject:publishTime forKey:@"publishertime"];
    [coder encodeObject:content forKey:@"content"];
    [coder encodeObject:beliked forKey:@"beliked"];
    [coder encodeObject:filename forKey:@"filename"];
    
    [coder encodeObject:comment forKey:@"comment"];
    [coder encodeObject:distance forKey:@"distance"];

    
}
*/



@end
