//
//  ViewController.m
//  JsonTest
//
//  Created by 廖京辉 on 15/9/4.
//  Copyright (c) 2015年 廖京辉. All rights reserved.
//

#import "ViewController.h"
#define  LOGIN_HOST @"http://kechengbiaoge.dream.cn:8089"
#import "TableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self Web];
    // Do any additional setup after loading the view, typically from a nib.
    
}


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
    
   // NSLog(@"jsonresult %@ ",jsonarry);
    
    
    
    
    
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeView:(id)sender {
    TableViewController *helpViewController=[[TableViewController alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:helpViewController];
    [nav.navigationBar setBarTintColor:[UIColor colorWithRed:247/255.0f green:112/255.0f blue:76/255.0f alpha:0.8f]];
    [helpViewController setTitle:@""];
    [nav.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];
    [self presentViewController:nav animated:true completion:^void{}];

    
}
@end
