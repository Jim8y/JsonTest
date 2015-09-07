//
//  TableViewController.m
//  JsonTest
//
//  Created by 廖京辉 on 15/9/6.
//  Copyright (c) 2015年 廖京辉. All rights reserved.
//

#import "TableViewController.h"
#import "NewsNearbyFrame.h"
#import "TestViewCell.h"
#import "NewsNearbyModel.h"
#import "MJExtension.h"
#import "NSObject+MJKeyValue.h"
#import "NSObject+MJMember.h"
#import "MJExtension.h"
#import "MJConst.h"
#import "JSONKit.h"


#define  LOGIN_HOST @"http://kechengbiaoge.dream.cn:8089"

@interface TableViewController ()

@property(nonatomic,strong) NSMutableArray *statusF;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self Web];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - WebForData
-(void)Web{
    
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
    
    
//    NSString *ID;
//    NSString *newstype;
//    NSString *publisher;
//    NSString *publishTime;
//    NSString *content;
//    NSString *beliked;
//    NSArray *filename;
//    NSString *comment;
//    NSString *distance;
   // NSLog(@"!!!!!!!%@",jsonarry);
    
    NSMutableArray *modelArray = [NSMutableArray array];
    
    // 3.遍历
    for (NSDictionary *keyValues in jsonarry) {
     //   NSLog(@"00000000000000000%@",keyValues);
        NewsNearbyModel * model=[[NewsNearbyModel alloc]init];
        model.ID=[keyValues objectForKey:@"id"];
        model.beliked=[keyValues objectForKey:@"beliked"];
        model.publisher=[keyValues objectForKey:@"publisher"];
        model.publishTime=[keyValues objectForKey:@"publishtime"];
        model.content=[keyValues objectForKey:@"content"];
        model.beliked=[keyValues objectForKey:@"beliked"];
        model.distance=[keyValues objectForKey:@"distance"];
        [modelArray addObject:model];
       // NSLog(@"-----------------%@",modelArray);//[keyValues objectForKey:@"id"]);
    }

    NSMutableArray *statusFArry=[NSMutableArray array];
    
    //NSLog(@"----jsonresult %@ ",modelArray);
    for (NewsNearbyModel * dsn in modelArray) {
        //NSLog(@"!!!!!!!!!!%@",dsn);
        NewsNearbyFrame *f=[[NewsNearbyFrame alloc]init];
        f.model=dsn;
        [statusFArry addObject:f];
        NSLog(@"************%@",statusFArry);
    }
  //  NSLog(@"-----------%@",self.statusF);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
//    NewsNearbyFrame *frame=self.statusF[ind]
    return self.statusF.count;;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsNearbyFrame *frame=self.statusF[indexPath.row];//[TestViewCell cellWithTableView:tableView];
    return frame.cellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TestViewCell *cell=[TestViewCell cellWithTableView:tableView];
    cell.newsF=self.statusF[indexPath.row];

    return cell;
}
@end
