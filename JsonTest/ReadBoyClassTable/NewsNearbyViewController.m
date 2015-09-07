//
//  NewsNearbyViewController.m
//  ReadBoyClassTable
//
//  Created by 廖京辉 on 15/9/3.
//  Copyright (c) 2015年 廖京辉. All rights reserved.
//

#import "NewsNearbyViewController.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"
#import "NewsNearbyModel.h"
#import "NSObject+MJKeyValue.h"
#import "NSObject+MJMember.h"
#import "MJConst.h"
#import "NewsNearbyFrame.h"
#import "JSONKit.h"
@interface NewsNearbyViewController ()

@end

@implementation NewsNearbyViewController{
    
       AFHTTPRequestOperation *operation;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadData{
        
        // 将 "微博字典"数组 转为 "微博模型"数组
       // NSArray *newStatuses = [NewsNearbyModel objectArrayWithKeyValuesArray:responseObject[@"info"]];
    
        NSString *jsondata;
        
        NSString *basepath= LOGIN_HOST;
        NSMutableString *urlpath = [[NSMutableString alloc] initWithString:basepath];
        [urlpath appendString:@"/CurriculumPro/DiscoveryPage?action=getNearbyNews"];
        [urlpath appendString:@"&latitude="];
        [urlpath appendString:@"28.18427958"];
        [urlpath appendString:@"&longitude="];
        [urlpath appendString:@"112.94138975334002"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlpath]];
        [request setTimeoutInterval:20];
        NSURLResponse *response;
        
        
        NSData *returnData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
        
        jsondata=[[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
        
        
        
        NSString *jsonString = [jsondata stringByReplacingOccurrencesOfString:@"\r" withString:@""];
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\s" withString:@""];
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\v" withString:@""];
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\f" withString:@""];
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\b" withString:@""];
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\a" withString:@""];
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\e" withString:@""];
        
        NSDictionary *jsonresult=[[NSDictionary alloc]init];
        jsonresult=[jsonString objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
        NSArray *jsonarry=[jsonresult objectForKey:@"info"];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"警告" message:@"网络请求失败，请确认网络连接..." delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        
        if (jsonresult==NULL) {
            [alert show];
        }
        
    //NSLog(@"jsonresult %@ ",jsonarry);
    
    
    

    
    
    // 将 HWStatus数组 转为 HWStatusFrame数组
    // NSArray *newFrames = [self stausFramesWithStatuses:newStatuses];
    
    NSMutableArray *frames = [NSMutableArray array];
    for (NewsNearbyModel *status in jsonarry) {
        NewsNearbyFrame *f = [[NewsNearbyFrame alloc] init];
        f.model = status;
        [frames addObject:f];
    }



}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
