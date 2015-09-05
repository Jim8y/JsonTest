//
//  ViewController.m
//  JsonTest
//
//  Created by 廖京辉 on 15/9/4.
//  Copyright (c) 2015年 廖京辉. All rights reserved.
//

#import "ViewController.h"
#define  LOGIN_HOST @"http://kechengbiaoge.dream.cn:8089"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self Web];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)Web{
    
    ////////
    NSString *jsondata;
    
    //TimeToShow = [NSMutableArray array];
    //ValueToShow = [NSMutableArray array];
    
    /* NSString *basepath= @"http://api.heclouds.com/devices/145588/datapoints?datastream_id=";
     NSMutableString *urlpath = [[NSMutableString alloc] initWithString:basepath];
     [urlpath appendString:@"Light"];
     [urlpath appendString:@"&limit=20"];
     
     
     NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlpath]];
     [request setTimeoutInterval:20];
     [request setHTTPMethod:@"GET"];
     [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
     [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
     [request setValue:@"0jhQbhdFSdbv5GZxcHw6Hb2gaTUA" forHTTPHeaderField:@"api-key"];
     NSURLResponse *response;
     
     NSData *returnData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];*/
    
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
    
    
   // jsondata=[self removeUnescapedCharacter:jsondata];
    
    /**
     
     NSASCIIStringEncoding = 1,		    
     NSNEXTSTEPStringEncoding = 2,
    NSJapaneseEUCStringEncoding = 3,
    NSUTF8StringEncoding = 4,
    NSISOLatin1StringEncoding = 5,
    NSSymbolStringEncoding = 6,
    NSNonLossyASCIIStringEncoding = 7,
    NSShiftJISStringEncoding = 8,
    NSISOLatin2StringEncoding = 9,
    NSUnicodeStringEncoding = 10,
    NSWindowsCP1251StringEncoding = 11,
    NSWindowsCP1252StringEncoding = 12,
    NSWindowsCP1253StringEncoding = 13,
    NSWindowsCP1254StringEncoding = 14,
    NSWindowsCP1250StringEncoding = 15,   
     NSISO2022JPStringEncoding = 21,
    NSMacOSRomanStringEncoding = 30,
    
    NSUTF16StringEncoding = NSUnicodeStringEncoding,
    
    NSUTF16BigEndianStringEncoding = 0x90000100,
    NSUTF16LittleEndianStringEncoding = 0x94000100,
    NSUTF32StringEncoding = 0x8c000100,
    NSUTF32BigEndianStringEncoding = 0x98000100,         
     NSUTF32LittleEndianStringEncoding = 0x9c000100
     */
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:returnData
                          options:NSJSONReadingMutableContainers
                          error:&error];
    NSArray* latestLoans = [json objectForKey:@"info"];
   // NSLog(@"loans: %@", latestLoans);
    
    NSLog(@"!!!!!!!!!!!!!!!%@",error);
    
    
    
    //jsondata=[NSString stringWithFormat:<#(NSString *), ...#>
    
    
    
    /*{"errno":0,
     "data":
     {"count":10,
     "datastreams":
     [{       "datapoints":
     
     [
     {"at":"2015-08-29 22:00:00.000","value":111},
     {"at":"2015-08-29 22:00:00.000","value":111},
     {"at":"2015-08-29 16:54:48.000","value":31},
     {"at":"2015-08-29 16:54:43.000","value":31},
     {"at":"2015-08-29 16:54:43.000","value":2},
     {"at":"2015-08-29 16:54:38.000","value":31},
     {"at":"2015-08-29 16:54:32.000","value":31},
     {"at":"2015-08-29 16:54:27.000","value":31},
     {"at":"2015-08-29 16:54:22.000","value":31},
     {"at":"2015-08-29 16:54:17.000","value":31}
     ],
     
     
     "id":"TestData"}
     ]},
     
     "error":"succ"}*/
    
    NSDictionary *jsonresult=[[NSDictionary alloc]init];
    jsonresult=[jsonString objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
    id json1=[NSJSONSerialization JSONObjectWithData:returnData options:0 error:nil];
   // NSDictionary *djson=[returnData objectFromJSONData];
    
     id jsonObject = [NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingAllowFragments error:&error];
    NSArray *jsonarry=[jsonresult objectForKey:@"info"];
    NSLog(@"jsonresult %@ ",jsonarry);
    
    
    
    
    
    
   // NSDictionary *jsonresults_data=[jsonresult objectForKey:@"data"];
  //  NSArray *jsonresult_datastreams = [jsonresults_data objectForKey:@"datastreams"];
    
   /* for (int i=0; i<jsonresult_datastreams.count; i++) {
        NSDictionary *item=[jsonresult_datastreams objectAtIndex:i];
        datapoints=[item objectForKey:@"datapoints"];//datapoint作为全局变量。
        for (int j=0; j<datapoints.count; j++) {
            NSDictionary *item1=[datapoints objectAtIndex:(datapoints.count-j-1)];
            NSString *at =[item1 objectForKey:@"at"];
            NSString *value=[item1 objectForKey:@"value"];
            [TimeToShow addObject:at];
            [ValueToShow addObject:value];
        }
    }
    */
    //[nc addObserver:self selector:@selector(WebDate) name:@"RefreshData" object:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSString *)removeUnescapedCharacter:(NSString *)inputStr
{
    NSCharacterSet *controlChars = [NSCharacterSet controlCharacterSet];
  //  <span style="white-space:pre">	</span>//获取那些特殊字符
    NSRange range = [inputStr rangeOfCharacterFromSet:controlChars];
    //<span style="white-space:pre">	</span>//寻找字符串中有没有这些特殊字符
    if (range.location != NSNotFound)
    {
        NSMutableString *mutable = [NSMutableString stringWithString:inputStr];
        while (range.location != NSNotFound)
        {
            [mutable deleteCharactersInRange:range];
         //   <span style="white-space:pre">	</span>//去掉这些特殊字符
            range = [mutable rangeOfCharacterFromSet:controlChars];
        }
        return mutable;
    }
    return inputStr;
}
@end
